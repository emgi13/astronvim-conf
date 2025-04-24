return {
  "AstroNvim/astrolsp",
  opts = {
    servers = { "julials" },
    config = {
      julials = {
        on_new_config = function(new_config)
          -- check for nvim-lspconfig julia sysimage shim
          local julia = (vim.env.JULIA_DEPOT_PATH or vim.fn.expand "~/.julia")
            .. "/environments/nvim-lspconfig/bin/julia"
          if require("lspconfig").util.path.is_file(julia) then new_config.cmd[1] = julia end
        end,
        -- recommended default settings used by Julia VS Code extension
        settings = {
          julia = {
            completionmode = "qualify",
            lint = {
              missingrefs = "none",
            },
            inlayHints = {
              static = {
                enabled = false,
                variableTypes = { enabled = true },
              },
            },
          },
        },
      },
    },
  },
}
