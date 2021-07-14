local g = vim.g

-- vim.o.termguicolors = true

g.nvim_tree_side = "left"
g.nvim_tree_width = 30
g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
g.nvim_tree_auto_open = 0
g.nvim_tree_auto_close = 1
g.nvim_tree_quit_on_open = 1
g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_root_folder_modifier = ":t"
g.nvim_tree_tab_open = 0
g.nvim_tree_allow_resize = 1
g.nvim_tree_lsp_diagnostics = 1
-- g.nvim_tree_auto_ignore_ft = {'startify', 'dashboard'}
g.nvim_tree_disable_default_keybindings = 1

g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1
}

vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = "",
        staged = "S",
        unmerged = "",
        renamed = "➜",
        deleted = "",
        untracked = "U",
        ignored = "◌"
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = ""
    }
}
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.cmd "highlight NvimTreeGitDirty guifg=#d79921"
vim.cmd "highlight NvimTreeFolderName guifg=#ebdbb2 gui=bold"
vim.cmd "highlight NvimTreeOpenedFolderName guifg=#ebdbb2 gui=bold"

vim.g.nvim_tree_bindings = {
    { key = "h",                            cb = tree_cb("split")},
    { key = "v",                            cb = tree_cb("vsplit")},
    { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
    { key = {"<C-]>"},                      cb = tree_cb("cd") },
    { key = "t",                            cb = tree_cb("tabnew") },
    { key = "P",                            cb = tree_cb("parent_node") },
    { key = "<S-CR>",                       cb = tree_cb("close_node") },
    { key = "K",                            cb = tree_cb("first_sibling") },
    { key = "J",                            cb = tree_cb("last_sibling") },
    { key = "I",                            cb = tree_cb("toggle_ignored") },
    { key = "H",                            cb = tree_cb("toggle_dotfiles") },
    { key = "R",                            cb = tree_cb("refresh") },
    { key = "n",                            cb = tree_cb("create") },
    { key = "d",                            cb = tree_cb("remove") },
    { key = "r",                            cb = tree_cb("full_rename") },
    { key = "y",                            cb = tree_cb("copy_name") },
    { key = "Y",                            cb = tree_cb("copy_path") },
    { key = "gy",                           cb = tree_cb("copy_absolute_path") },
    { key = "[c",                           cb = tree_cb("prev_git_item") },
    { key = "]c",                           cb = tree_cb("next_git_item") },
    { key = "<BS>",                         cb = tree_cb("dir_up") },
    { key = "g?",                           cb = tree_cb("toggle_help") },
}
