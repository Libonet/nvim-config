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
				ensure_installed = { "lua_ls", "clangd", "pyright" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
    event = { 'BufReadPre', 'BufNewFile' },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
        cmd = {
          vim.fn.stdpath("data") .. "/mason/bin/clangd",
		      "--background-index", "--cross-file-rename", "--header-insertion=never"
	      },
				capabilities = capabilities,
			})
			lspconfig.hls.setup({
        filetypes = { 'haskell', 'lhaskell', 'cabal' },
			})
      lspconfig.elp.setup({
        capabilities = capabilities,
        filetypes = { 'erl' },
      })
      lspconfig.pyright.setup({})

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
