local lint = require("lint")

lint.linters_by_ft = {
    terraform = { "tflint", "sqlfluff" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
    callback = function()
        require("lint").try_lint()
    end,
})

