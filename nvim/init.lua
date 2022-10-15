local home_dir = os.getenv("HOME")
package.path = home_dir .. "/.config/nvim/plugin/?.lua;" .. package.path

require('settings')
require('keybindings').default_bindings()
require('lsp_config').config()
require('lsp_servers')
