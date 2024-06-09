return {
	"nvimtools/none-ls.nvim",
  keys = {
    { "<leader>gf", vim.lsp.buf.format }
  },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
			},
		})

--		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
