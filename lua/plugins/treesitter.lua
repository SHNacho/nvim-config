require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "python", "latex" }, -- Install language parsers
  highlight = {
    enable = true,              -- Enable highlighting
    additional_vim_regex_highlighting = false,
  },
}

