require("ddc_source_lsp_setup").setup()

require("lspconfig").rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {},
  },
})
