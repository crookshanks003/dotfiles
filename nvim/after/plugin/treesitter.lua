local swap_next, swap_prev = (function()
	local swap_objects = {
		p = "@parameter.inner",
		f = "@function.outer",
		e = "@element",

		-- Not ready, but I think it's my fault :)
		-- v = "@variable",
	}

	local n, p = {}, {}
	for key, obj in pairs(swap_objects) do
		n[string.format("<M-Space><M-%s>", key)] = obj
		p[string.format("<M-BS><M-%s>", key)] = obj
	end

	return n, p
end)()

require'nvim-treesitter.configs'.setup {
	ensure_installed = {"javascript", "typescript", "tsx", "html", "css", "cpp", "lua", "json", "rust", "go"},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			-- mappings for incremental selection (visual mappings)
			init_selection = "<M-w>", -- maps in normal mode to init the node/scope selection
			node_incremental = "<M-w>", -- increment to the upper named parent
			node_decremental = "<M-S-w>", -- decrement to the previous node
			scope_incremental = "<M-e>", -- increment to the upper scope (as defined in locals.scm)
		}
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,

	},
	textobjects = {
		-- syntax-aware textobjects
		enable = true,
		keymaps = {
			-- or you use the queries from supported languages with textobjects.scm
			["af"] = "@function.outer",
			["if"] = "@function.inner",
			["aC"] = "@class.outer",
			["iC"] = "@class.inner",
			["ac"] = "@conditional.outer",
			["ic"] = "@conditional.inner",
			["ae"] = "@block.outer",
			["ie"] = "@block.inner",
			["al"] = "@loop.outer",
			["il"] = "@loop.inner",
			["is"] = "@statement.inner",
			["as"] = "@statement.outer",
			["ad"] = "@comment.outer",
			["am"] = "@call.outer",
			["im"] = "@call.inner"
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]p"] = "@parameter.inner",
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[p"] = "@parameter.inner",
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		select = {
			enable = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",

				["ac"] = "@conditional.outer",
				["ic"] = "@conditional.inner",

				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",

				["av"] = "@variable.outer",
				["iv"] = "@variable.inner",
			}
		},
		swap = {
			enable = true,
			swap_next = swap_next,
			swap_previous = swap_prev,
		},
	}
}
