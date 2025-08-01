vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.keymap.set({ "n" }, "<leader>cr", vim.lsp.buf.rename)
  end,
})
