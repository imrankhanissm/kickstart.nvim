return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    -- Only one of these is needed.
    'nvim-telescope/telescope.nvim', -- optional
  },
  config = function()
    vim.keymap.set('n', '<leader>ng', '<cmd>Neogit<CR>', { desc = '[N]eo[G]it' })
  end,
}
