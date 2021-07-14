require'nvim-treesitter.configs'.setup {
    ensure_installed = {"javascript", "typescript", "tsx", "html", "css", "cpp", "lua", "json"},
    matchup = {
        enable = true
        -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
    },
    highlight = {
        enable = true
    },
}
