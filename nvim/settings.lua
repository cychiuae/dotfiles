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
	lead = "⋅",
	trail = "⋅",
	space = "⋅",
	tab = ">-",
}

-- Faster esc
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 5

-- clibboard
vim.opt.clipboard = "unnamedplus"

-- autocomplete
vim.o.completeopt = "menu,menuone,noselect"

-- Format on save
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format{}]])

-- Tabs / Buffers
vim.api.nvim_set_keymap("n", "<C-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>q", ":bdelete<CR>", { noremap = true, silent = true })

-- Lazy redraw
-- People say this will make nvim faster
vim.opt.lazyredraw = true

-- bracket
vim.opt.showmatch = true

-- Direct write to files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.hidden = true

vim.opt.mouse = "a"

-- Helpful column line
vim.wo.colorcolumn = "80,120"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("plugins.bufferline")
require("plugins.cmp")
require("plugins.indentblankline")
-- need to load mason before lsp
require("plugins.mason")
require("plugins.lsp")
require("plugins.lualine")
require("plugins.nullls")
require("plugins.telescope")
require("plugins.tree")
require("plugins.treesitter")
require("theme")
