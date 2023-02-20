require("mason").setup({})

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls", --lua
	},
})

require("mason-null-ls").setup({
	ensure_installed = {
		"eslint_d",
		"prettierd",
		"stylua",
	},
})
