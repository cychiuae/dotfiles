local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
		pickers = {
			find_files = {
				find_command = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--ignore",
					"--hidden",
					-- Explicitly ignore .git because it is a hidden file that is not in .gitignore.
					-- https://github.com/BurntSushi/ripgrep/issues/1509#issuecomment-595942433
					"--glob='!**/.git/*'",
				},
			},
		},
	},
})

vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
