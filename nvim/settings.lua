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

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('plugins.indentblankline')
require('plugins.lsp')
require('plugins.telescope')
require('plugins.tree')
require('plugins.treesitter')
require('theme')

