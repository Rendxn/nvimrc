return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({})

    local conf = require('telescope.config').values
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = "Find files" })
    vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = "Find git files" })
    vim.keymap.set('n', '<leader>pws', function()
      local word = vim.fn.expand("<cword>")
      builtin.live_grep({ search = word })
    end, { desc = "Search nearest word in workspace with regex" })
    vim.keymap.set('n', '<leader>pWs', function()
      local word = vim.fn.expand("<cWORD>")
      builtin.live_grep({ search = word })
    end, { desc = "Search selected word in workspace with regex" })
    vim.keymap.set('n', '<leader>ps', function()
      local word = vim.fn.expand("<cword>")
      builtin.live_grep({
        search = word,
        vimgrep_arguments = table.insert(conf.vimgrep_arguments, '--fixed-strings'),
      })
    end, { desc = "Search text in workspace" })
    vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "Search help tags" })
  end
}
