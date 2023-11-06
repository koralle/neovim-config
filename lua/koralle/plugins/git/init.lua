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
    end
  }
}

return spec
