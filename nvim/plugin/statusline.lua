local fn = vim.fn
local api = vim.api
local M = {}

function string.starts(String,Start)
	return string.sub(String,1,string.len(Start))==Start
end

M.modes = setmetatable({
	['n']  = '%#GruvboxFg0# Normal ';
	['no'] = '%#GruvboxFg0# N·pending ';
	['v']  = '%#GruvboxOrange# Visual ';
	['V']  = '%#GruvboxOrange# V·line ';
	[''] = '%#GruvboxOrange# V·block ';
	['s']  = '%#GruvboxOrange# Select ';
	['S']  = '%#GruvboxOrange# S·line ';
	[''] = '%#GruvboxOrange# S·block ';
	['i']  = '%#GruvboxBlue# Insert ';
	['ic'] = '%#GruvboxBlue# Insert ';
	['R']  = '%#GruvboxRed# Replace ';
	['Rv'] = '%#GruvboxRed# V·replace ';
	['c']  = '%#GruvboxGreen# Command ';
	['cv'] = '%#GruvboxGreen# Vim·ex ';
	['ce'] = '%#GruvboxGreen# Ex ';
	['r']  = '%#GruvboxGreen# Prompt ';
	['rm'] = '%#GruvboxGreen# More ';
	['r?'] = '%#GruvboxGreen# Confirm ';
	['!']  = '%#GruvboxGreen# Shell ';
	['t']  = '%#GruvboxPurple# Terminal ';
}, {
	__index = function()
		return 'Unknown'
	end
})

M.get_mode = function(self)
	local mode = api.nvim_get_mode().mode
	return self.modes[mode]
end

M.get_git_branch = function()
	local git_branch = vim.fn["FugitiveHead"]()
	local width = vim.api.nvim_win_get_width(0)
	if width<80 then
		return""
	end
	if not git_branch or git_branch == "" then
		return "  no-git"
	end
	local st = string.sub(git_branch,1,4)
	if st == "task" or st == "feat" then
		local pre = string.sub(git_branch, 1, 1)
		local e = string.find(git_branch, "_")
		if e == nil then
			e = 5
		end
		git_branch = pre.."/"..string.sub(git_branch, e+1)
	end
	return "  "..string.sub(git_branch, 1, 12)
end

M.get_filename = function ()
	local file_name, file_ext = fn.expand("%:t"), fn.expand("%:e")
	local icon = require'nvim-web-devicons'.get_icon(file_name, file_ext, { default = true })
	local width = vim.api.nvim_win_get_width(0)
	local filename = ""
	if width<80 then
		filename = vim.fn.fnamemodify(vim.fn.bufname(), ":t")
	else filename = vim.fn.fnamemodify(vim.fn.bufname(), ":.")
	end
	return icon.." "..filename.."%m"
end

M.get_lsp_status = function ()
	local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
	hints = hints + #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	return string.format("E:%d  W:%d ", errors, hints)
end

M.set_active = function(self)
	local filetype = vim.bo.filetype
	if filetype == "fugitive" or filetype == "NvimTree" then
		return "%="..filetype.."%="
	end

	local mode = self:get_mode()
	local git_branch = "%#StatusLine#"..self:get_git_branch()
	local filename = "%#StatusLine#"..self:get_filename()
	local lsp_status = self:get_lsp_status()

	return table.concat({
		"%#StatusLine#", mode,git_branch,
		"%=", filename, "%=",
		lsp_status
	})
end

M.set_inactive = function ()
	return "%#StatusLineNC#".."%=%f%="
end

Statusline = setmetatable(M, {
	__call = function(statusline, mode)
		if mode == "active" then return statusline:set_active() end
		if mode == "inactive" then return statusline:set_inactive() end
	end
})


api.nvim_exec([[
augroup Statusline
au!
au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline('active')
au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline('inactive')
augroup END
]], false)
