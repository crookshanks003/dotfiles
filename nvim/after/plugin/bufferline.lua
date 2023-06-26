vim.g.barbar_auto_setup = false

require'barbar'.setup {
	animation = false,
	auto_hide = false,
	tabpages = true,
	clickable = false,
	icons = {
		buffer_index = true,
		buffer_number = false,
		button = ' ',
		-- Enables / disables diagnostic symbols
		diagnostics = {
			[vim.diagnostic.severity.ERROR] = {enabled = false, icon = 'ﬀ'},
			[vim.diagnostic.severity.WARN] = {enabled = false},
			[vim.diagnostic.severity.INFO] = {enabled = false},
			[vim.diagnostic.severity.HINT] = {enabled = false},
		},
		separator = {left = '▎', right = ''},

		modified = {button = ' '},
		pinned = {button = '車', filename = true, separator = {right = ''}},

		alternate = {filetype = {enabled = false}},
		current = {buffer_index = true},
		inactive = {button = ''},
		visible = {modified = {buffer_number = false}},
	},
	insert_at_end = false,
	minimum_padding = 1,
	maximum_padding = 3,
	maximum_length = 30,
	semantic_letters = true,
	letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
	no_name_title = nil,
}
