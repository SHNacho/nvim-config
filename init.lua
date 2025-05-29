require('settings')
require('keybindings')
require('autocmds')
if not vim.g.vscode then
	require('plugins')
	require('plugins.cmp')
	require('plugins.gitsigns')
	require('plugins.lualine')
	require('plugins.treesitter')
	require('plugins.dap')
	require('plugins.autopairs')
	require('plugins.comment')
	require('plugins.surround')
	require('plugins.bufferline')
	require('plugins.mason') -- must be before lsp
	require('plugins.lint')
	require('lsp')
end

