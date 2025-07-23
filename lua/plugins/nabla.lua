---@type LazySpec
return {
  "jbyuki/nabla.nvim",
  ft = {
    "markdown",
    "markdown.mdx",
  },
  dependencies = {
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        autocmds = {
          buffer_enable_nabla = {
            {
              event = "FileType",
              pattern = { "markdown", "markdown.mdx" },
              desc = "Enable Nabla buffer local",
              callback = function(opts)
                require("astrocore").set_mappings({
                  n = {
                    ["<localleader>m"] = {
                      function() require("nabla").popup() end,
                      desc = "Preview Math",
                    },
                  },
                }, { buffer = opts.buf })
              end,
            },
          },
        },
      },
    },
  },
}
