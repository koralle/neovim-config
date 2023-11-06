---@type LazySpec
local spec = {
  {
    "lambdalisue/fern.vim",
    dependencies = {
      "lambdalisue/fern-git-status.vim",
      "lambdalisue/fern-renderer-nerdfont.vim",
    },
    config = function()
      vim.keymap.set(
        "n",
        "<C-n>",
        ":Fern . -reveal=% -drawer -toggle -width=40<cr>",
        { noremap = true, silent = true }
      )
      vim.keymap.set(
        "n",
        "<C-s>",
        "<Plug>(fern-action-open:select)",
        { buffer = true, noremap = true }
      )
    end,
    lazy = true,
    keys = {
      { "<C-n>", mode = "n" },
    },
  },
  {
    "lambdalisue/fern-git-status.vim",
    lazy = true,
    dependencies = {
      "lambdalisue/nerdfont.vim",
    },
    config = function()
      vim.g["fern#renderer"] = "nerdfont"
    end,
  },
  {
    "lambdalisue/nerdfont.vim",
    lazy = true,
  },
  {
    "echasnovski/mini.files",
    version = "*",
    config = function()
      require("mini.files").setup({})
    end,
  },
}

return spec
