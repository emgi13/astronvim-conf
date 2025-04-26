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
  },
}
