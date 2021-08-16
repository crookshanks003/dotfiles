local builtin = require "el.builtin"
local extensions = require "el.extensions"
local sections = require "el.sections"
local subscribe = require "el.subscribe"


local file_icon = subscribe.buf_autocmd("el_file_icon", "BufRead", function(_, bufnr)
	local icon = extensions.file_icon(_, bufnr)
	if icon then
		return icon .. " "
	end
	return ""
end)

local git_branch = subscribe.buf_autocmd("el_git_branch", "BufEnter", function(window, buffer)
	local bname = vim.fn.fnamemodify(vim.fn.bufname(buffer.bufnr), ":t:r")
	if bname == "NvimTree" then
		return ""
	elseif bname == "index" then
		return ""
	end
	local branch = extensions.git_branch(window, buffer)
	if branch then
		return " " .. extensions.git_icon() .. " " .. branch
	end
end)


local ws_diagnostic_counts = function(_, buffer)
	local bname = vim.fn.fnamemodify(vim.fn.bufname(buffer.bufnr), ":t:r")
	if bname == "index" or bname == "NvimTree" then
		return ""
	end
	local errors = vim.lsp.diagnostic.get_count(0, "Error")
	local hints = vim.lsp.diagnostic.get_count(0, "Hint")

	return string.format("E:%d  H:%d", errors, hints)
end

require("el").setup {
	generator = function(_, buffer)

		local items = {
			{ extensions.gen_mode { format_string = " %s " }, required = true },
			{ git_branch },
			{ " " },
			{ sections.split, required = true },
			{ file_icon },
			{ sections.maximum_width("%f", 0.40), required = true },
			{ builtin.modified_flag  },
			{ sections.split, required = true },
			{ ws_diagnostic_counts },
			{" "}
		}

		local result = {}
		for _, item in ipairs(items) do
			table.insert(result, item)
		end

		return result
	end,
}
