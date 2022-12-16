require("mason").setup({})

require("mason-lspconfig").setup({
	ensure_installed = {
		"sumneko_lua", --lua
	},
})

require("mason-null-ls").setup({
	ensure_installed = {
		"eslint_d",
		"prettier",
		"stylua",
	},
})
