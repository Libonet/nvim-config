return {
	{
		"nvim-telescope/telescope.nvim",
    event = { "VimEnter" },
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>ob", builtin.buffers, {})
			vim.keymap.set("n", "<leader>lf", builtin.current_buffer_fuzzy_find, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
    event = { "VimEnter" },
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
