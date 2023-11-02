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
      })
      -- vim.fn["ddc#custom#patch_global"]("sources", {})
      -- vim.fn["ddc#custom#patch_global"]("sourceOptions", {})
      -- vim.fn["ddc#custom#patch_global"]("sourceParams", {})
      -- vim.fn["ddc#enable"]()
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
}

return spec
