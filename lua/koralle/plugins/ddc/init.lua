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
    },
    enabled = function()
      if vim.fn.executable("deno") == 1 then
        return true
      else
        return false
      end
    end,
    config = function()
      vim.fn["ddc#custom#patch_global"]("sources", {
        "around",
        "mocword",
        "nvim-lsp",
      })
      vim.fn["ddc#custom#patch_global"]("sourceOptions", {
        _ = {
          matchers = {
            "matcher_head",
          },
          sorters = {
            "sorter_rank",
          },
        },
        mocword = {
          mark = "[MOCWORD]",
          minAutoCompleteLength = 3,
          isVolatile = true,
        },
        ["nvim-lsp"] = {
          mark = "🦍[LSP]",
          forceCompletionPattern = "\\.\\w*|:\\w*|->\\w*",
        },
      })

      vim.fn["ddc#custom#patch_global"]("ui", "pum")
      -- vim.fn["ddc#custom#patch_global"]("sources", {})
      -- vim.fn["ddc#custom#patch_global"]("sourceOptions", {})
      vim.fn["ddc#custom#patch_global"]("sourceParams", {
        ["nvim-lsp"] = {
          snippetEngine = vim.fn["denops#callback#register"](function(body)
            return vim.fn["vsnip#anonymous"](body)
          end),
          enableResolveItem = true,
          enableAdditionalTextEdit = true,
        },
      })
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
}

return spec
