-- Import nvim-autopairs safely
local autopairs = require("nvim-autopairs")

-- Configure autopairs
autopairs.setup({
	check_ts = true, -- Enable treesitter
	disable_filetype = { "TelescopePrompt", "spectre_panel" },
})

-- Import nvim-autopairs completion functionality safely
local cmp_autopairs_setup, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_setup then
	return
end

-- Import nvim-cmp plugin safely (completions plugin)
local cmp_setup, cmp = pcall(require, "cmp")
if not cmp_setup then
	return
end

-- Make autopairs and completion work together
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
