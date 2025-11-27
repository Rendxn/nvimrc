return {
  {
    "nvim-neotest/neotest",
    -- pinning to this commit because I'm getting
    -- tests not found with newer versions
    -- see: https://github.com/nvim-neotest/neotest/issues/531
    commit = "52fca67",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "marilari88/neotest-vitest",
      "nvim-neotest/neotest-jest",
      "fredrikaverpil/neotest-golang",
    },
    config = function()
      local neotest = require("neotest")

      neotest.setup({
        adapters = {
          require("neotest-vitest"),
          require("neotest-jest"),
          require("neotest-golang"),
        },
      })

      vim.keymap.set("n", "<leader>tt", function()
        neotest.run.run()
      end, { desc = "Run nearest tests" })

      vim.keymap.set("n", "<leader>tf", function()
        neotest.run.run(vim.fn.expand("%"))
      end, { desc = "Run tests in current file" })

      vim.keymap.set("n", "<leader>tc", function()
        neotest.summary.toggle()
      end, { desc = "Toggle test summary window" })

      vim.keymap.set("n", "<leader>td", function()
        neotest.run.run({ strategy = "dap" })
      end, { desc = "Debug nearest test" })
    end,
  },
}
