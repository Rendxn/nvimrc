return {
  {
    "danymat/neogen",
    config = function()
      require("neogen").setup()

      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<Leader>nf", "<cmd>Neogen func<CR>", opts)
      vim.keymap.set("n", "<Leader>nt", "<cmd>Neogen type<CR>", opts)
      vim.keymap.set("n", "<Leader>nc", "<cmd>Neogen class<CR>", opts)
    end,
  },
}
