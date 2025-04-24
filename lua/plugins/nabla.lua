return {
  "jbyuki/nabla.nvim",
  ft = {
    "markdown",
    "markdown.mdx",
  },
  keys = {
    {
      "<Leader>m",
      function() require("nabla").popup() end,
      desc = "Preview MATH",
    },
    {
      "<Leader>uv",
      function()
        require("nabla").toggle_virt {
          autogen = true, -- auto-regenerate ASCII art when exiting insert mode
          silent = true, -- silents error messages
        }
      end,
      desc = "Toggle Virtual Math",
    },
  },
}
