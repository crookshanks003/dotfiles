local linter_opts = {
	name = 'golangci',
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

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
	pattern={"*.go"},
	callback = function()
		require('linter').try_lint(linter_opts)
	end,
})
