local dap = require('dap')
local dapui = require('dapui')

-- Function to get the Python interpreter from the virtual environment
local function get_python_path()
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return vim.env.VIRTUAL_ENV .. '/bin/python'
  end
  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({'venv', '.venv'}) do
    local match = vim.fn.glob(vim.fn.getcwd() .. '/' .. pattern)
    if match ~= '' then
      return match .. '/bin/python'
    end
  end
  -- Fallback to system Python.
  return '/usr/bin/python'
end

-- Define DAP adapter for Python
dap.adapters.python = {
  type = 'executable',
  command = 'python',
  args = { '-m', 'debugpy.adapter' },
}

-- Define configurations for Python, including FastAPI
dap.configurations.python = {
  {
    -- Configuration 1: Launch file
    type = 'python',
    request = 'launch',
    name = 'Launch file',
    program = '${file}',
	cwd = '${workspaceFolder}',
    pythonPath = get_python_path(),
	env = { PYTHONPATH = "${workspaceFolder}" } -- Add workspace to PYTHONPATH
  },
  {
    -- Configuration 2: Launch with arguments
    type = 'python',
    request = 'launch',
    name = 'Launch with arguments',
    program = '${file}',
    args = function()
      local input = vim.fn.input('Arguments: ')
      return vim.split(input, ' ')
    end,
    pythonPath = get_python_path()
  },
  {
    -- Configuration 3: Debug FastAPI
    name = 'Debug FastAPI',
    type = 'python',
    request = 'launch',
	module = 'uvicorn', 
	args = {'app.main:app', '--host', '127.0.0.1', '--port', '8000'},
    justMyCode = false, -- Set to false to debug third-party code if needed
	cwd = '${workspaceFolder}',
    pythonPath = get_python_path()
  },
}

-- UI setup
dapui.setup()
-- require('nvim-dap-virtual-text').setup()

-- Automatically open/close dapui
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
--dap.listeners.before.event_terminated['dapui_config'] = function()
--  dapui.close()
--end
--dap.listeners.before.event_exited['dapui_config'] = function()
--  dapui.close()
--end

