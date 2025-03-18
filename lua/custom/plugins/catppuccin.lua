return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  opts = {
    transparent_background = true,
  },
  config = function()
    require('catppuccin').setup {
      transparent_background = true,
      integrations = {
        nvimtree = {
          enabled = true,
          show_root = true,
          transparent_panel = true,
        },
      },
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
