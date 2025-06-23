require('lualine').setup {
  options = { theme = 'everforest' },
  sections = {
    lualine_b = { 'branch', 'diff', 'diagnostics', 'lsp_status' },
    lualine_c = { { 'filename', path = 1 }, 'filesize' },
  },
}
