return {
  "gaoDean/autolist.nvim",
  ft = {
    "markdown",
    "text",
    "tex",
    "plaintex",
    "norg",
  },
  config = function()
    require("autolist").setup()
    require("astrocore").set_mappings {
      i = {
        ["<tab>"] = { "<cmd>AutolistTab<cr>" },
        ["<s-tab>"] = { "<cmd>AutolistShiftTab<cr>" },
      },
      n = {
        ["o"] = { "o<cmd>AutolistNewBullet<cr>" },
        ["O"] = { "O<cmd>AutolistNewBulletBefore<cr>" },
        ["<CR>"] = { "<cmd>AutolistToggleCheckbox<cr>" },
        ["<C-r>"] = { "<cmd>AutolistRecalculate<cr>" },
        ["<leader>A"] = { desc = "Autolist" },
        ["<leader>An"] = { function() require("autolist").cycle_next_dr { expr = true } end, desc = "Next list type" },
        ["<leader>Ap"] = { function() require("autolist").cycle_prev_dr { expr = true } end, desc = "Prev list type" },
        [">>"] = { ">><cmd>AutolistRecalculate<cr>" },
        ["<<"] = { "<<<cmd>AutolistRecalculate<cr>" },
        ["dd"] = { "dd<cmd>AutolistRecalculate<cr>" },
      },
      v = {
        ["d"] = { "d<cmd>AutolistRecalculate<cr>" },
      },
    }
  end,
}

-- INFO: Old Config

-- vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")
-- vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
-- -- vim.keymap.set("i", "<c-t>", "<c-t><cmd>AutolistRecalculate<cr>") -- an example of using <c-t> to indent
-- vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
-- vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
-- vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr>")
-- vim.keymap.set("n", "<C-r>", "<cmd>AutolistRecalculate<cr>")
--
-- -- cycle list types with dot-repeat
-- vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true })
-- vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true })
--
-- -- if you don't want dot-repeat
-- -- vim.keymap.set("n", "<leader>cn", "<cmd>AutolistCycleNext<cr>")
-- -- vim.keymap.set("n", "<leader>cp", "<cmd>AutolistCycleNext<cr>")
--
-- -- functions to recalculate list on edit
-- vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>")
-- vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>")
-- vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
-- vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>")
