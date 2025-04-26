return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    latex = { enabled = false }, -- Disables render-markdown's LaTeX
    on = {
      render = function() require("nabla").enable_virt { autogen = false } end,
      clear = function() require("nabla").disable_virt() end,
    },
  },
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
}
