---@type LazySpec
local spec = {
  {
    "Shougo/ddc.vim",
    dependencies = {
      "vim-denops/denops.vim",
      "Shougo/ddc-source-around",
      "Shougo/ddc-filter-matcher_head",
      "Shougo/ddc-filter-sorter_rank",
      "Shougo/ddc-source-mocword",
      "matsui54/denops-popup-preview.vim",
      "Shougo/pum.vim",
      "Shougo/ddc-ui-pum",
      "Shougo/ddc-source-nvim-lsp",
      "Shougo/ddc-source-copilot",
      "hrsh7th/vim-vsnip",
      "uga-rosa/ddc-source-vsnip",
      "LumaKernel/ddc-source-file",
    },
    enabled = function()
      return vim.fn.executable("deno") == 1
    end,
    config = function()
      vim.fn["ddc#custom#patch_global"]({
        ui = "pum",
        sources = {
          "copilot",
          "nvim-lsp",
          "file",
          "around",
          "mocword",
        },
        backspaceCompletion = true,
        sourceOptions = {
          _ = {
            matchers = {
              "matcher_head",
            },
            sorters = {
              "sorter_rank",
            },
          },
          around = {
            mark = "[AROUND]",
            isVolatile = true,
          },
          file = {
            mark = "[FILE]",
            isVolatile = true,
            forceCompletionPattern = "\\S/\\S*",
          },
          mocword = {
            mark = "[MOCWORD]",
            minAutoCompleteLength = 3,
            isVolatile = true,
            maxItems = 20,
          },
          ["nvim-lsp"] = {
            mark = "🦍[LSP]",
            dup = "keep",
            keywordPattern = "\\k+",
            sorters = { "sorter_lsp-kind" },
          },
          copilot = {
            mark = "[COPILOT]",
            matchers = {},
            minAutoCompleteLength = 0,
            isVolatile = true,
          },
        },
        sourceParams = {
          ["nvim-lsp"] = {
            snippetEngine = vim.fn["denops#callback#register"](function(body)
              vim.fn["vsnip#anonymous"](body)
            end),
            enableResolveItem = true,
            enableAdditionalTextEdit = true,
            confirmBehavior = "replace",
          },
        },
      })

      vim.fn["ddc#custom#patch_filetype"]({
        "ps1",
        "dospatch",
        "autohotkey",
        "registry",
      }, {
        sourceOptions = {
          file = {
            forceCompletionPattern = "\\S/\\S*",
          },
        },
        sourceParams = {
          file = {
            mode = "win32",
          },
        },
      })

      local opts = { noremap = true, silent = true, expr = true }

      vim.keymap.set("i", "<C-j>", function()
        local pumvisible = vim.fn["pum#visible"]()
        if pumvisible then
          vim.fn["pum#map#insert_relative"](1)
        else
          return "<C-j>"
        end
      end, opts)

      vim.keymap.set("i", "<C-k>", function()
        local pumvisible = vim.fn["pum#visible"]()
        if pumvisible then
          vim.fn["pum#map#insert_relative"](-1)
        else
          return "<C-k>"
        end
      end, opts)

      vim.keymap.set("i", "<C-y>", function()
        vim.fn["pum#map#confirm"]()
      end, {
        noremap = true,
      })
      vim.keymap.set("i", "<C-e>", function()
        vim.fn["pum#map#cancel"]()
      end, {
        noremap = true,
      })

      vim.keymap.set({ "i", "s" }, "<C-l>", function()
        return vim.fn["vsnip#available"](1) == 1 and "<Plug>(vsnip-expand-or-jump)" or "<C-l>"
      end, { expr = true, noremap = false })

      vim.keymap.set({ "i", "s" }, "<Tab>", function()
        return vim.fn["vsnip#jumpable"](1) == 1 and "<Plug>(vsnip-jump-next)" or "<Tab>"
      end, { expr = true, noremap = false })

      vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
        return vim.fn["vsnip#jumpable"](-1) == 1 and "<Plug>(vsnip-jump-prev)" or "<S-Tab>"
      end, { expr = true, noremap = false })

      vim.keymap.set(
        { "n", "s" },
        "<s>",
        [[<Plug>(vsnip-select-text)]],
        { expr = true, noremap = false }
      )

      vim.keymap.set(
        { "n", "s" },
        "<S>",
        [[<Plug>(vsnip-cut-text)]],
        { expr = true, noremap = false }
      )

      vim.fn["ddc#enable"]()
      vim.fn["popup_preview#enable"]()
    end,
  },
  {
    "Shougo/ddc-source-around",
    lazy = true,
  },
  {
    "Shougo/ddc-filter-matcher_head",
    lazy = true,
  },
  {
    "Shougo/ddc-filter-sorter_rank",
    lazy = true,
  },
  {
    "Shougo/ddc-source-mocword",
    lazy = true,
  },
  {
    "matsui54/denops-popup-preview.vim",
    lazy = true,
  },
  {
    "Shougo/pum.vim",
    lazy = true,
    dependencies = {
      "folke/noice.nvim",
    },
    config = function() end,
  },
  {
    "folke/noice.nvim",
    lazy = true,
  },
  {
    "Shougo/ddc-ui-pum",
    lazy = true,
    dependencies = {
      "Shougo/pum.vim",
    },
  },
  {
    "Shougo/ddc-source-nvim-lsp",
    lazy = true,
    dependencies = {
      "uga-rosa/ddc-nvim-lsp-setup",
    },
  },
  {
    "uga-rosa/ddc-nvim-lsp-setup",
    lazy = true,
  },
  {
    "Shougo/ddc-source-copilot",
    lazy = true,
    dependencies = {
      "github/copilot.vim",
    },
  },
  {
    "uga-rosa/ddc-source-vsnip",
    lazy = true,
    dependencies = {
      "hrsh7th/vim-vsnip",
    },
  },
  {
    "LumaKernel/ddc-source-file",
    lazy = true,
    dependencies = {
      "vim-denops/denops.vim",
    },
  },
}

return spec
