require('mason').setup {
}

require('mason-lspconfig').setup {
  ensure_installed = {
    "angularls", -- angularls
    "sumneko_lua", --lua
    "rnix", -- nix
    "tsserver", -- js/ts
  },
}
