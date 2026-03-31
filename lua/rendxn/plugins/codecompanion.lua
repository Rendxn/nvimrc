return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {

    interactions = {
      chat = { adapter = "kiro" },
      inline = { adapter = "kiro", opts = { enabled = false } }, -- won't work. it's ok.
      cmd = { adapter = "kiro", opts = { enabled = false } }, -- won't work. it's ok.
      agent = { adapter = "kiro" },
    },

    -- NOTE: The log_level is in `opts.opts`
    opts = {
      log_level = "DEBUG", -- or "TRACE"
    },
  },
}
