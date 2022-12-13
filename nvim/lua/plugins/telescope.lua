local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--ignore',
      '--hidden',
      '--color=never',
      -- Explicitly ignore .git because it is a hidden file that is not in .gitignore.
      -- https://github.com/BurntSushi/ripgrep/issues/1509#issuecomment-595942433
      '--glob=!.git/',
    },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  }
}

vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>Telescope find_files<cr>',  {noremap = true, silent = true})

