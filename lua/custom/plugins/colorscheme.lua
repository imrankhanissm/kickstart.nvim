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

-- return {
--   'arcticicestudio/nord-vim',
--   lazy = false, -- Load immediately
--   priority = 1000, -- Ensure it loads before other plugins
--   config = function()
--     vim.g.nord_disable_background = true
--     vim.cmd 'colorscheme nord'
--   end,
-- }

-- return {
--   'shaunsingh/nord.nvim',
--   config = function()
--     vim.g.nord_disable_background = true
--     vim.cmd 'colorscheme nord'
--   end,
-- }
