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
			return {
				exe = "gofmt "..vim.api.nvim_buf_get_name(0),
				stdin = true
			}
		end
	},
};

local js = {"javascript", "javascriptreact", "typescript", "typescriptreact", "json", "css", "html"}
local c = {"cpp", "c"}

for _, type in pairs(js) do
	filetypes[type] =  {
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
