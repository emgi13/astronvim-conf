local trigger = "<Leader>,"

local function GrepNotes()
  require("snacks").picker.grep {
    live = true,
    title = "Grep Notes",
    cwd = "~/Brain",
    prompt = "> ",
  }
end

---@type LazySpec
return {
  "obsidian-nvim/obsidian.nvim",
  -- the obsidian vault in this default config  ~/obsidian-vault
  -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
  -- event = { "bufreadpre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
  -- event = { "BufReadPre  /mnt/c/Obsidian/Brain/*.md" },
  event = {
    "BufReadPre /mnt/c/Obsidian/Brain/*.md",
  },
  cmd = "Obsidian",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            -- Obsidian mappings
            [trigger] = { desc = "Obsidian" },
            [trigger .. "b"] = { "<cmd>Obsidian backlinks<CR>", desc = "Backlinks" },
            [trigger .. "d"] = { desc = "Dailies" },
            [trigger .. "df"] = { "<cmd>Obsidian dailies<CR>", desc = "Find daily note" },
            [trigger .. "dd"] = { "<cmd>Obsidian today<CR>", desc = "Today's Note" },
            [trigger .. "dt"] = { "<cmd>Obsidian tomorrow<CR>", desc = "Tomorrow's Note" },
            [trigger .. "dy"] = { "<cmd>Obsidian yesterday<CR>", desc = "Yesterday's Note" },
            [trigger .. "l"] = { "<cmd>Obsidian links<CR>", desc = "Links" },
            [trigger .. "n"] = { "<cmd>Obsidian new<CR>", desc = "New Note" },
            [trigger .. "N"] = { "<cmd>Obsidian new_from_template<CR>", desc = "New Note from Template" },
            [trigger .. "t"] = { "<cmd>Obsidian tags<CR>", desc = "Find Tags" },
            [trigger .. "o"] = { "<cmd>Obsidian open<CR>", desc = "Open in Obsidian Desktop" },
            [trigger .. "s"] = { "<cmd>Obsidian search<CR>", desc = "Search" },
            [trigger .. "f"] = { "<cmd>Obsidian quick_switch<CR>", desc = "Find Note" },
            [trigger .. "p"] = { "<cmd>Obsidian paste_img<CR>", desc = "Paste Image" },
            [trigger .. "r"] = { "<cmd>Obsidian rename<CR>", desc = "Rename Note" },
            [trigger .. "i"] = { "<cmd>Obsidian template<CR>", desc = "Insert Template" },
            [trigger .. "/"] = { GrepNotes, desc = "Grep Notes" },
          },
          v = {
            [trigger] = { desc = "Obsidian" },
            [trigger .. "e"] = { "<cmd>Obsidian extract_note<CR>", desc = "Extract Note" },
            [trigger .. "l"] = { "<cmd>Obsidian link<CR>", desc = "Create Link" },
            [trigger .. "n"] = { "<cmd>Obsidian link_new<CR>", desc = "Create Link (New)" },
          },
        },
      },
    },
  },
  opts = function(_, opts)
    local astrocore = require "astrocore"
    return astrocore.extend_tbl(opts, {
      dir = "~/Brain/", -- specify the vault location. no need to call 'vim.fn.expand' here
      finder = (astrocore.is_available "snacks.pick" and "snacks.pick")
        or (astrocore.is_available "telescope.nvim" and "telescope.nvim")
        or (astrocore.is_available "fzf-lua" and "fzf-lua")
        or (astrocore.is_available "mini.pick" and "mini.pick"),

      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
      },
      daily_notes = {
        folder = "daily",
      },
      completion = {
        nvim_cmp = astrocore.is_available "nvim-cmp",
        blink = astrocore.is_available "blink.cmp",
        min_chars = 0, -- WARN: start completion instantly, increase if slows down
      },

      note_frontmatter_func = function(note)
        -- This is equivalent to the default frontmatter function.
        local out = { id = note.id, aliases = note.aliases, tags = note.tags }
        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end
        return out
      end,

      -- Optional, customize how note IDs are generated given an optional title.
      ---@param title string|?
      ---@return string
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'.
        -- You may have as many periods in the note ID as you'd like—the ".md" will be added automatically
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          return title:gsub("[^A-Za-z0-9 ]", "")
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
          return tostring(os.time()) .. "-" .. suffix
        end
      end,
      -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
      -- URL it will be ignored but you can customize this behavior here.
      follow_url_func = vim.ui.open,
      ui = {
        enable = false,
      },
      workspaces = {
        {
          name = "Brain",
          path = "~/Brain/",
        },
      },
      legacy_commands = false,
    })
  end,
}
