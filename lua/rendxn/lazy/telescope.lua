return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		require("telescope").setup({})
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("flutter")

		local config = require("telescope.config").values
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Commands" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find git files" })
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find recent files" })
		vim.keymap.set("n", "<leader>fs", function()
			local word = vim.fn.expand("<cword>")
			builtin.live_grep({
				search = word,
				vimgrep_arguments = table.insert(config.vimgrep_arguments, "--fixed-strings"),
			})
		end, { desc = "Search text in workspace" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search help tags" })
	end,
}
