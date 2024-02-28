local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local server = {
  capabilities = capabilities,
  init_options = {
    provideFormatter = false,
  },
}

return server
