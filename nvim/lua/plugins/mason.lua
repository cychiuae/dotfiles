require("mason").setup({})

require("mason-lspconfig").setup({
	ensure_installed = {
		"angularls", -- angularls
		"sumneko_lua", --lua
		"rnix", -- nix
	},
})

require("mason-null-ls").setup({
	ensure_installed = {
		"eslint_d",
		"prettier",
		"stylua",
	},
})
