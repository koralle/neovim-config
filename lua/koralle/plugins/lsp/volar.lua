local typescript_lib = os.getenv("TYPESCRIPT_LIB")

require("lspconfig").volar.setup({
  filetypes = {
    "vue",
  },
  init_options = {
    typescript = {
      tsdk = typescript_lib,
    },
  },
})
