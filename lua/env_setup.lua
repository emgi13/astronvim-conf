-- Setup environment specific configurations

local is_wsl = vim.uv.os_uname().release:lower():find "microsoft"
if is_wsl then
  vim.g.node_host_prog = "/home/linuxbrew/.linuxbrew/bin/neovim-node-host"
  vim.g.ruby_host_prog = "/home/linuxbrew/.linuxbrew/lib/ruby/gems/3.4.0/bin/neovim-ruby-host"
  vim.g.perl_host_prog = "PERL5LIB=/home/emgixiii/perl5/lib/perl5 /usr/bin/perl"
  vim.g.vimtex_view_sioyek_exe = "sioyek.exe" -- Windows exe in PATH
  vim.g.vimtex_callback_progpath = "wsl nvim" -- Call nvim inside WSL from Windows inverse search, also enable `vimtex_wsl_fix 1` in sioyek
end
