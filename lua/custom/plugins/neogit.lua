return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    {
      'sindrets/diffview.nvim', -- optional - Diff integration
      config = function()
        vim.keymap.set('n', '<leader>dvo', '<cmd>DiffviewOpen<CR>', { desc = '[D]iff[V]iew [O]pen' })
        vim.keymap.set('n', '<leader>dvc', '<cmd>DiffviewClose<CR>', { desc = '[D]iff[V]iew [C]lose' })
      end,
    },

    -- Only one of these is needed.
    'nvim-telescope/telescope.nvim', -- optional
  },
  config = function()
    vim.keymap.set('n', '<leader>ng', '<cmd>Neogit<CR>', { desc = '[N]eo[G]it' })
  end,
}
