---@type LazySpec
local spec = {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
      })

      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}

return spec
