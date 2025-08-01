vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		vim.keymap.set({ "n", "i" }, "<leader>cr", vim.lsp.buf.rename)
	end,
})
