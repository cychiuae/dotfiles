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

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<C-f>", builtin.live_grep, {})
vim.keymap.set("n", "<C-g>", builtin.git_files, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
