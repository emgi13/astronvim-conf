---@type LazySpec
return {
  "jbyuki/nabla.nvim",
  ft = {
    "markdown",
    "markdown.mdx",
  },
  config = function()
    require("astrocore").set_mappings {
      n = {
        ["<Leader>m"] = {
          function() require("nabla").popup() end,
          desc = "Popup Math",
        },
      },
    }
  end,
}
