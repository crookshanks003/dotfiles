require('formatter').setup({
    logging = false,
    filetype = {
        javascript = {
            -- prettier
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath", vim.api.nvim_buf_get_name(0),
                        '--single-quote',
                        '--tab-width', 4,
                        '--use-tabs',
                        '--print-width', 80,
                    },
                    stdin = true
                }
            end
        },
        typescript = {
            -- prettier
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath", vim.api.nvim_buf_get_name(0),
                        '--single-quote',
                        '--tab-width', 4,
                        '--use-tabs',
                        '--print-width', 80,
                    },
                    stdin = true
                }
            end
        },
        typescriptreact = {
            -- prettier
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath", vim.api.nvim_buf_get_name(0),
                        '--single-quote',
                        '--tab-width', 4,
                        '--use-tabs',
                        '--print-width', 80,
                    },
                    stdin = true
                }
            end
        },
    }
})
