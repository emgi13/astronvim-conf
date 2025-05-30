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
      -- add more arguments for adding more treesitter parsers
    },
  },
}
