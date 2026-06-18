return {
  'NeogitOrg/neogit',
  commit = '792c139da736230855e8341ebe6175bb6eb8268b',
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
