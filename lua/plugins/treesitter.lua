-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "latex",
      "regex",
      "make",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
