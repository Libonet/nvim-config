return {
	"nvim-lualine/lualine.nvim",
  event = "InsertEnter",
	config = function()
		require("lualine").setup({
			options = {
				theme = "kanagawa",
			},
      extensions = {
        'fzf', 'lazy', 'mason',
      },
		})
	end,
}
