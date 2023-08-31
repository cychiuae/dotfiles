local lint = require("lint")
lint.linters_by_ft = {
	javascript = { "eslint" },
	javascriptreact = { "eslint" },
	typescript = { "eslint" },
	typescriptreact = { "eslint" },
}

local lintGroup = vim.api.nvim_create_augroup("LintAutoCommands", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = lintGroup,
	callback = function()
		lint.try_lint()
	end,
})
