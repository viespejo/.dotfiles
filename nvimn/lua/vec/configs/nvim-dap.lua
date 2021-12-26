-- vim: set sw=2 ts=2 sts=2 foldmethod=marker:

local dap = require('dap')
-- dap.set_log_level('DEBUG')

-- php {{{
dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { vim.env.XDG_DATA_HOME .. '/dap-adapters/vscode-php-debug/out/phpDebug.js' },
}

dap.configurations.php = {
  type = 'php',
  request = 'launch',
  name = 'Listen for Xdebug',
  port = 9000,
  stopOnEntry = false,
  serverSourceRoot = '/usr/share/nginx',
  localSourceRoot = '/home/its32ve1/Data/code/www',
}
-- }}}

-- go {{{

-- ...see ~/.dotfiles/nvimn/lua/vec/dap-go.lua
require('vec.dap-go').setup()

-- }}}
