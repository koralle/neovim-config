require("lspconfig").lua_ls.setup({
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if
      not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc")
    then
      client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = vim.api.nvim_get_runtime_file("", true),
          },
          diagnostics = {
            enable = true,
            globals = {
              "vim",
            },
          },
          format = {
            enable = false,
          },
          hint = {
            enable = true,
          },
        },
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
  end,
})
