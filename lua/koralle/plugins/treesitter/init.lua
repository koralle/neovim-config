---@type LazySpec
local spec = {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "html",
          "css",
          "scss",
          "javascript",
          "typescript",
          "tsx",
          "vue",
          "lua",
          "java",
          "vim",
          "xml",
          "yaml",
          "zig",
          "bash",
          "go",
          "gomod",
          "gosum",
          "gowork",
          "dart",
          "csv",
          "dart",
          "json",
          "json5",
          "jsonc",
          "git_config",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "gitignore",
          "graphql",
          "kotlin",
          "llvm",
          "make",
          "markdown",
          "markdown_inline",
          "python",
          "rust",
          "proto",
          "rst",
          "sql",
          "ssh_config",
          "strace",
          "swift",
          "svelte",
          "terraform",
          "toml",
          "regex",
          "comment",
          "hcl",
          "jsdoc",
          "luadoc",
        },
        highlight = {
          enable = true,
        },
        ignore_install = {
          "swift",
        },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        autotag = {
          enable = true,
          enable_rename = true,
          enable_close = true,
          enable_close_on_slash = true,
        },
      })
      vim.lsp.handlers["textDocument/publishDiagnostics"] =
        vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
          underline = true,
          virtual_text = {
            spacing = 5,
            severity_limit = "Warning",
          },
          update_in_insert = true,
        })
    end,
  },
}

return spec
