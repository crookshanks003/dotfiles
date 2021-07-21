require('formatter').setup({
    logging = false,
    filetype = {
        javascript = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath", vim.api.nvim_buf_get_name(0),
						'--single-quote',
						'--tab-width', 4,
						'--use-tabs',
						'--print-width', 80,
					},
					stdin = true
				}
			end
		},
        typescript = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath", vim.api.nvim_buf_get_name(0),
						'--single-quote',
						'--tab-width', 4,
						'--use-tabs',
						'--print-width', 80,
					},
					stdin = true
				}
			end
		},
        typescriptreact = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath", vim.api.nvim_buf_get_name(0),
						'--single-quote',
						'--tab-width', 4,
						'--use-tabs',
						'--print-width', 80,
						'--jsx-bracket-same-line',
					},
					stdin = true
				}
			end
		},
    }
})
