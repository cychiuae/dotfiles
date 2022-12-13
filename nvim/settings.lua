-- line number
vim.opt.number = true

-- leader key
vim.g.mapleader = ","

require('plugins.lsp')
require('plugins.treesitter')
require('theme')
