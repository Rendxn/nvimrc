return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    multiline_threshold = 3, -- Maximum number of lines to show for a single context
    max_lines = 5,
  },
}
