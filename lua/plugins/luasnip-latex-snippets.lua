return {
  "emgi13/luasnip-latex-snippets.nvim",
  ft = { "markdown", "markdown.mdx" },
  -- vimtex isn't required if using treesitter
  requires = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
  config = function()
    require("luasnip-latex-snippets").setup()
    require("luasnip").config.setup { enable_autosnippets = true }
    require("luasnip-latex-snippets").setup {
      use_treesitter = true, -- whether to use treesitter to determine if cursor is in math mode; if false, vimtex is used
      allow_on_markdown = true, -- whether to add snippets to markdown filetype
    }
  end,
}
