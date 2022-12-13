require('nvim-tree').setup({
  open_on_setup = false,
  open_on_setup_file = false,
  renderer = {
    icons = {
      glyphs = {
        git = {
          unstaged = "M",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
	view = {
		mappings = {
			list = {
				{ key = "<C-n>", action = "create"}
			},
		},
	},
})

vim.opt.termguicolors = true
vim.api.nvim_set_keymap('n', '<C-b>', ':NvimTreeToggle <CR>', {noremap = true, silent = true})

