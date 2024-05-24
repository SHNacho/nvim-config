## Directory structure
```
~/.config/nvim/
├── init.lua
└── lua/
    ├── plugins.lua
    ├── settings.lua
    ├── lsp/
    │   └── init.lua
    ├── keybindings.lua
    ├── autocmds.lua
    └── plugins/
        ├── treesitter.lua
        └── ...
```

1. init.lua: The main configuration file that sources all other configuration files.
2. lua/: Directory containing all Lua configuration scripts.
    - plugins.lua: Plugin management and plugin-specific configurations.
    - settings.lua: General Neovim settings and options.
    - lsp/: Directory for LSP-related configurations.
        - init.lua: Entry point for LSP configurations, sourcing other LSP configurations if needed.
    - keybindings.lua: Custom keybindings.
    - autocmds.lua: Auto commands and event-based configurations.
    - plugins/: Directory for configurations of individual plugins.
