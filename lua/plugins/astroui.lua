-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    -- info: good themes
    -- zaibatsu
    -- catppuccin
    colorscheme = "catppuccin-mocha",
    folding = {
      enabled = false,
      -- enabled = function(bufnr) return require("astrocore.buffer").is_valid(bufnr) end,
      -- methods = { "lsp", "treesitter", "indent" },
    },
    status = {
      winbar = {
        enabled = {},
      },
    },
    -- astroui allows you to easily modify highlight groups easily for any and all colorschemes
    -- icons can be configured throughout the interface
  },
}
