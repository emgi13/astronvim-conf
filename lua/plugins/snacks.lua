---@type LazySpec
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    quickfile = {},
    explorer = { enabled = true, replace_netrw = true },
    dashboard = {
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function() return Snacks.git.get_root() ~= nil end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "startup" },
      },

      preset = {
        header = table.concat({
          "██████████████████████████████████████████████████████████████████",
          "██                                                              ██",
          "██  ██████████████████████████  ██████████          ██████  ██  ██",
          "██  ██      ██████      ██████  ██                  ██          ██",
          "██  ██  ██  ██████  ██  ██████  ██████      ██████  ██  ██  ██  ██",
          "██  ██  ██          ██  ██████  ██          ██████  ██  ██  ██  ██",
          "██  ██  ██  ██  ██  ██      ██  ██████████  ██  ██  ██████  ██  ██",
          "██  ██  ██  ██  ██  ██  ██  ██                                  ██",
          "██  ██  ██  ██  ██  ██  ██  ██  ████████████████  ████████████████",
          "██  ██  ██  ██  ██  ██  ██  ██  ██████████████            ████████",
          "██  ██                  ██  ██  ████            ████████  ████████",
          "██  ██                ██    ██  ████            ██    ██        ██",
          "██  ██  ██████████████    ████  ████████████    ██    ██  ████  ██",
          "██  ██                  ██████  ██████████████  ████████  ████  ██",
          "██  ██████████████████████████                                  ██",
          "██                                     EmGiXIII@EmGiCO.         ██",
          "██████████████████████████████████████████████████████████████████",
        }, "\n"),
      },
    },
  },
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>e"] = {
              function() require("snacks").explorer() end,
              desc = "Open Explorer",
            },
          },
        },
      },
    },
  },
}
