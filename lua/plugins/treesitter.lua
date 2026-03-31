if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter
-- --------------------
-- Treesitter customizations are handled with AstroCore
-- as nvim-treesitter simply provides a download utility for parsers

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      auto_install = true, -- enable/disable automatic installation of detected languages
      ensure_installed = {
        "lua",
        "vim",
        "regex",
        "make",
        "markdown",
        "markdown_inline",
        "latex",
      },
      highlight = {
        enable = true,
        -- Disable treesitter highlighting for 'latex' ONLY in 'tex' files to avoid interfering with vimtex
        disable = function(lang, buf) return lang == "latex" and vim.bo[buf].filetype == "tex" end,
      },
      indent = {
        enable = true,
        -- Disable treesitter indentation for 'latex' ONLY in 'tex' files
        disable = function(lang, buf) return lang == "latex" and vim.bo[buf].filetype == "tex" end,
      },
    },
  },
}
