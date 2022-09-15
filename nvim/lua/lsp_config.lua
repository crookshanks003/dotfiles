local M = {}

M.config = function()
	vim.lsp.handlers["textDocument/definition"] = function(_, result)
		if not result or vim.tbl_isempty(result) then
			print "[LSP] Could not find definition"
			return
		end

		if vim.tbl_islist(result) then
			vim.lsp.util.jump_to_location(result[1], "utf-8")
		else
			vim.lsp.util.jump_to_location(result, "utf-8")
		end
	end

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = {
				prefix = "ﱢ",
				spacing = 1,
			},
			signs = true,
			underline = false,
		}
	)
end

--lsp_servers on_attach
M.on_attach_common = function()
	-- print("LSP Started")
	require("keybindings").lsp_bindings()
end

return M
