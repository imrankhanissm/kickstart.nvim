return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require 'dap'
      dap.adapters.coreclr = {
        type = 'executable',
        command = '/usr/local/bin/netcoredbg',
        args = { '--interpreter=vscode', '--log=stdout' },
      }
      dap.configurations.cs = {
        {
          type = 'coreclr',
          name = 'launch - netcoredbg',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to dll', vim.fn.getcwd(), 'file')
          end,
        },
        {
          type = 'coreclr',
          name = 'Attach to Process',
          request = 'attach',
          processId = require('dap.utils').pick_process,
        },
      }
      vim.keymap.set('n', '<Leader>db', function()
        dap.toggle_breakpoint()
      end, { desc = '[D]ebug toggle [B]reakpoint' })
      vim.keymap.set('n', '<Leader>dc', function()
        dap.continue()
      end, { desc = '[D]ebug [C]ontinue' })
      vim.keymap.set('n', '<Leader>di', function()
        dap.step_into()
      end, { desc = '[D]ebug step [I]nto' })
      vim.keymap.set('n', '<Leader>do', function()
        dap.step_out()
      end, { desc = '[D]ebug step [O]ut' })
      vim.keymap.set('n', '<Leader>ds', function()
        dap.close()
      end, { desc = '[D]ebug [S]top' })
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      local dap, dapui = require 'dap', require 'dapui'
      dapui.setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      vim.keymap.set('n', '<Leader>du', function()
        dapui.toggle()
      end, { desc = '[D]ebug toggle [U]I' })
    end,
  },
}
