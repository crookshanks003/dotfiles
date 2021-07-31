local config = {
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch'},
		lualine_c = {'filename'},
		lualine_x = {'filetype'},
		lualine_y = {},
		lualine_z = {{'diagnostics', sources={"nvim_lsp"}, sections={'error'}, color_error="#ebdbb2", bg_error="#cc241d"}}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	extensions = {'nvim-tree', 'fugitive'
}}

require'lualine'.setup(config)
