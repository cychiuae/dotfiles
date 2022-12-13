-- line number
vim.opt.number = true

-- leader key
vim.g.mapleader = ","

-- Tab size
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- hidden chars
vim.opt.list = true
vim.opt.listchars = {
  lead = '⋅',
  trail = '⋅',
  space = '⋅',
  tab = '>-',
}

-- clibboard
vim.opt.clipboard = "unnamedplus"

-- autocomplete
vim.o.completeopt = "menu,menuone,noselect"

-- Format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format{}]]

-- Tabs
vim.api.nvim_set_keymap('n', '<Leader>t', ':tabnew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':tabprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':tabnext<CR>', { noremap = true, silent = true })

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('plugins.bufferline')
require('plugins.cmp')
require('plugins.indentblankline')
require('plugins.lsp')
require('plugins.lualine')
require('plugins.nullls')
require('plugins.telescope')
require('plugins.tree')
require('plugins.treesitter')
require('theme')
