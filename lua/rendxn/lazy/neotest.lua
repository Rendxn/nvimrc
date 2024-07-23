return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "marilari88/neotest-vitest",
      "nvim-neotest/neotest-jest",
      {
        "fredrikaverpil/neotest-golang",
        branch = "windows",
      },
    },
    config = function()
      local neotest = require("neotest")

      neotest.setup({
        adapters = {
          require("neotest-vitest"),
          require("neotest-jest"),
          require("neotest-golang")({ runner = "gotestsum" }),
        }
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

      --   vim.keymap.set("n", "<leader>td", function()
      --     neotest.run.run({ strategy = "dap" })
      --   end, { desc = "Debug nearest test" })
    end,
  },
}
