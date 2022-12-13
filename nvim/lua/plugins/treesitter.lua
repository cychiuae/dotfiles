-- The default parser_install_dir is managed by nix, which is readonly
-- so we need to use anther path
local parser_install_dir = '~/.config/nvim-plugins/treesitter/parsers'
vim.opt.runtimepath:append(parser_install_dir)

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "lua",
    "nix",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  parser_install_dir = parser_install_dir,
}