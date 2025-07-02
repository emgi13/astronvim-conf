if true then return {} end -- WARN: Remove this line to enable this file.

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
