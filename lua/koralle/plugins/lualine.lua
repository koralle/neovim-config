---@type LazySpec
local spec = {
  "nvim-lualine/lualine.nvim",
  name = "lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    options = {
      globalstatus = true
    }
  }
}

return spec
