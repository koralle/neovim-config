require("ddc_source_lsp_setup").setup()

require("lspconfig").emmet_language_server.setup({
  filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
  init_options = {},
})
