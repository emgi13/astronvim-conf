return {
  "emgi13/luasnip-latex-snippets.nvim",
  ft = { "markdown", "markdown.mdx", "tex" },
  requires = { "L3MON4D3/LuaSnip" },
  config = function()
    require("luasnip").config.setup { enable_autosnippets = true }
    require("luasnip-latex-snippets").setup {
      use_treesitter = true,
      allow_on_markdown = true,
    }
  end,
}
