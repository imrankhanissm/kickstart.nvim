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
            return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
          end,
        },
      }
      vim.keymap.set('n', '<Leader>dtb', function()
        dap.toggle_breakpoint()
      end, { desc = '[D]ebug [T]oggle [B]reakpoint' })
      vim.keymap.set('n', '<Leader>dc', function()
        dap.continue()
      end, { desc = '[D]ebug [C]ontinue' })
      vim.keymap.set('n', '<Leader>dsi', function()
        dap.step_into()
      end, { desc = '[D]ebug step [I]nto' })
      vim.keymap.set('n', '<Leader>dso', function()
        dap.step_out()
      end, { desc = '[D]ebug [S]tep [O]ut' })
      vim.keymap.set('n', '<Leader>dsp', function()
        dap.close()
      end, { desc = '[D]ebug [S]to[P]' })
      vim.keymap.set('n', '<Leader>dtu', function()
        dap.repl.toggle()
      end, { desc = '[D]ebug [T]oggle [U]I' })
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
    end,
  },
}
