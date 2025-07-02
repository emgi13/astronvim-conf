return {
  "AstroNvim/astrolsp",
  opts = {
    -- manually set up the Julia language server
    -- since we won't be using Mason
    servers = { "julials" },
    config = {
      julials = {
        on_new_config = function(new_config)
          -- check for nvim-lspconfig julia sysimage shim
          -- this path may need to be updated if you set it up differently
          -- than the repository recommends above
          local julia = (vim.env.JULIA_DEPOT_PATH or vim.fn.expand "~/.julia")
            .. "/environments/nvim-lspconfig/bin/julia"
          -- if the shim is found, then update the julia command
          if require("lspconfig").util.path.is_file(julia) then new_config.cmd[1] = julia end
        end,
      },
    },
  },
}
