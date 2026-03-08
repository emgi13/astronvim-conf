-- Customize Treesitter
---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "regex",
      "make",
      "markdown",
      "markdown_inline",
      "latex",
    },
    ignore_install = {},
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
}
