require"nvim-tree".setup{
	disable_netrw       = true,
	hijack_netrw        = true,
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
	},
	live_filter = {
		prefix = "> ",
		always_show_folders = true,
	},
	on_attach = function (bufnr)
		local api = require('nvim-tree.api')

		local function opts(desc)
			return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end


		vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
		vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
		vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
		vim.keymap.set('n', 'n', api.fs.create, opts('Create'))
		vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
		vim.keymap.set('n', 'r', api.fs.rename_sub, opts('Rename: Omit Filename'))
		vim.keymap.set('n', 'h', api.node.open.horizontal, opts('Open: Horizontal Split'))
		vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
		vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
		vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
		vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
		vim.keymap.set('n', 'f', api.live_filter.start, opts('Filter'))
		vim.keymap.set('n', 'F', api.live_filter.clear, opts('Clean Filter'))
		vim.keymap.set('n', '<BS>', api.tree.change_root_to_parent, opts('Up'))
		vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))

	end
}
