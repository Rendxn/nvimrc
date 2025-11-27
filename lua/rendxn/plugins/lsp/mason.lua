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
      "graphql",
      "jsonls",
      "lua_ls",

      -- formatters
      "stylua",
    },
  },
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ensure_installed = {
          "stylelint",
          "eslint_d",
          "prettierd",
        },
      },
    },
    "neovim/nvim-lspconfig",
  },
}
