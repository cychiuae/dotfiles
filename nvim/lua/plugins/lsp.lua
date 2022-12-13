local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
end


-- lua
lspconfig["sumneko_lua"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- nix
lspconfig["rnix"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- typescript
lspconfig["tsserver"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

