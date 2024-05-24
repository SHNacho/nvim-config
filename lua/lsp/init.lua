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
lspconfig.pyright.setup {
  capabilities = capabilities,
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
