vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		vim.keymap.set({ "n", "i" }, "<F2>", vim.lsp.buf.rename)
	end,
})
