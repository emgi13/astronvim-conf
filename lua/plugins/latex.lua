---@type LazySpec[]
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "texlab",
        "ltex-ls",
      },
    },
  },
  {
    "icewind/ltex-client.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
}
