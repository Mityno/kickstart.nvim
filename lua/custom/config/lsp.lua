-- Makefile LSP
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'make',
  callback = function()
    vim.lsp.start {
      name = 'make-ls',
      cmd = { vim.env.GOPATH .. '/bin/make-ls' },
      root_dir = vim.fs.root(0, { 'Makefile', 'makefile', 'GNUmakefile' }),
    }
  end,
})
