return {}
--[[ return {
  'ray-x/lsp_signature.nvim',
  event = 'InsertEnter',
  opts = {
    bind = true,
    doc_lines = 10,
    max_height = 20,
    max_width = 120,
    handler_opts = {
      border = 'rounded',
    },
  },
  config = function(_, opts)
    require('lsp_signature').setup(opts)
  end,
}
]]
