vim.o.number = true           -- Show line numbers
vim.o.relativenumber = true   -- Relative line numbers
vim.o.hlsearch = true         -- Highlight search results
vim.o.shiftwidth = 4          -- Number of spaces for indentation
vim.o.tabstop = 4             -- Number of spaces per tab
vim.o.smartindent = true      -- Smart indentation

-- Colors for floating windows
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#1e222a' })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#ffffff' })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#ffffff' }) -- Example with green border

-- Colors for Popup menus
vim.api.nvim_set_hl(0, 'Pmenu', { fg = '#c5c8c6', bg = '#1e1e1e' })          -- Popup menu background and foreground
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = '#ffffff', bg = '#005f87' })       -- Selected item background and foreground
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = '#3e4451' })                      -- Scrollbar background
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = '#61afef' })

-- Theme
vim.cmd.colorscheme "catppuccin-mocha"

-- Troubles
-- vim.cmd [[autocmd! CursorHold * lua vim.diagnostic.config({ virtual_lines = { only_current_line = true } })]]

-- Open neo-tree when nvim starts
    vim.api.nvim_create_autocmd("VimEnter", {
      command = "set nornu nonu | Neotree toggle",
    })
    vim.api.nvim_create_autocmd("BufEnter", {
      command = "set rnu nu",
    })
