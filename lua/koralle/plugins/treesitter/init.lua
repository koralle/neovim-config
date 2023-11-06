---@type LazySpec
local spec = {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
      },
      ignore_install = {
        "swift",
      },
    })
  end,
}

return spec
