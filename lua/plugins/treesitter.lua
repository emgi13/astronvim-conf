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
    },
    ignore_install = { "latex" }, -- Prevents latex parser install
    highlight = {
      enable = true,
      disable = { "latex" }, -- Disables highlighting for latex
    },
    indent = {
      enable = true,
      disable = { "latex" }, -- Disables indentation for latex
    },
  },
}
