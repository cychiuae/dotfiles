-- line number
vim.opt.number = true

-- leader key
vim.g.mapleader = ","

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('plugins.lsp')
require('plugins.tree')
require('plugins.treesitter')
require('theme')
