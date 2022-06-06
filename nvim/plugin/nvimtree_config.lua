local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require"nvim-tree".setup{
	disable_netrw       = true,
	hijack_netrw        = true,
	open_on_setup       = false,
	ignore_ft_on_setup  = {"startify", "dashboard"},
	open_on_tab         = false,
	hijack_cursor       = false,
	update_cwd          = false,
	update_focused_file = {
		enable      = true,
		update_cwd  = false,
		ignore_list ={"startify", "dashboard"}
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 400,
	},
	filters = {
		dotfiles = true,
	},
	system_open = {
		cmd  = nil,
		args = {}
	},

	view = {
		width = 30,
		side = 'left',
		mappings = {
			custom_only = true,
			list = {
				{ key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
				{ key = "n",                            cb = tree_cb("create") },
				{ key = "d",                            cb = tree_cb("remove") },
				{ key = "r",                            cb = tree_cb("full_rename") },
				{ key = "h",                            cb = tree_cb("split")},
				{ key = "v",                            cb = tree_cb("vsplit")},
				{ key = "I",                            cb = tree_cb("toggle_git_ignored") },
				{ key = "H",                            cb = tree_cb("toggle_dotfiles") },
				{ key = "R",                            cb = tree_cb("refresh") },
				{ key = "<BS>",                         cb = tree_cb("dir_up") },
				{ key = {"<C-]>"},                      cb = tree_cb("cd") },
			}
		}
	}
}
