-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

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
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    -- customize language server configuration passed to `vim.lsp.config`
    -- client specific configuration can also go in `lsp/` in your configuration root (see `:h lsp-config`)
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
      -- ["*"] = { capabilities = {} }, -- modify default LSP client settings such as capabilities
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

    -- customize how language servers are attached
    handlers = {
      -- a function with the key `*` modifies the default handler, functions takes the server name as the parameter
      -- ["*"] = function(server) vim.lsp.enable(server) end

      -- the key is the server that is being setup with `vim.lsp.config`
      -- rust_analyzer = false, -- setting a handler to false will disable the set up of that language server
    },
    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      -- first key is the `augroup` to add the auto commands to (:h augroup)
      -- TODO! Verify if this is still required
      -- lsp_codelens_refresh = {
      --   -- Optional condition to create/delete auto command group
      --   -- can either be a string of a client capability or a function of `fun(client, bufnr): boolean`
      --   -- condition will be resolved for each client on each execution and if it ever fails for all clients,
      --   -- the auto commands will be deleted for that buffer
      --   cond = "textDocument/codeLens",
      --   -- cond = function(client, bufnr) return client.name == "lua_ls" end,
      --   -- list of auto commands to set
      --   {
      --     -- events to trigger
      --     event = { "InsertLeave", "BufEnter" },
      --     -- the rest of the autocmd options (:h nvim_create_autocmd)
      --     desc = "Refresh codelens (buffer)",
      --     callback = function(args)
      --       if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
      --     end,
      --   },
      -- },
    },
    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {
        ["<Leader>lR"] = {
          function() require("snacks").picker.lsp_references() end,
          desc = "Search references",
          nowait = true,
        },
        ["gd"] = {
          function() require("snacks").picker.lsp_definitions() end,
          desc = "Goto Definition",
        },
        ["gy"] = {
          function() require("snacks").picker.lsp_type_definitions() end,
          desc = "Goto T[y]pe Definition",
        },
        ["gI"] = {
          function() require("snacks").picker.lsp_implementations() end,
          desc = "Goto Implementations",
        },
        ["gD"] = {
          function() require("snacks").picker.lsp_declarations() end,
          desc = "Goto Declarations",
        },
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
    -- A custom `on_attach` function to be run after the default `on_attach` function
    -- takes two parameters `client` and `bufnr`  (`:h lsp-attach`)
    on_attach = function(client, bufnr)
      -- this would disable semanticTokensProvider for all clients
      -- client.server_capabilities.semanticTokensProvider = nil
    end,
  },
}
