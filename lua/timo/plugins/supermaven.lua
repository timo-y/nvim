return {
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({
				keymaps = {
					accept_suggestion = "<C-x>",
					clear_suggestion = "<C-]>",
					accept_word = "<C-l>",
				},
			})
		end,
		keys = {
			{
				"<leader>tS",
				function()
					vim.cmd("SupermavenToggle")
				end,
				desc = "Toggle Supermaven",
			},
		},
	},
}
