return {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    view = {
      merge_tool = {
        layout = "diff3_mixed",
      },
    },
  },
}
