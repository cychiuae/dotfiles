local lspconfig = require("lspconfig")

-- local lsp_defaults = lspconfig.util.default_config
-- lsp_defaults.capabilities =
-- 	vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local make_on_attach = function(options)
	local on_attach = function(client, bufnr)
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "g?", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

		local bufopts = { noremap = true, silent = true, buffer = bufnr }

		vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, bufopts)
		vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, bufopts)
		vim.keymap.set("n", "gI", require("telescope.builtin").lsp_implementations, bufopts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
		vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, bufopts)
		vim.keymap.set("n", "<C-n>", vim.lsp.buf.code_action, bufopts)

		local disable_formatting = options.disable_formatting or false
		if disable_formatting then
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end
	end
	return on_attach
end

-- angular
-- lspconfig["angularls"].setup({
-- 	on_attach = make_on_attach({}),
-- 	capabilities = capabilities,
-- })

-- c# dotnet
lspconfig["omnisharp"].setup({
	capabilities = capabilities,
	on_attach = make_on_attach({}),
	cmd = {
		"omnisharp",
	},
})

-- golang
lspconfig["gopls"].setup({
	capabilities = capabilities,
	on_attach = make_on_attach({}),
})

-- lua
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = make_on_attach({
		disable_formatting = true,
	}),
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = make_on_attach({}),
})

-- nix
lspconfig["nil"].setup({
	capabilities = capabilities,
	on_attach = make_on_attach({}),
})

-- tailwind
-- lspconfig["tailwindcss"].setup({
-- 	on_attach = make_on_attach({}),
-- })

-- typescript
lspconfig["tsserver"].setup({
	capabilities = capabilities,
	on_attach = make_on_attach({
		disable_formatting = true,
	}),
})

-- vim.api.nvim_set_keymap("n", "<C-n>", ":CodeActionMenu<CR>", { noremap = true, silent = true })
-- vim.g.code_action_menu_show_details = false
