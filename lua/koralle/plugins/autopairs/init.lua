---@type LazySpec
local spec = {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({
      map_cr = true,
    })
  end,
}

return spec
