return {
  'echasnovski/mini.files',
  version = '*',
  config = function()
    require('mini.files').setup {
      windows = {
        -- Width of focused window
        width_focus = 50,
        -- Width of non-focused window
        width_nofocus = 50,
        -- Width of preview window
        width_preview = 50,
      },
    }
    vim.keymap.set('n', '<leader>e', function()
      MiniFiles.open(vim.api.nvim_buf_get_name(0))
    end, { desc = 'Mini Files [E]xplorer (current file directory)' })
    vim.keymap.set('n', '<leader>E', function()
      MiniFiles.open()
    end, { desc = 'Mini Files [E]xplorer (root directory)' })
  end,
}
