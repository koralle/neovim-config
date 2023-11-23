---@type fun(server_name: string): nil
---@param server_name string LSP-Server name
---@return nil
local load_lspconfig = function(server_name)
  local config_path = "koralle.plugins.lsp." .. server_name
  require(config_path)
end

---@type fun(modes: string, lhr: string, rhr: string, desc: string): nil
local set_keymap = function(modes, lhr, rhr, desc)
  vim.keymap.set(modes, lhr, rhr, { remap = false, silent = true, desc = desc })
end

---@type LazySpec
local spec = {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        pip = {
          upgrade_pip = true,
        },
        ui = {
          width = 0.8,
          height = 0.9,
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "denols",
          "lua_ls",
          "rust_analyzer",
          "tsserver",
          "volar",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      load_lspconfig("lua-ls")
      load_lspconfig("tsserver")
      load_lspconfig("volar")
      load_lspconfig("rust-analyzer")
      load_lspconfig("deno-ls")
    end,
  },
}

return spec
