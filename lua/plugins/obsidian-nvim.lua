return {}
-- return {
--   "epwalsh/obsidian.nvim",
--   version = "*", -- recommended, use latest release instead of latest commit
--   lazy = false,
--   ft = "markdown",
--   -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
--   -- event = {
--   --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
--   --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
--   --   -- refer to `:h file-pattern` for more examples
--   --   "BufReadPre path/to/my-vault/*.md",
--   --   "BufNewFile path/to/my-vault/*.md",
--   -- },
--   dependencies = {
--     -- Required.
--     "nvim-lua/plenary.nvim",
--     "hrsh7th/nvim-cmp",
--     -- see below for full list of optional dependencies 👇
--   },
--   opts = {
--     workspaces = {
--       {
--         -- Digital Brain path on Google Drive
--         name = "DigitalBrain",
--         path = "/mnt/g/My Drive/DigitalBrain",
--       },
--     },
--     completion = {
--       nvim_cmp = true,
--       min_chars = 1,
--     },
--     mappings = {},
--     new_notes_location = "notes_subdir",
--     preferred_link_style = "wiki",
--     disable_frontmatter = true,
--     -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
--     -- URL it will be ignored but you can customize this behavior here.
--     ---@param url string
--     follow_url_func = function(url)
--       -- Open the URL in the default web browser.
--       -- vim.fn.jobstart { "open", url } -- Mac OS
--       vim.fn.jobstart { "wsl-open", url } -- linux
--       -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
--       -- vim.ui.open(url) -- need Neovim 0.10.0+
--     end,
--     -- Optional, by default when you use `:ObsidianFollowLink` on a link to an image
--     -- file it will be ignored but you can customize this behavior here.
--     ---@param img string
--     follow_img_func = function(img)
--       -- vim.fn.jobstart { "qlmanage", "-p", img } -- Mac OS quick look preview
--       vim.fn.jobstart { "wsl-open", img } -- linux
--       -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
--     end,
--     -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
--     open_app_foreground = true,
--     -- Optional, determines how certain commands open notes. The valid options are:
--     -- 1. "current" (the default) - to always open in the current window
--     -- 2. "vsplit" - to open in a vertical split if there's not already a vertical split
--     -- 3. "hsplit" - to open in a horizontal split if there's not already a horizontal split
--     open_notes_in = "vsplit",
--     -- Optional, configure additional syntax highlighting / extmarks.
--     -- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
--
--     -- Optional, customize how note IDs are generated given an optional title.
--     ---@param title string|?
--     ---@return string
--     note_id_func = function(title)
--       -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
--       -- In this case a note with the title 'My new note' will be given an ID that looks
--       -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
--       local suffix = ""
--       if title ~= nil then
--         -- If title is given, transform it into valid file name.
--         suffix = title
--       else
--         -- If title is nil, just add 4 random uppercase letters to the suffix.
--         for _ = 1, 4 do
--           suffix = suffix .. string.char(math.random(65, 90))
--         end
--       end
--       return tostring(os.time()) .. "-" .. suffix
--     end,
--
--     -- Optional, customize how note file names are generated given the ID, target directory, and title.
--     ---@param spec { id: string, dir: obsidian.Path, title: string|? }
--     ---@return string|obsidian.Path The full path to the new note.
--     note_path_func = function(spec)
--       -- This is equivalent to the default behavior.
--       local path = spec.dir / tostring(spec.title)
--       return path:with_suffix ".md"
--     end,
--
--     -- Optional, customize how wiki links are formatted. You can set this to one of:
--     --  * "use_alias_only", e.g. '[[Foo Bar]]'
--     --  * "prepend_note_id", e.g. '[[foo-bar|Foo Bar]]'
--     --  * "prepend_note_path", e.g. '[[foo-bar.md|Foo Bar]]'
--     --  * "use_path_only", e.g. '[[foo-bar.md]]'
--     -- Or you can set it to a function that takes a table of options and returns a string, like this:
--     wiki_link_func = "use_alias_only",
--     -- wiki_link_func = function(opts) return require("obsidian.util").wiki_link_id_prefix(opts) end,
--
--     ui = {
--       enable = false,
--     },
--     -- Specify how to handle attachments.
--     attachments = {
--       -- The default folder to place images in via `:ObsidianPasteImg`.
--       -- If this is a relative path it will be interpreted as relative to the vault root.
--       -- You can always override this per image by passing a full path to the command instead of just a filename.
--       img_folder = "files", -- This is the default
--
--       -- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
--       ---@return string
--       img_name_func = function()
--         -- Prefix image names with timestamp.
--         return string.format("%s-", os.time())
--       end,
--
--       -- A function that determines the text to insert in the note when pasting an image.
--       -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
--       -- This is the default implementation.
--       ---@param client obsidian.Client
--       ---@param path obsidian.Path the absolute path to the image file
--       ---@return string
--       img_text_func = function(client, path)
--         path = client:vault_relative_path(path) or path
--         return string.format("![%s](%s)", path.name, path)
--       end,
--     },
--   },
-- }
