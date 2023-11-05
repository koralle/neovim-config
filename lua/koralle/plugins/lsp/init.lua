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
          "azure_pipelines_ls",
          "bashls",
          "bufls",
          "cssls",
          "cssmodules_ls",
          "denols",
          "dockerls",
          "docker_compose_language_service",
          "emmet_language_server",
          "gopls",
          "gradle_ls",
          "graphql",
          "groovyls",
          "html",
          "jsonls",
          "jdtls",
          "kotlin_language_server",
          "lua_ls",
          "prismals",
          "pyright",
          "rust_analyzer",
          "taplo",
          "tailwindcss",
          "terraformls",
          "tsserver",
          "vimls",
          "volar",
          "yamlls",
          "zls",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("ddc_nvim_lsp_setup").setup({})
      load_lspconfig("lua-ls")
      load_lspconfig("tsserver")
      load_lspconfig("pyright")
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      local lspsaga = require("lspsaga")
      lspsaga.setup({})

      set_keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", "Lspaga hover_doc")
      set_keymap("n", "gh", "<cmd>Lspsaga lsp_finder<cr>", "Lspaga lsp_finder")
      set_keymap("n", "gD", vim.lsp.buf.declaration, "vim.lsp.buf.declaration()")
      set_keymap("n", "gd", "<cmd>Lspsaga goto_definition<cr>", "Lspsaga goto_definition")
      set_keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<cr>", "Lspsaga goto_type_definition")
      set_keymap("n", "gi", vim.lsp.buf.implementation, "vim.lsp.buf.implementation()")
      set_keymap("n", "gr", "<cmd>Lspsaga rename<cr>", "Lspsaga rename")
      set_keymap("n", "ca", "<cmd>Lspsaga code_action<cr>", "Lspsaga code_action")
      set_keymap(
        "n",
        "<leader>sl",
        "<cmd>Lspsaga show_line_diagnostics<cr>",
        "Lspsaga show_line_diagnostics"
      )
      set_keymap(
        "n",
        "<leader>sc",
        "<cmd>Lspsaga show_cursor_diagnostics<cr>",
        "Lspsaga show_cursor_diagnostics"
      )
      set_keymap(
        "n",
        "<leader>sb",
        "<cmd>Lspsaga show_buf_diagnostics<cr>",
        "Lspsaga show_buf_diagnostics"
      )
      set_keymap("n", "<leader>o", "<cmd>Lspsaga outline<cr>", "Lspsaga outline")
      set_keymap("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<cr>", "Lspsaga incoming_calls")
      set_keymap("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<cr>", "Lspsaga outgoing_calls")
    end,
    event = {
      "LspAttach",
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
}

return spec
