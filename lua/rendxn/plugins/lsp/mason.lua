return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      -- LSPs
      "ts_ls",
      "html",
      "emmet_ls",
      "cssls",
      "cssmodules_ls",
      "stylelint_lsp",
      "graphql",
      "jsonls",
      "lua_ls",
      "eslint",

      -- formatters
      "stylua",
    },
  },
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ensure_installed = {
          "eslint_d",
          "prettierd",
          "stylelint",
        },
      },
    },
    "neovim/nvim-lspconfig",
  },
}
