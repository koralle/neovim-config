---@type LazySpec
local spec = {
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    config = function()
      local rt = require("rust-tools")
      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            vim.keymap.set("n", "<space>c", rt.hover_actions.hover_actions, { buffer = bufnr })
            vim.keymap.set(
              "n",
              "<space>a",
              rt.code_action_group.code_action_group,
              { buffer = bufnr }
            )
          end,
        },
      })
    end,
  },
}

return spec
