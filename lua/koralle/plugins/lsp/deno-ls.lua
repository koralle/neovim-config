require("ddc_nvim_lsp_setup").setup()

vim.g.markdown_fenced_languages = {
  "ts=typescript",
}

require("lspconfig").denols.setup({})
