return {
  "emgi13/luasnip-latex-snippets.nvim",
  ft = { "markdown", "markdown.mdx", "tex" },
  dependencies = { "L3MON4D3/LuaSnip" },
  config = function()
    require("luasnip").config.setup { enable_autosnippets = true }
    require("luasnip-latex-snippets").setup {
      allow_on_markdown = true,
    }
  end,
}
