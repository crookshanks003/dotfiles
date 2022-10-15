local uv = vim.loop
local api = vim.api
local notify = vim.notify
local M = {}

local namespaces = setmetatable({}, {
	__index = function(tbl, key)
		local ns = api.nvim_create_namespace(key)
		rawset(tbl, key, ns)
		return ns
	end
})

function M.try_lint(linter, opts)
	local ok, err = pcall(M.lint, linter, opts)
	if not ok then
		notify(err, vim.log.levels.WARN)
	end
end

function M.lint(linter, opts)
	local stdin = uv.new_pipe(false)
	local stdout = uv.new_pipe(false)
	local stderr = uv.new_pipe(false)
	local handle, pid_or_err
	local args = linter.args
	local cmd = linter.cmd
	local bufnr = api.nvim_get_current_buf()
	opts = opts or {}
	local linter_opts = {
		args = args,
		stdio = { stdin, stdout, stderr },
		cwd = opts.cwd or vim.fn.getcwd(),
		detached = false
	}

	handle, pid_or_err = uv.spawn(cmd, linter_opts, function()
		handle:close()
	end)
	if not handle then
		stdout:close()
		stderr:close()
		stdin:close()
		vim.notify('Error running ' .. cmd .. ': ' .. pid_or_err, vim.log.levels.ERROR)
		return
	end
	local ns = namespaces[linter.name]

	local publish = function(diagnostics)
		if api.nvim_buf_is_valid(bufnr) then
			vim.diagnostic.set(ns, bufnr, diagnostics)
		end
		stdout:shutdown()
		stdout:close()
		stderr:shutdown()
		stderr:close()
	end

	local chunks = {}
	local reader = function (err, chunk)
		assert(not err, err)
		if chunk then
			table.insert(chunks, chunk)
		else
			vim.schedule(function()
				local output = table.concat(chunks)
				local diagnostics
				if vim.api.nvim_buf_is_valid(bufnr) then
					diagnostics = linter.parser(output, bufnr, linter.cwd)
				else
					diagnostics = {}
				end
				publish(diagnostics)
			end)
		end
	end

	stdout:read_start(reader)
	stdin:close()
end

return M
