--- WARN: wrapping vim.deprecate to supress float warning
local original_deprecate = vim.deprecate
vim.deprecate = function(name, alternative, version, plugin, backtrace)
  if name == "opts.jump.float" then return end -- HACK: check again in NVIMv0.13
  return original_deprecate(name, alternative, version, plugin, backtrace)
end

-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

local is_wsl = vim.uv.os_uname().release:lower():find "microsoft"
if is_wsl then
  vim.g.node_host_prog = "/home/linuxbrew/.linuxbrew/bin/neovim-node-host"
  vim.g.ruby_host_prog = "/home/linuxbrew/.linuxbrew/lib/ruby/gems/3.4.0/bin/neovim-ruby-host"
  vim.g.perl_host_prog = "PERL5LIB=/home/emgixiii/perl5/lib/perl5 /usr/bin/perl"
end

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath })
  if vim.v.shell_error ~= 0 then
    -- stylua: ignore
    vim.api.nvim_echo(
      { { ("Error cloning lazy.nvim:\n%s\n"):format(result), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } },
      true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end
end

vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo(
    { { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } },
    true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"
