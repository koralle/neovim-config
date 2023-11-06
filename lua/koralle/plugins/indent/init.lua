---@type LazySpec
local spec = {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require("ibl").setup({})
  end,
}

return spec
