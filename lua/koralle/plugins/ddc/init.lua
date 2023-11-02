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
    config = function()
      local opts = { noremap = true, silent = true, expr = true }
      vim.cmd([[
        inoremap <silent><expr> <TAB>
          \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
          \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
          \ '<TAB>' : ddc#manual_complete()
      ]])

      vim.keymap.set("i", "<s-tab>", function()
        vim.fn["pum#map#insert_relative"](-1)
      end, {
        noremap = true,
      })
      vim.keymap.set("i", "<C-n>", function()
        vim.fn["pum#map#select_relative"](1)
      end, {
        noremap = true,
      })
      vim.keymap.set("i", "<C-p>", function()
        vim.fn["pum#map#select_relative"](-1)
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
    end,
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
