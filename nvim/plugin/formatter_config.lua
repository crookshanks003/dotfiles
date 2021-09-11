require('formatter').setup({
	logging = false,
	filetype = {
		javascript = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath", vim.api.nvim_buf_get_name(0),
						'--single-quote=false',
						'--tab-width', 4,
						'--use-tabs',
						'--print-width', 80,
					},
					stdin = true
				}
			end
		},
		javascriptreact = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath", vim.api.nvim_buf_get_name(0),
						'--single-quote=false',
						'--tab-width', 4,
						'--use-tabs',
						'--print-width', 100,
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
						'--single-quote=false',
						'--tab-width', 4,
						'--use-tabs',
						'--print-width', 100,
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
						'--single-quote=false',
						'--tab-width', 4,
						'--use-tabs',
						'--print-width', 100,
						'--jsx-bracket-same-line',
					},
					stdin = true
				}
			end
		},
		json = {
			function ()
				return {
					exe="prettier",
					args = {
						"--stdin-filepath", vim.api.nvim_buf_get_name(0),
						'--single-quote=false',
						'--tab-width', 4,
						'--use-tabs',
						'--print-width', 100,
					},
					stdin=true
				}
			end
		},
		css = {
			function ()
				return {
					exe="prettier",
					args = {
						"--stdin-filepath", vim.api.nvim_buf_get_name(0),
						'--single-quote=false',
						'--tab-width', 4,
						'--use-tabs',
						'--print-width', 100,
					},
					stdin=true
				}
			end
		},
		html = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath", vim.api.nvim_buf_get_name(0),
						'--single-quote=false',
						'--tab-width', 4,
						'--use-tabs',
						'--print-width', 100,
						'--jsx-bracket-same-line',
					},
					stdin = true
				}
			end
		},
		cpp = {
			function()
				return {
					exe = "clang-format",
					args = {
						"--assume-filename", vim.api.nvim_buf_get_name(0),
						'-style="{ BasedOnStyle: LLVM, UseTab: Always, IndentWidth: 4, TabWidth: 4, AllowShortIfStatementsOnASingleLine: true}"',
					},
					stdin = true,
					cwd = vim.fn.expand('%:p:h')  -- Run clang-format in cwd of the file.
				}
			end
		},
	}
})
