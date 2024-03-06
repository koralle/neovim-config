---@type LazySpec
local spec = {
  {
    "Rawnly/gist.nvim",
    cmd = { "GistCreate", "GistCreateFromFile", "GistsList" },
    opt = {
      private = false, -- All gists will be private, you won't be prompted again
      clipboard = "+", -- The registry to use for copying the Gist URL
      list = {
        -- If there are multiple files in a gist you can scroll them,
        -- with vim-like bindings n/p next previous
        mappings = {
          next_file = "<C-n>",
          prev_file = "<C-p>",
        },
      },
    },
  },
  {
    "samjwill/nvim-unception",
    lazy = false,
    init = function()
      vim.g.unception_block_while_host_edits = true
    end,
  },
}

return spec
