return {
	"kevinhwang91/nvim-ufo",
	events = "VeryLazy",
	dependencies = { "kevinhwang91/promise-async" },
	init = function()
		vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
		vim.o.foldcolumn = "auto:9"
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
	end,
	opts = {
		provider_selector = function()
			return { "lsp", "indent" }
		end,
	},
}
