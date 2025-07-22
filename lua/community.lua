-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.bars-and-lines.bufferline-nvim" },
  { import = "astrocommunity.color.transparent-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.completion.cmp-nerdfont" },
  { import = "astrocommunity.editing-support.chatgpt-nvim" },
  { import = "astrocommunity.editing-support.telescope-undo-nvim" },
  { import = "astrocommunity.editing-support.vim-move" },
  { import = "astrocommunity.editing-support.wildfire-nvim" },
  { import = "astrocommunity.game.leetcode-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.lsp.lsp-lens-nvim" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" }, -- build the app yourseld in lazy storage
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.vim-matchup" },
  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.julia" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.mdx" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.typst" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.quickfix.nvim-bqf" },
  { import = "astrocommunity.recipes.heirline-clock-statusline" },
  { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
  { import = "astrocommunity.utility.noice-nvim" },
}
