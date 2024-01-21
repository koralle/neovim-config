vim.g.markdown_fenced_languages = {
  "ts=typescript",
}

local server = {
  root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
  init_options = {
    enable = true,
    lint = true,
  },
  settings = {
    deno = {
      unstable = true,
      suggest = {
        imports = {
          autoDiscover = false,
          hosts = {
            ["https://crux.land"] = true,
            ["https://deno.land"] = true,
            ["https://x.next.land"] = true,
          },
        }
      }
    },
    typescript = {
      suggest = {
        autoImports = false,
      },
      inlayHints = {
        parameterNames = {
          enabled = "literals",
          suppressWhenArgumentMatchesName = true,
        },
        parameterTypes = {
          enabled = true
        },
        variableTypes = {
          enabled = false
        },
        propertyDeclarationTypes = {
          enabled = true
        },
        functionLikeReturnTypes = {
          enabled = true
        },
        enumMemberValues = {
          enabled = true
        },
      },
    },
  },
}

return server
