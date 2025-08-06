local Snacks = require "snacks"
local header = [[
██████████████████████████████████████████████████████████████████
██                                                              ██
██  ██████████████████████████  ██████████          ██████  ██  ██
██  ██      ██████      ██████  ██                  ██          ██
██  ██  ██  ██████  ██  ██████  ██████      ██████  ██  ██  ██  ██
██  ██  ██          ██  ██████  ██          ██████  ██  ██  ██  ██
██  ██  ██  ██  ██  ██      ██  ██████████  ██  ██  ██████  ██  ██
██  ██  ██  ██  ██  ██  ██  ██                                  ██
██  ██  ██  ██  ██  ██  ██  ██  ████████████████  ████████████████
██  ██  ██  ██  ██  ██  ██  ██  ██████████████            ████████
██  ██                  ██  ██  ████            ████████  ████████
██  ██                ██    ██  ████            ██    ██        ██
██  ██  ██████████████    ████  ████████████    ██    ██  ████  ██
██  ██                  ██████  ██████████████  ████████  ████  ██
██  ██████████████████████████                                  ██
██                                     EmGiXIII@EmGiCO.         ██
██████████████████████████████████████▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄██████████
]]

---@type LazySpec
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    -- picker = {
    --   layout = {
    --     layout = {
    --       width = 0.9,
    --       height = 0.8,
    --     },
    --   },
    -- },
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
        header = header,
      },
    },
    picker = {
      previewers = {
        diff = {
          builtin = false, -- use Neovim for previewing diffs (true) or use an external tool (false)
          cmd = { "delta" }, -- example to show a diff with delta
        },
        git = {
          builtin = false, -- use Neovim for previewing git output (true) or use git (false)
          args = { "-c", "core.pager=delta" }, -- additional arguments passed to the git command. Useful to set pager options usin `-c ...`
        },
        -- file = {
        --   max_size = 1024 * 1024, -- 1MB
        --   max_line_length = 500, -- max line length
        --   ft = nil, ---@type string? filetype for highlighting. Use `nil` for auto detect
        -- },
        -- man_pager = nil, ---@type string? MANPAGER env to use for `man` preview
      },
      matcher = {
        frecency = true,
        cwd_bonus = true,
      },
      layout = {
        preview = "main",
        layout = {
          box = "vertical",
          backdrop = false,
          width = 0,
          height = 0.2,
          position = "bottom",
          border = "top",
          title = " {title} {live} {flags}",
          title_pos = "left",
          { win = "input", height = 1, border = "bottom" },
          {
            box = "horizontal",
            { win = "list", border = "none" },
            { win = "preview", title = "{preview}", width = 0.6, border = "left" },
          },
        },
      },
    },
  },
  dependencies = {
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        mappings = {
          n = {
            ["<Leader>e"] = {
              function() Snacks.explorer() end,
              desc = "Open Explorer",
            },
            ["<Leader>fu"] = {
              function() Snacks.picker.undo() end,
              desc = "Find Undos",
            },
          },
        },
      },
    },
  },
}
