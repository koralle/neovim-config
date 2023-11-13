---@type LazySpec
local spec = {
  {
    "luckasRanarison/nvim-devdocs",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      previewer_cmd = "glow",
      cmd_args = {
        "-s",
        "dark",
        "-w",
        "80",
      },
    },
  },
}

return spec
