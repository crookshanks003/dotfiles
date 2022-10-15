require('telescope').setup {
	pickers = {
		buffers = {
			sort_lastused = true,
			theme = "dropdown",
			previewer = false,
			mappings = {
				i = {
					["<c-d>"] = "delete_buffer",
				},
				n = {
					["<c-d>"] = require("telescope.actions").delete_buffer,
				}
			}
		},
		find_files = {
			theme = "dropdown",
			previewer=false
		},
		git_files = {
			theme = "dropdown",
			previewer=false
		},
		oldfiles = {
			theme = "dropdown",
			previewer=false
		}
	},
	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
		}
	}
}

require('telescope').load_extension('fzf')
vim.cmd[[autocmd User TelescopePreviewerLoaded setlocal wrap]]
