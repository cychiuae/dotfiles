local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local make_on_attach = function(options)
  local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

    local disable_formatting = options.disable_formatting or false
    if (disable_formatting) then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end
  end
  return on_attach
end

-- angular
lspconfig["angularls"].setup {
  on_attach = make_on_attach {},
  capabilities = capabilities,
}

-- lua
lspconfig["sumneko_lua"].setup {
  on_attach = make_on_attach {
    disable_formatting = true,
  },
  capabilities = capabilities,
}

-- nix
lspconfig["rnix"].setup {
  on_attach = make_on_attach {},
  capabilities = capabilities,
}

-- typescript
lspconfig["tsserver"].setup {
  on_attach = make_on_attach {
    disable_formatting = true,
  },
  capabilities = capabilities,
}
