
-- g.nvim_tree_side = "left"
-- g.nvim_tree_width = 30
vim.g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
-- g.nvim_tree_auto_open = 0
-- g.nvim_tree_auto_close = 1
-- g.nvim_tree_quit_on_open = 0
-- g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_hide_dotfiles = 1
-- g.nvim_tree_git_hl = 0
vim.g.nvim_tree_root_folder_modifier = ":~"
-- g.nvim_tree_tab_open = 0
-- g.nvim_tree_allow_resize = 1
-- g.nvim_tree_update_cwd = 1
-- g.nvim_tree_lsp_diagnostics = 0
-- g.nvim_tree_auto_ignore_ft = {'startify', 'dashboard'}
-- g.nvim_tree_disable_default_keybindings = 1

vim.g.nvim_tree_show_icons = {
	git = 0,
	folders = 1,
	files = 1,
	folder_arrows = 1
}

vim.g.nvim_tree_icons = {
	default = '',
	symlink = '',
	folder = {
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = ""
	}
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require"nvim-tree".setup{
	disable_netrw       = true,
	hijack_netrw        = true,
	open_on_setup       = false,
	ignore_ft_on_setup  = {"startify", "dashboard"},
	auto_close          = true,
	open_on_tab         = false,
	hijack_cursor       = false,
	update_cwd          = false,
	lsp_diagnostics     = false,
	update_focused_file = {
		enable      = true,
		update_cwd  = false,
		ignore_list ={"startify", "dashboard"}
	},
	system_open = {
		cmd  = nil,
		args = {}
	},

	view = {
		width = 30,
		side = 'left',
		auto_resize = false,
		mappings = {
			custom_only = true,
			list = {
				{ key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
				{ key = "n",                            cb = tree_cb("create") },
				{ key = "d",                            cb = tree_cb("remove") },
				{ key = "r",                            cb = tree_cb("full_rename") },
				{ key = "h",                            cb = tree_cb("split")},
				{ key = "v",                            cb = tree_cb("vsplit")},
				{ key = "I",                            cb = tree_cb("toggle_ignored") },
				{ key = "H",                            cb = tree_cb("toggle_dotfiles") },
				{ key = "R",                            cb = tree_cb("refresh") },
				{ key = "<BS>",                         cb = tree_cb("dir_up") },
				{ key = {"<C-]>"},                      cb = tree_cb("cd") },
			}
		}
	}
}
