require("ddc_nvim_lsp_setup").setup()

vim.g.markdown_fenced_languages = {
  "ts=typescript",
}

local lspconfig = require("lspconfig")
lspconfig.denols.setup({
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
  deno = {
    enable = true,
    suggest = {
      imports = {
        hosts = {
          ["https://crux.land"] = true,
          ["https://deno.land"] = true,
          ["https://x.next.land"] = true,
        },
      },
    },
  },
})
