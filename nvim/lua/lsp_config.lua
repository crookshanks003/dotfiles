local M = {}

M.config = function()
	vim.fn.sign_define(
	"LspDiagnosticsSignError",
	{texthl = "LspDiagnosticsSignError", text = ">>", numhl = "LspDiagnosticsSignError"}
	)
	vim.fn.sign_define(
	"LspDiagnosticsSignWarning",
	{texthl = "LspDiagnosticsSignWarning", text = ">>", numhl = "LspDiagnosticsSignWarning"}
	)
	vim.fn.sign_define(
	"LspDiagnosticsSignHint",
	{texthl = "LspDiagnosticsSignHint", text = ">>", numhl = "LspDiagnosticsSignHint"}
	)
	vim.fn.sign_define(
	"LspDiagnosticsSignInformation",
	{texthl = "LspDiagnosticsSignInformation", text = ">>", numhl = "LspDiagnosticsSignInformation"}
	)

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

	vim.lsp.protocol.CompletionItemKind = {
		"   (Text) ",
		"   (Method)",
		"   (Function)",
		"   (Constructor)",
		" ﴲ  (Field)",
		"  (Variable)",
		"   (Class)",
		" ﰮ  (Interface)",
		"   (Module)",
		" 襁 (Property)",
		"   (Unit)",
		"   (Value)",
		" 練 (Enum)",
		"   (Keyword)",
		"   (Snippet)",
		"   (Color)",
		"   (File)",
		"   (Reference)",
		"   (Folder)",
		"   (EnumMember)",
		" ﲀ  (Constant)",
		" ﳤ  (Struct)",
		"   (Event)",
		"   (Operator)",
		"   (TypeParameter)"
	}
end


--lsp_servers on_attach
M.on_attach_common = function()
	print("LSP Started")
	require("keybindings").lsp_bindings()
end

return M
