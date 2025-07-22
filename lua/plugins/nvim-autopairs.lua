--- INFO: Disbale in Markdown (Conflicting with Obsidian)
---
---@type LazySpec
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    disable_filetype = { "markdown" },
  },
}
