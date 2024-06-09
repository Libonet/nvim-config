return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>nt", "<cmd>Neotree filesystem reveal left toggle<cr>", desc = "NeoTree" },
  },
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
--    vim.keymap.set("n", "<leader>nt", ':Neotree filesystem reveal left toggle<CR>')
  end
}

