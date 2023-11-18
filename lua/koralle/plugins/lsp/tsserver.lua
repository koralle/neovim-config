require("ddc_nvim_lsp_setup").setup()

local lspconfig = require("lspconfig")
lspconfig.tsserver.setup({
  root_dir = lspconfig.util.root_pattern("package.json"),
})
