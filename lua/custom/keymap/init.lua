local enable_keymaps = function(plugin_name)
  local basepath = 'custom.keymap'
  require(basepath .. '.' .. plugin_name)
end

vim.keymap.set('n', '<leader>cd', '<cmd>:cd %:p:h<cr>', { desc = "[cd] to this file's directory" })
