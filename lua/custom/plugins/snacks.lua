return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = false },
    dashboard = { enabled = false },
    indent = { enabled = false },
    input = { enabled = false },
    quickfile = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },

    notifier = {
      timeout = 2000,

      width = { min = 50, max = 0.5 },
      margin = { top = 1, right = 1, bottom = 0 },

      style = 'fancy',
    },
    ---@type table<string, snacks.win.Config>
    styles = {
      notifier = {
        render = 'fancy',
        border = 'rounded',
      },
    },
  },
  keys = {
    {
      '<leader>nh',
      function()
        require('snacks').notifier.show_history()
      end,
      desc = '[N]otification [H]istory',
    },
  },
  config = function()
    vim.notify = Snacks.notifier.notify
  end,
}
