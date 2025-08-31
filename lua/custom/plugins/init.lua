-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Go helpers: :GoTagAdd, :GoIfErr, :GoImpl etc.
  {
    'olexsmir/gopher.nvim',
    ft = 'go',
    dependencies = { 'nvim-lua/plenary.nvim', 'williamboman/mason.nvim' },
    build = function()
      vim.cmd 'silent! GoInstallDeps'
    end,
    opts = {
      commands = { go = 'go' },
    },
  },

  -- Testing for Go
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-go',
    },
    keys = {
      { '<leader>tn', function() require('neotest').run.run() end, desc = 'Test nearest' },
      { '<leader>tf', function() require('neotest').run.run(vim.fn.expand '%') end, desc = 'Test file' },
      { '<leader>ts', function() require('neotest').summary.toggle() end, desc = 'Test summary' },
      { '<leader>to', function() require('neotest').output.open { enter = true } end, desc = 'Test output' },
    },
    opts = function()
      return {
        adapters = {
          require('neotest-go')({
            experimental = { test_table = true },
            args = { '-count=1', '-timeout=60s' },
          }),
        },
      }
    end,
  },
}
