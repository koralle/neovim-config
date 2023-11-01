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
      local lspconfig = require("lspconfig")
    end
  }
}

return spec

