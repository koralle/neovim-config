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
      require("ddc_nvim_lsp_setup").setup({
        override_capabilities = true,
        respect_trigger = true,
      })
      load_lspconfig("lua-ls")
      load_lspconfig("tsserver")
      load_lspconfig("pyright")
      load_lspconfig("volar")
      load_lspconfig("jsonls")
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
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = { "LspAttach" },
    config = function()
      local null_ls = require("null-ls")
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics

      null_ls.setup({
        sources = {
          -- Lua
          diagnostics.luacheck.with({}),
          formatting.stylua.with({
            condition = function(utils)
              return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
            end,
          }),

          -- JavaScript/TypeScript (Biome)
          formatting.biome.with({
            condition = function(utils)
              return utils.root_has_file({ "biome.json" })
            end,
            prefer_local = "node_modules/.bin",
          }),

          -- JavaScript/TypeScript (ESLint)
          diagnostics.eslint.with({
            condition = function(utils)
              return utils.root_has_file({
                "eslint.config.js",
                ".eslintrc.js",
                ".eslintrc.cjs",
                ".eslintrc.yaml",
                ".eslintrc.yml",
                ".eslintrc.json",
              })
            end,
            prefer_local = "node_modules/.bin",
          }),
          formatting.eslint.with({
            condition = function(utils)
              return utils.root_has_file({
                "eslint.config.js",
                ".eslintrc.js",
                ".eslintrc.cjs",
                ".eslintrc.yaml",
                ".eslintrc.yml",
                ".eslintrc.json",
              })
            end,
            prefer_local = "node_modules/.bin",
          }),

          -- JavaScript/TypeScript (Prettier)
          formatting.prettier.with({
            condition = function(utils)
              return utils.root_has_file({
                ".prettierrc",
                ".prettierrc.json",
                ".prettierrc.yml",
                ".prettierrc.yaml",
                ".prettierrc.json5",
                ".prettierrc.js",
                ".prettier.config.js",
                ".prettierrc.mjs",
                ".prettier.config.mjs",
                ".prettierrc.cjs",
                ".prettier.config.cjs",
                ".prettierrc.toml",
              })
            end,
            prefer_local = "node_modules/.bin",
          }),

          -- Deno
          diagnostics.deno_lint,
          formatting.deno_fmt,

          -- GitHub Actions
          diagnostics.actionlint,

          -- Rust
          formatting.rustfmt,

          -- Tailwind CSS
          formatting.rustywind,

          --- Python
          diagnostics.ruff.with({
            condition = function(utils)
              return utils.root_has_file({ "pyproject.toml", "ruff.toml" })
            end,
            diagnostics_format = "[#{c}] #{m} (#{s})",
            prefer_local = ".venv/bin",
          }),
          formatting.ruff.with({
            condition = function(utils)
              return utils.root_has_file({ "pyproject.toml", "ruff.toml" })
            end,
            prefer_local = ".venv/bin",
          }),
          formatting.ruff_format.with({
            condition = function(utils)
              return utils.root_has_file({ "pyproject.toml", "ruff.toml" })
            end,
            prefer_local = ".venv/bin",
          }),
        },
        on_attach = function(client, bufnr)
          if client.name == "lua_ls" then
            client.server_capabilities.documentFormattingProvider = false
          end
          if client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
          end
          if client.name == "pyright" then
            client.server_capabilities.documentFormattingProvider = false
          end
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({
                  bufnr = bufnr,
                  filter = function()
                    return client.name == "null-ls"
                  end,
                  async = false,
                })
              end,
            })
          end
        end,
      })
    end,
  },
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    enabled = function()
      local jdtls_path = os.getenv("JDTLS_BIN")
      if vim.fn.executable("jdtls") == 1 and jdtls_path ~= nil then
        return true
      else
        return false
      end
    end,
    config = function()
      local jdtls_path = os.getenv("JDTLS_BIN")
      require("jdtls").start_or_attach({
        cmd = {
          jdtls_path,
        },
        root_dir = vim.fs.dirname(
          vim.fs.find({ "gradlew", ".git", "mvnw", "pom.xml" }, { upward = true })[1]
        ),
      })
    end,
  },
}

return spec
