---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "harper-ls",
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      config = {
        harper_ls = {
          autostart = false,
          -- 1. ADD FILETYPES HERE: Extend the default list to include LaTeX
          filetypes = {
            "c",
            "cpp",
            "cs",
            "gitcommit",
            "go",
            "html",
            "java",
            "javascript",
            "lua",
            "markdown",
            "nix",
            "python",
            "ruby",
            "rust",
            "swift",
            "toml",
            "typescript",
            "typescriptreact",
            "haskell",
            "cmake",
            "typst",
            "php",
            "dart",
            "clojure",
            "tex",
            "plaintex",
            "latex", -- <-- LaTeX enabled here
          },
          settings = {
            ["harper-ls"] = {
              codeActions = {
                forceStable = true,
              },
              linters = {
                spelled_numbers = true,
                linking_verbs = true,
              },
            },
          },
        },
      },
      commands = {
        HarperStart = {
          function() vim.lsp.enable "harper_ls" end,
          desc = "Start Grammar check using HarperLS",
        },
        HarperStop = {
          function() vim.lsp.enable("harper_ls", false) end,
          desc = "Stop Harper language server",
        },
      },
      handlers = {
        ["harper_ls"] = false,
      },
      mappings = {
        n = {
          ["<Leader>us"] = {
            function()
              local astrocore_toggles = require "astrocore.toggles"

              -- Toggle spell check (existing)
              astrocore_toggles.spell()

              -- Check the new state of spell option in current window
              if vim.wo.spell then
                vim.lsp.enable "harper_ls"
                print "HarperLS & Spellcheck Enabled"
              else
                vim.lsp.enable("harper_ls", false)
                print "HarperLS & Spellcheck Disabled"
              end
            end,
            desc = "Toggle spellcheck & HarperLS",
          },
        },
      },
    },
  },
}
