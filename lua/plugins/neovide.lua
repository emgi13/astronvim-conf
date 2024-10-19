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
        neovide_transparency = 0.9,
        neovide_theme = "dark",
        neovide_detach_on_quit = "always_quit",
        neovide_window_blurred = true,
        neovide_fullscreen = true,
      },
    },
    mappings = {
      n = {
        [""] = { ":w<CR>" },
        [""] = { '"+P' },
        ["<C-F11>"] = {
          function() vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen end,
          desc = "Toggle Fullscreen",
        },
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
