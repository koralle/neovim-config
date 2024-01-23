local typescript_lib = os.getenv("TYPESCRIPT_LIB")
local server = {
  filetypes = {
    "vue",
  },
  init_options = {
    typescript = {
      tsdk = typescript_lib,
    },
  },
}

return server
