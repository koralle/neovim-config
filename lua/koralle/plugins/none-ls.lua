---@type LazySpec
local spec = {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup({
      sources = {
        -- Lua
        diagnostics.selene.with({
          condition = function(utils)
            return utils.root_has_file({ "selene.toml" })
          end,
        }),
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

        formatting.prettier.with({
          condition = function(utils)
            return utils.root_has_file({
              ".prettierrc",
              ".prettierrc.json",
              ".prettierrc.yaml",
              ".prettierrc.yml",
              ".prettierrc.js",
              ".prettierrc.cjs",
              ".prettierrc.mjs",
              ".prettierrc.toml",
              "prettier.config.js",
              "prettier.config.cjs",
              "prettier.config.mjs",
            })
          end,
          prefer_local = "node_modules/.bin",
        }),

        -- GitHub Actions
        diagnostics.actionlint,

        -- Rust
        formatting.rustfmt,
        -- Markdown
        diagnostics.markdownlint_cli2.with({
          condition = function(utils)
            return utils.root_has_file({
              ".markdownlint_cli2.jsonc",
              ".markdownlint_cli2.yaml",
              ".markdownlint_cli2.mjs",
              ".markdownlint_cli2.cjs",
            })
          end,
          prefer_local = "node_modules/.bin",
          diagnostics_format = "[#{c}] #{m} (#{s})",
        }),
      },
      on_attach = function(client, bufnr)
        if client.name == "lua_ls" then
          client.server_capabilities.documentFormattingProvider = false
        end
        if client.name == "tsserver" then
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
}

return spec
