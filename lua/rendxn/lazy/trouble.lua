return {
	"folke/trouble.nvim",
	opts = {},
	cmd = "Trouble",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	keys = {
		{ "<leader>xq", "<cmd>Trouble close<CR>", desc = "Close trouble list" },
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open/close diagnostics trouble list" },
		{
			"<leader>xd",
			"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
			desc = "Open trouble document diagnostics",
		},
		{ "<leader>xf", "<cmd>Trouble qflist toggle<CR>", desc = "Open trouble quickfix list" },
		{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open trouble location list" },
		{
			"<leader>xt",
			"<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<CR>",
			desc = "Open todos in trouble",
		},
	},
}
