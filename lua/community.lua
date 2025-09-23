-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec[]
return {
  "emgi13/astrocommunity",

  -- UI / General tools
  { import = "astrocommunity.bars-and-lines.bufferline-nvim" },
  { import = "astrocommunity.code-runner.mf-runner-nvim" },
  { import = "astrocommunity.color.transparent-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.completion.cmp-nerdfont" },
  { import = "astrocommunity.editing-support.vim-move" },
  { import = "astrocommunity.editing-support.wildfire-nvim" },
  { import = "astrocommunity.git.diffview-nvim", cmd = { "DiffviewOpen" } },
  { import = "astrocommunity.indent.snacks-indent-hlchunk" },
  { import = "astrocommunity.lsp.lsp-lens-nvim", event = "LspAttach" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim", ft = "markdown" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.vim-matchup" },
  { import = "astrocommunity.quickfix.nvim-bqf", ft = "qf" },
  { import = "astrocommunity.recipes.heirline-clock-statusline" },
  { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
  { import = "astrocommunity.terminal-integration.flatten-nvim" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.pack.diff-keybindings" },

  -- Language Packs: load only on relevant filetypes
  { import = "astrocommunity.pack.astro", ft = "astro" },
  { import = "astrocommunity.pack.bash", ft = { "sh", "zsh", "bash" } },
  { import = "astrocommunity.pack.cpp", ft = { "c", "cpp" } },
  { import = "astrocommunity.pack.harper", event = "User AstroFile" }, -- uncommon, adjust if needed
  { import = "astrocommunity.pack.html-css", ft = { "html", "css", "scss" } },
  { import = "astrocommunity.pack.lean", ft = "lean" },
  { import = "astrocommunity.pack.lua", ft = "lua" },
  { import = "astrocommunity.pack.markdown", ft = "markdown" },
  { import = "astrocommunity.pack.mdx", ft = "mdx" },
  { import = "astrocommunity.pack.python-ruff", ft = "python" },
  { import = "astrocommunity.pack.rust", ft = "rust" },
  {
    import = "astrocommunity.pack.typescript-all-in-one",
    ft = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
  },
  { import = "astrocommunity.pack.typst", ft = "typst" },
  { import = "astrocommunity.pack.yaml", ft = "yaml" },
}
