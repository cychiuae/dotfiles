local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-n>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
		["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
		["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
		{ name = "nvim_lsp_signature_help" },
	}, {
		{ name = "buffer" },
	}),
	formatting = {
		format = require("lspkind").cmp_format({
			mode = "text_symbol", -- show only symbol annotations
		}),
	},
})
