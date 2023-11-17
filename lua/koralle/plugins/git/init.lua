---@type LazySpec

local spec = {
  {
    "dinhhuy258/git.nvim",
    config = function()
      require("git").setup({
        default_mappings = true,
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({})
    end,
  },
  {
    "sindrets/diffview.nvim",
    cofig = function()
      require("diffview").setup({
        diff_binaries = false,
      })
    end,
  },
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
  },
}

return spec
