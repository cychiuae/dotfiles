local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.diagnostics.eslint_d.with({
			prefer_local = "node_modules/.bin",
		}),
		null_ls.builtins.formatting.nixpkgs_fmt,
		null_ls.builtins.formatting.prettierd.with({
			prefer_local = "node_modules/.bin",
		}),
		null_ls.builtins.formatting.stylua,
	},
})
