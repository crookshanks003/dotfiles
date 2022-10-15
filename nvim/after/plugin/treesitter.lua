require'nvim-treesitter.configs'.setup {
    ensure_installed = {"javascript", "typescript", "tsx", "html", "css", "cpp", "lua", "json", "rust", "go"},
    highlight = {
        enable = true
    },
}
