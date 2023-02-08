local utils = require('formatter.util')
local ftypes = require('formatter.filetypes')

local filetypes = {
	rust = {
		function()
			return {
				exe = "rustfmt",
				args = {"--emit=stdout"},
				stdin = true
			}
		end
	},
	go = {
		function()
			require("go.format").goimport()
		end
	},
	python = ftypes.python.black,
};

local js = {"javascript", "javascriptreact", "typescript", "typescriptreact", "json", "css", "html"}
local c = {"cpp", "c"}

for _, type in pairs(js) do
	filetypes[type] =  {
			function()
				return {
					exe = "prettier",
					args = {
						'--config-precedence', 'prefer-file',
						"--stdin-filepath", utils.escape_path(vim.api.nvim_buf_get_name(0)),
						'--single-quote=true',
						'--tab-width', 4,
						'--use-tabs',
						'--print-width', 80,
					},
					stdin = true
				}
			end
	}
end

for _,type in pairs(c) do
	filetypes[type] = {
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
	}
end

require('formatter').setup({
	logging = false,
	filetype = filetypes,
})
