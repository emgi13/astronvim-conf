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
