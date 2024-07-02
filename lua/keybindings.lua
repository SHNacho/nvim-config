local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap space as leader key
vim.g.mapleader = ' '

-- Neotree
map('n', '<F2>', ':Neotree toggle<CR>', opts)

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)

-- Move between splits
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Move between buffers
map('n', '<C-Tab>', ':b#<CR>', opts)
map('n', '<leader>bn', ':bnext<CR>', opts)
map('n', '<leader>bp', ':bprev<CR>', opts)

-- LSP
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

-- Debugging keybindings
map('n', '<F5>', '<Cmd>lua require\'dap\'.continue()<CR>', opts)
map('n', '<F10>', '<Cmd>lua require\'dap\'.step_over()<CR>', opts)
map('n', '<F11>', '<Cmd>lua require\'dap\'.step_into()<CR>', opts)
map('n', '<F12>', '<Cmd>lua require\'dap\'.step_out()<CR>', opts)
map('n', '<Leader>bb', '<Cmd>lua require\'dap\'.toggle_breakpoint()<CR>', opts)
map('n', '<Leader>B', '<Cmd>lua require\'dap\'.set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)
map('n', '<Leader>dr', '<Cmd>lua require\'dap\'.repl.open()<CR>', opts)
map('n', '<Leader>dl', '<Cmd>lua require\'dap\'.run_last()<CR>', opts)
map('n', '<Leader>dc', '<Cmd>lua require\'dap\'.continue()<CR>', opts)  -- Continue or start debugging
map('n', '<Leader>ds', '<Cmd>lua require\'dap\'.terminate()<CR>', opts)  -- Stop debugging
map('n', '<Leader>dp', '<Cmd>lua require\'dap\'.pause()<CR>', opts)      -- Pause debugging
map('n', '<Leader>dq', '<Cmd>lua require\'dap\'.close()<CR>', opts)      -- Close the DAP session
map('n', '<Leader>di', '<Cmd>lua require\'dap.ui.widgets\'.hover()<CR>', opts) -- Inspect

-- Keybinding to select and run a DAP configuration
map('n', '<Leader>dc', '<Cmd>lua require\'dap\'.continue()<CR>', opts)
map('n', '<Leader>df', '<Cmd>lua require\'dap\'.run_to_cursor()<CR>', opts)
map('n', '<Leader>dg', '<Cmd>lua require\'dap\'.run({name = vim.fn.input("Config name: ")})<CR>', opts)
map('n', '<Leader>du', '<Cmd>lua require("dapui").toggle()<CR>', opts)

