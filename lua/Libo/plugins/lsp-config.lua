return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd", "basedpyright" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { 'saghen/blink.cmp' },
        event = { 'BufReadPre', 'BufNewFile' },

        config = function()
            local lspconfig = vim.lsp.config
            local blink = require("blink.cmp")

            lspconfig('lua_ls', {
                capabilities = blink.get_lsp_capabilities(),
            })
            lspconfig('hls', {
                filetypes = { 'haskell', 'lhaskell', 'cabal' },
            })
            lspconfig('elp', {
                capabilities = blink.get_lsp_capabilities(),
                filetypes = { 'erl' },
            })
            lspconfig('pyright', {})
            lspconfig('ruby_lsp', {
                init_options = {
                    formatter = 'standard',
                    linters = { 'standard' },
                },
            })

            vim.lsp.enable('lua_ls')
            vim.lsp.enable('hls')
            vim.lsp.enable('elp')
            vim.lsp.enable('pyright')
            vim.lsp.enable('ruby_lsp')

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
            vim.keymap.set("n", "gI", vim.lsp.buf.implementation, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})

            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts)
            vim.keymap.set("n", "<leader>r", vim.diagnostic.goto_next, {})
        end,
    },
}
