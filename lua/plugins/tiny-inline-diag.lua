---@type LazySpec
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  config = function()
    require("tiny-inline-diagnostic").setup {
      preset = "ghost",
      -- transparent_bg = true,
      options = {
        add_messages = { display_count = true },
        multilines = { enabled = true },
      },
      show_all_diags_on_cursorline = true,
      enable_on_insert = false,
      throttle = 20,
      enable_on_select = false,
    }
    vim.diagnostic.config { virtual_text = false } -- Disable Neovim's default virtual text diagnostics
  end,
}
