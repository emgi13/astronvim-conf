if not vim.g.neovide then return {} end

return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    options = {
      o = {
        guifont = "JetBrainsMono NF:h10",
      },
      g = {
        neovide_transparency = 0.8,
        neovide_theme = "dark",
        neovide_detach_on_quit = "always_quit",
        neovide_fullscreen = true,
        neovide_window_blurred = true,
      },
    },
    mappings = {
      n = {
        [""] = { ":w<CR>" },
        [""] = { '"+P' },
      },
      v = {
        [""] = { '"+y' },
        [""] = { '"+P' },
      },
      c = {
        [""] = { "<C-R>+" },
      },
      i = {
        [""] = { '<ESC>l"+Pli' },
      },
    },
  },
}
