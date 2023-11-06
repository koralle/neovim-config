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
}

return spec
