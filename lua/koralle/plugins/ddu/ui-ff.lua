---@type LazySpec
local spec = {
  "Shougo/ddu-ui-ff",
  name = "ddu-ui-ff",
  dependencies = {
    "ddu.vim",
  },
  init = function()
    local opts = { noremap = true, buffer = true, silent = true }
    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = { "ddu-ff" },
      callback = function()
        vim.keymap.set("n", "<cr>", function()
          vim.fn["ddu#ui#do_action"]("itemAction")
        end, opts)

        vim.keymap.set("n", "<space>", function()
          vim.fn["ddu#ui#do_action"]("toggleSelectItem")
        end, opts)

        vim.keymap.set("n", "i", function()
          vim.fn["ddu#ui#do_action"]("openFilterWindow")
        end, { noremap = true, buffer = true })

        vim.keymap.set("n", "q", function()
          vim.fn["ddu#ui#do_action"]("quit")
        end, opts)

        vim.keymap.set("n", "a", function()
          vim.fn["ddu#ui#do_action"]("toggleAllItems")
        end, opts)
      end,
    })

    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = { "ddu-ff-filter" },
      callback = function()
        vim.keymap.set("i", "<cr>", "<esc><cmd>close<cr>", opts)
        vim.keymap.set("n", "<cr>", "<esc><cmd>close<cr>", opts)
        vim.keymap.set("n", "q", "<esc><cmd>close<cr>", opts)
        vim.keymap.set("n", "<esc>", function()
          vim.fn["ddu#ui#do_action"]("closeFilterWindow")
        end, opts)
      end,
    })
  end,
  config = function()
    local helpers = require("koralle.helpers.ddu")

    local lines = vim.opt.lines:get()
    local height, row = math.floor(lines * 0.8), math.floor(lines * 0.1)
    local columns = vim.opt.columns:get()
    local width, col = math.floor(columns * 0.8), math.floor(columns * 0.1)

    helpers.patch_global({
      ui = "ff",
      uiParams = {
        ff = {
          split = "floating",
          startFilter = true,
          prompt = "> ",
          winHeight = height,
          winRow = row,
          winWidth = width,
          winCol = col,
          floatingBorder = "rounded",
          filterFloatingPosition = "top",
          autoAction = {
            name = "preview",
          },
        },
      },
    })
  end,
}

return spec
