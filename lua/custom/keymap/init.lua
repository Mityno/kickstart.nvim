local enable_keymaps = function(plugin_name)
  local basepath = 'custom.keymap'
  require(basepath .. '.' .. plugin_name)
end

enable_keymaps 'quickfix'

vim.keymap.set('n', '<leader>cd', '<cmd>:cd %:p:h<cr>', { desc = "[cd] to this file's directory" })
