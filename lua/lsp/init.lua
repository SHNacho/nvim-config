local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Enable the following language servers
local servers = { 'pyright', 'texlab' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {}
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- Example: Setup for `pyright`
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

lspconfig.pyright.setup {
	capabilities = capabilities,
	settings = {
		python = {
			pythonPath = get_python_path(),
			analysis = {
				typeCheckingMode = "off",
            	reportUnusedExpression = false
		  	}
	  	}
  	}
}

-- Setup for texlab
lspconfig.texlab.setup {
  capabilities = capabilities,
  settings = {
    texlab = {
	  rootDirectory="./",
	  diagnosticsDelay=1000,
      build = {
        executable = "latexmk",
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
        onSave = true
      },
      forwardSearch = {
        executable = "zathura",
        args = { "--synctex-forward", "%l:1:%f", "%p" }
      },
      chktex = {
        onOpenAndSave = false,
        onEdit = false 
      },
      lint = {
        onChange = false 
      }
    }
  }
}
