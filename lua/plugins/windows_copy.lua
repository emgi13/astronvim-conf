if true then return {} end
local is_wsl = vim.uv.os_uname().release:lower():find "microsoft"
if not is_wsl then return {} end

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    options = {
      g = {
        clipboard = {
          name = "Win32Yank",
          copy = {
            ["+"] = "win32yank.exe -i --crlf",
            ["*"] = "win32yank.exe -i --crlf",
          },
          paste = {
            ["+"] = "win32yank.exe -o --lf",
            ["*"] = "win32yank.exe -o --lf",
          },
          cache_enabled = 0,
        },
      },
    },
  },
}
