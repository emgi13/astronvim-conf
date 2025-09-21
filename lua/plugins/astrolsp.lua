-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

local Snacks = require "snacks"
local extend = require("astrocore").extend_tbl

local harper_start = function()
  local lspconfig = require "lspconfig"
  local client_ok, client = pcall(vim.lsp.get_client_by_name, "harper_ls")
  if client_ok and client then
    -- if client exists, attach it to current buffer
    vim.lsp.buf_attach_client(0, client.id)
  else
    -- else setup the server manually and attach to current buffer
    lspconfig.harper_ls.setup {}
  end
end

local harper_stop = function()
  local clients = vim.lsp.get_clients { bufnr = 0 } -- get clients attached to current buffer
  local stopped = false
  for _, client in ipairs(clients) do
    if client.name == "harper_ls" then
      client:stop()
      stopped = true
      break
    end
  end
  if not stopped then print "Harper language server is not running." end
end

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
    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      -- clangd = { capabilities = { offsetEncoding = "utf-8" } },
      harper_ls = {
        autostart = false,
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
    -- customize how language servers are attached
    handlers = {
      -- a function without a key is simply the default handler, functions take two parameters, the server name and the configured options table for that server
      -- function(server, opts) require("lspconfig")[server].setup(opts) end

      -- the key is the server that is being setup with `lspconfig`
      -- rust_analyzer = false, -- setting a handler to false will disable the set up of that language server
      -- pyright = function(_, opts) require("lspconfig").pyright.setup(opts) end -- or a custom handler function can be passed
    },
    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      -- first key is the `augroup` to add the auto commands to (:h augroup)
      lsp_codelens_refresh = {
        -- Optional condition to create/delete auto command group
        -- can either be a string of a client capability or a function of `fun(client, bufnr): boolean`
        -- condition will be resolved for each client on each execution and if it ever fails for all clients,
        -- the auto commands will be deleted for that buffer
        cond = "textDocument/codeLens",
        -- cond = function(client, bufnr) return client.name == "lua_ls" end,
        -- list of auto commands to set
        {
          -- events to trigger
          event = { "InsertLeave", "BufEnter" },
          -- the rest of the autocmd options (:h nvim_create_autocmd)
          desc = "Refresh codelens (buffer)",
          callback = function(args)
            if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
          end,
        },
      },
    },
    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {
        -- a `cond` key can provided as the string of a server capability to be required to attach, or a function with `client` and `bufnr` parameters from the `on_attach` that returns a boolean
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
            else
              harper_stop()
            end
          end,
          desc = "Toggle spellcheck",
        },
      },
    },
    -- A custom `on_attach` function to be run after the default `on_attach` function
    -- takes two parameters `client` and `bufnr`  (`:h lspconfig-setup`)
    on_attach = function(client, bufnr)
      -- this would disable semanticTokensProvider for all clients
      -- client.server_capabilities.semanticTokensProvider = nil
    end,
  },
}
