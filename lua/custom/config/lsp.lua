-- Makefile LSP
local make_ls_path = (vim.env.GOPATH or '') .. '/bin/make-ls'

if vim.fn.filereadable(make_ls_path) ~= 0 then
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'make',
    callback = function()
      vim.lsp.start {
        name = 'make-ls',
        cmd = { make_ls_path },
        root_dir = vim.fs.root(0, { 'Makefile', 'makefile', 'GNUmakefile' }),
      }
    end,
  })
end
