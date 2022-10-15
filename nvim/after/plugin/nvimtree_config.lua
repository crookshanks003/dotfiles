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
	renderer = {
		highlight_git = true,
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = false,
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
			},
		},
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
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
				{ key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit"},
				{ key = "n",                            action = "create"},
				{ key = "d",                            action = "remove"},
				{ key = "r",                            action = "full_rename"},
				{ key = "h",                            action = "split"},
				{ key = "v",                            action = "vsplit"},
				{ key = "I",                            action = "toggle_git_ignored"},
				{ key = "H",                            action = "toggle_dotfiles"},
				{ key = "R",                            action = "refresh"},
				{ key = "f",                            action = "live_filter" },
				{ key = "F",                            action = "clear_live_filter" },
				{ key = "<BS>",                         action = "dir_up"},
				{ key = {"<C-]>"},                      action = "cd"},
			}
		}
	},
	live_filter = {
		prefix = "> ",
		always_show_folders = true,
	},
}
