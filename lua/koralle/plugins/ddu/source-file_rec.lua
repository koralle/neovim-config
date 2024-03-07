---@type LazySpec
local spec = {
  "Shougo/ddu-source-file_rec",
  name = "ddu-source-file_rec",
  dependencies = {
    "ddu.vim",
    "ddu-column-filename",
    "ddu-filter-matcher_substring",
    "ddu-filter-fzf",
    "ddu-kind-file",
    "ddu-filter-converter_devicon",
    "ddu-ui-ff",
  },
  init = function()
    vim.keymap.set("n", "<space>ff", function()
      vim.fn["ddu#start"]({
        name = "ff:file",
        ui = "ff",
      })
    end, { silent = true })
  end,
  config = function()
    local helpers = require("koralle.helpers.ddu")
    helpers.patch_local("ff:file", {
      sources = {
        {
          name = "file_rec",
          params = {
            ignoredDirectories = {
              "node_modules",
              ".git",
            },
          },
        },
      },
      sourceOptions = {
        ["file_rec"] = {
          matchers = {
            "matcher_fzf",
            "matcher_substring",
          },
          sorters = {
            "sorter_fzf",
          },
        },
      },
      filterParams = {
        ["matchers_fzf"] = {
          highlightMatched = "Search",
        },
      },
    })
  end,
}

return spec
