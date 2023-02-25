local lint = require('lint')

local js = {"javascript", "javascriptreact", "typescript", "typescriptreact"}
for _, ft in pairs(js) do
	lint.linters_by_ft[ft] = {'eslint'}
end

lint.linters.golang_linter = {
	name = 'golang_linter',
	cmd = 'golangci-lint',
	append_fname = false,
	args = {
		'run',
		'--out-format',
		'json',
	},
	ignore_exitcode = true,
	parser = function(output, bufnr)
		if output == '' then
			return {}
		end
		local decoded = vim.json.decode(output)
		if decoded["Issues"] == nil or type(decoded["Issues"]) == 'userdata' then
			return {}
		end

		local diagnostics = {}
		local cwd = vim.fn.getcwd()
		local curfile = vim.api.nvim_buf_get_name(bufnr)
		for _, item in ipairs(decoded["Issues"]) do
			if item.FromLinter ~= 'typecheck' then
				local lintedfile = cwd .. "/" .. item.Pos.Filename
				if curfile == lintedfile then
					table.insert(diagnostics, {
						lnum = item.Pos.Line > 0 and item.Pos.Line - 1 or 0,
						col = item.Pos.Column > 0 and item.Pos.Column - 1 or 0,
						end_lnum = item.Pos.Line > 0 and item.Pos.Line - 1 or 0,
						end_col = item.Pos.Column > 0 and item.Pos.Column - 1 or 0,
						severity = vim.diagnostic.severity.WARN,
						source = item.FromLinter,
						message = item.Text,
					})
				end
			end
		end
		return diagnostics
	end
}

lint.linters_by_ft = {
	go = {'golang_linter'},
	typescript = {'eslint'},
	typescriptreact = {'eslint'},
}
