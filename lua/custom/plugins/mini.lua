return {
  'echasnovski/mini.files',
  version = '*',
  config = function()
    local mini_files = require('mini.files').setup()
    vim.keymap.set('n', '<leader>e', function()
      MiniFiles.open(vim.api.nvim_buf_get_name(0))
    end, { desc = 'Mini Files [E]xplorer' })
  end,
}
