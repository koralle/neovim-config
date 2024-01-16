require("ddc_source_lsp_setup").setup()

---@param names string[]
---@return string[]
local function get_plugin_paths(names)
  local plugins = require("lazy.core.config").plugins
  local paths = {}
  for _, name in ipairs(names) do
    if plugins[name] then
      table.insert(paths, vim.fs.joinpath(plugins[name].dir, "lua"))
    else
      vim.notify("Invalid plugin name: " .. name, "ERROR")
    end
  end
  return paths
end

---@param plugins string[]
---@return string[]
local function library(plugins)
  local paths = get_plugin_paths(plugins)
  table.insert(paths, vim.fs.joinpath(vim.fn.stdpath("config"), "lua"))
  table.insert(paths, vim.fs.joinpath(vim.env.VIMRUNTIME, "lua"))
  table.insert(paths, "${3rd}/luv/library")
  return paths
end

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
            pathStrict = true,
            path = { "?.lua", "?/init.lua" },
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = library({ "lazy.nvim" }),
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
