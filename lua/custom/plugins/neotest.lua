return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-python',
  },
  config = function()
    require('neotest').setup {
      adpaters = {
        require 'neotest-python' {
          dap = {
            justMycode = false,
            console = 'integratedTerminal',
          },
          args = { '--log-level', 'DEBUG' },
          runner = 'pytest',
        },
      },
    }
  end,
}
