return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = true,
  keys = {
    {
      '<leader>gs',
      '<cmd>:Neogit cwd=%:p:h<cr>',
      desc = '[G]it [S]tatus',
    },
  },
}
