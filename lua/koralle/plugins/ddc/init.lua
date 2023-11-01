---@type LazySpec
local spec = {
  {
    "Shougo/ddc.vim",
    dependencies = {
      "vim-denops/denops.vim",
    },
    enabled = function()
      if vim.fn.executable("deno") == 1 then
        return true
      else
        return false
      end
    end,
    config = function()
      -- vim.fn["ddc#custom#patch_global"]("sources", {})
      -- vim.fn["ddc#custom#patch_global"]("sourceOptions", {})
      -- vim.fn["ddc#custom#patch_global"]("sourceParams", {})
      -- vim.fn["ddc#enable"]()
    end,
  },
}

return spec
