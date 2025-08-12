local Terminal = require("toggleterm.terminal").Terminal

local yazi = Terminal:new {
  cmd = "yazi",
  direction = "float", -- or vertical/float
  close_on_exit = true,
  on_open = function() vim.cmd "startinsert!" end,
  on_close = function() vim.cmd "startinsert!" end,
  -- Start in current working directory
  dir = vim.fn.getcwd(),
}

return {
  "AstroNvim/astrocore",
  opts = {
    mappings = {
      n = {
        ["<Leader>ty"] = { function() yazi:toggle() end, desc = "Yazi" },
      },
    },
  },
}
