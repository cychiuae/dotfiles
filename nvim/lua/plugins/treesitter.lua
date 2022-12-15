-- The default parser_install_dir is managed by nix, which is readonly
-- so we need to use anther path
local parser_install_dir = "~/.config/nvim-plugins/treesitter/parsers"
vim.opt.runtimepath:append(parser_install_dir)

require("nvim-treesitter.configs").setup({
	autotag = {
		enable = true,
	},
	ensure_installed = {
		"bash",
		"cmake",
		"css",
		"dockerfile",
		"go",
		"gomod",
		"graphql",
		"html",
		"java",
		"javascript",
		"json",
		"kotlin",
		"lua",
		"make",
		"markdown",
		"nix",
		"python",
		"rust",
		"scss",
		"sql",
		"swift",
		"tsx",
		"typescript",
		"vim",
		"vue",
		"yaml",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	parser_install_dir = parser_install_dir,
})
