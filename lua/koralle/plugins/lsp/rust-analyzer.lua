require("ddc_nvim_lsp_setup").setup()

require("lspconfig").rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {},
  },
})
