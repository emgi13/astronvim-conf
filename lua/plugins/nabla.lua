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
                    ["<LocalLeader>,"] = {
                      function() require("nabla").popup() end,
                      desc = "Popup Math",
                    },
                    ["<LocalLeader>!"] = {
                      function() require("nabla").toggle_virt() end,
                      desc = "Toggle Nabla Virtualization",
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
