-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

local Snacks = require "snacks"

-- Simplified to use Neovim's native LSP management commands.
-- This ensures it uses the AstroLSP config defined below instead of an empty default setup.
local harper_start = function() vim.cmd "LspStart harper_ls" end

local harper_stop = function() vim.cmd "LspStop harper_ls" end

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      codelens = true, -- enable/disable codelens refresh on start
      inlay_hints = false, -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
    },
    -- customize lsp formatting options
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = {},
        ignore_filetypes = {},
      },
      disabled = {},
      timeout_ms = 1000,
    },
    servers = {},
    ---@diagnostic disable: missing-fields
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
      basedpyright = {
        settings = {
          basedpyright = {
            analysis = {
              diagnosticMode = "openFilesOnly",
            },
          },
        },
      },
      texlab = {
        settings = {
          texlab = {
            latexFormatter = "tex-fmt",
            bibtexFormatter = "tex-fmt",
          },
        },
      },
    },
    commands = {
      HarperStart = {
        harper_start,
        desc = "Start Grammar check using HarperLS",
      },
      HarperStop = {
        harper_stop,
        desc = "Stop Harper language server",
      },
    },
    autocmds = {
      lsp_codelens_refresh = {
        cond = "textDocument/codeLens",
        {
          event = { "InsertLeave", "BufEnter" },
          desc = "Refresh codelens (buffer)",
          callback = function(args)
            if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
          end,
        },
      },
    },
    mappings = {
      n = {
        ["<Leader>lR"] = {
          function() Snacks.picker.lsp_references() end,
          desc = "Search references",
          nowait = true,
        },
        ["gd"] = {
          function() Snacks.picker.lsp_definitions() end,
          desc = "Goto Definition",
        },
        ["gy"] = {
          function() Snacks.picker.lsp_type_definitions() end,
          desc = "Goto T[y]pe Definition",
        },
        ["gI"] = {
          function() Snacks.picker.lsp_implementations() end,
          desc = "Goto Implementations",
        },
        ["gD"] = {
          function() Snacks.picker.lsp_declarations() end,
          desc = "Goto Declarations",
        },
        ["<Leader>us"] = {
          function()
            local astrocore_toggles = require "astrocore.toggles"

            -- Toggle spell check (existing)
            astrocore_toggles.spell()

            -- Check the new state of spell option in current window
            if vim.wo.spell then
              harper_start()
              print "HarperLS & Spellcheck Enabled"
            else
              harper_stop()
              print "HarperLS & Spellcheck Disabled"
            end
          end,
          desc = "Toggle spellcheck & HarperLS",
        },
      },
    },
    on_attach = function(_client, _bufnr) end,
  },
}
