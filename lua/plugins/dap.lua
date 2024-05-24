local dap = require('dap')
local dapui = require('dapui')

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
    pythonPath = function()
      return '${workspaceFolder}/.venv/bin/python' -- Modify as needed
    end,
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
    pythonPath = function()
      return '/usr/bin/python' -- Modify as needed
    end,
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
    pythonPath = function()
      return '${workspaceFolder}/venv/bin/python' -- Modify as needed
    end,
  },
}

-- UI setup
dapui.setup()
require('nvim-dap-virtual-text').setup()

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

