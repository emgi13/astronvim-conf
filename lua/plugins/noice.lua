if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "folke/noice.nvim",
  opts = {
    lsp = {
      signature = {
        enabled = true,
        view = "hover",
      },
      hover = {
        enabled = true,
        view = "hover",
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
    },
  },
}
