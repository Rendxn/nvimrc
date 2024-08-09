local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set("n", "<BS>", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", ".", api.tree.change_root_to_node, opts("Set root"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvimtree = require("nvim-tree")
		local api = require("nvim-tree.api")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			on_attach = my_on_attach,

			view = {
				width = 35,
				relativenumber = true,
			},

			renderer = {
				indent_markers = {
					enable = true,
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			git = {
				ignore = false,
			},
			filters = { custom = { "^.git$" } },
		})

		vim.keymap.set("n", "<leader>ee", api.tree.toggle, { desc = "Toggle file explorer" })
		vim.keymap.set("n", "<leader>ef", api.tree.find_file, { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
		vim.keymap.set("n", "<leader>ec", api.tree.collapse_all, { desc = "Collapse file explorer" }) -- collapse file explorer
		vim.keymap.set("n", "<leader>er", api.tree.reload, { desc = "Refresh file explorer" }) -- refresh file explorer
	end,
}
