return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    {
      'sindrets/diffview.nvim', -- optional - Diff integration
      config = function()
        vim.keymap.set('n', '<leader>dv', function()
          local function is_diffview_tab()
            for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
              local buf = vim.api.nvim_win_get_buf(win)
              local ft = vim.api.nvim_get_option_value('filetype', { buf = buf })
              if ft == 'DiffviewFiles' or ft == 'DiffviewView' then
                return true
              end
            end
            return false
          end

          if is_diffview_tab() then
            print 'dv open'
            vim.cmd 'DiffviewClose'
          else
            print 'dv close'
            vim.cmd 'DiffviewOpen'
          end
        end, { desc = '[D]iff[V]iew' })
      end,
    },

    -- Only one of these is needed.
    'nvim-telescope/telescope.nvim', -- optional
  },
  config = function()
    local neogit = require 'neogit'
    neogit.setup {
      disable_hint = true,
      disable_line_numbers = false,
      commit_editor = {
        show_staged_diff = false,
      },
    }
    vim.keymap.set('n', '<leader>ng', '<cmd>Neogit<CR>', { desc = '[N]eo[G]it' })
  end,
}
