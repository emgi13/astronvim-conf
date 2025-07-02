---@type LazySpec
return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "markdown.mdx" },
  opts = {
    latex = { enabled = false },
  },
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
}
