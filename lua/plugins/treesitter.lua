-- Customize Treesitter
---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "regex",
      "make",
      "markdown",
      "markdown_inline",
      "latex",
    },
    ignore_install = {},
    highlight = {
      enable = true,
      -- Disable treesitter highlighting for 'latex' ONLY in 'tex' files to avoid interfering with vimtex
      disable = function(lang, buf) return lang == "latex" and vim.bo[buf].filetype == "tex" end,
    },
    indent = {
      enable = true,
      -- Disable treesitter indentation for 'latex' ONLY in 'tex' files
      disable = function(lang, buf) return lang == "latex" and vim.bo[buf].filetype == "tex" end,
    },
  },
  config = function(plugin, opts)
    -- Create a wrapper for tree-sitter to strip --no-bindings
    -- This fixes the incompatibility between AstroNvim's Treesitter and modern CLI versions.
    local data_path = vim.fn.stdpath "data"
    local wrapper_path = data_path .. "/tree-sitter"
    local f = io.open(wrapper_path, "w")
    if f then
      f:write("#!/bin/bash\n")
      f:write('args=()\n')
      f:write('for arg in "$@"; do [[ "$arg" != "--no-bindings" ]] && args+=("$arg"); done\n')
      f:write('exec /home/emgixiii/.cargo/bin/tree-sitter "${args[@]}"\n')
      f:close()
      vim.fn.setfperm(wrapper_path, "rwxr-xr-x")
      -- Put our wrapper at the front of the PATH for this Neovim session
      vim.env.PATH = data_path .. ":" .. vim.env.PATH
    end
    -- Call the standard AstroNvim treesitter configuration
    require "astronvim.plugins.configs.nvim-treesitter"(plugin, opts)
  end,
}
