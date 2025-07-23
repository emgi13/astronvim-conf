---@type LazySpec
return {
  "hat0uma/csvview.nvim",
  ---@module "csvview"
  ---@type CsvView.Options
  opts = {
    parser = { comments = { "#", "//" } },
    keymaps = {
      -- Text objects for selecting fields
      textobject_field_inner = { "if", mode = { "o", "x" } },
      textobject_field_outer = { "af", mode = { "o", "x" } },
      -- Excel-like navigation:
      -- Use <Tab> and <S-Tab> to move horizontally between fields.
      -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
      -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
      jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
      jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
      jump_next_row = { "<Enter>", mode = { "n", "v" } },
      jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
    },
  },
  cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
  -- Load in local leader
  dependencies = {
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        autocmds = {
          buffer_enable_csvview = {
            {
              event = "FileType",
              pattern = { "csv" },
              desc = "Enable CSVView buffer local",
              callback = function(opts)
                local ac = require "astrocore"
                local prefix = "<LocalLeader>"
                ac.set_mappings({
                  n = {
                    [prefix] = { desc = " CSV" },
                    [prefix .. ","] = { "<CMD>CsvViewToggle display_mode=border<CR>", desc = "Toggle UI" },
                  },
                }, { buffer = opts.buf })
              end,
            },
          },
        },
      },
    },
  },
}
