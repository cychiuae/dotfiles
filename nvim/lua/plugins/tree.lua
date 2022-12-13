require('nvim-tree').setup()

vim.opt.termguicolors = true
vim.api.nvim_set_keymap('n', '<C-b>', ':NvimTreeToggle <CR>', {noremap = true, silent = true})
