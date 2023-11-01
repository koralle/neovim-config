local capabilities = vim.lsp.protocol.make_client_capabilities()

require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      completion = {
        displayContext = 1,
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
      format = {
        enable = false,
      },
      hint = {
        enable = true,
        setType = true,
      },
    },
  },
  capabilities = capabilities,
})
