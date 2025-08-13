return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    signs_staged = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
    },
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map("n", "]h", function()
        gitsigns.nav_hunk("next")
      end, { desc = "Go to next hunk" })

      map("n", "[h", function()
        gitsigns.nav_hunk("prev")
      end, { desc = "Go to previous hunk" })

      -- Actions
      map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage hunk" })
      map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset hunk" })

      map("v", "<leader>hs", function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Stage hunk (visual selection)" })

      map("v", "<leader>hr", function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Reset hunk (visual selection)" })

      map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage buffer" })
      map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset buffer" })
      map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview hunk" })
      map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Preview hunk (inline)" })

      map("n", "<leader>hb", function()
        gitsigns.blame_line({ full = true })
      end, { desc = "Blame line" })

      map("n", "<leader>hd", gitsigns.diffthis)

      map("n", "<leader>hD", function()
        gitsigns.diffthis("~")
      end, { desc = "Diff buffer" })

      map("n", "<leader>hQ", function()
        gitsigns.setqflist("all")
      end, { desc = "Show hunks in quickfix list (project)" })
      map("n", "<leader>hq", gitsigns.setqflist, { desc = "Show hunks in quickfix list (buffer)" })

      -- Toggles
      map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle line blame" })
      map("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "Toggle word diff" })

      -- Text object
      map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Select hunk" })
    end,
  },
}
