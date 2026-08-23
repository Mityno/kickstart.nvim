-- Quickfix list mappings
local toggle_qf = function()
  local tabnr = vim.fn.tabpagenr()
  local w = vim.tbl_filter(function(t)
    return t.tabnr == tabnr and t.quickfix == 1 and t.loclist == 0
  end, vim.fn.getwininfo())[1]
  local win_id = w and w.winid or 0

  if win_id ~= 0 then
    vim.cmd 'cclose'
  else
    vim.cmd 'copen'
  end
end

local win_is_qf = function()
  return vim.fn.getwininfo(vim.fn.win_getid())[1]['quickfix']
end

local delete_qf_entry = function()
  if not win_is_qf() then
    vim.cmd 'dd'
    return
  end
  local qf_list = vim.fn.getqflist()
  local current_line_number = vim.fn.line '.'
  table.remove(qf_list, current_line_number)
  vim.fn.setqflist(qf_list, 'r')
  vim.fn.cursor(current_line_number, 1)
end

vim.keymap.set('n', '<leader>q', toggle_qf, { desc = 'Toogle Quickfix list' })
vim.keymap.set('n', '<M-j>', '<cmd>cnext<cr>', { desc = 'Down (Quickfix list)' })
vim.keymap.set('n', '<M-k>', '<cmd>cprev<cr>', { desc = 'Up (Quickfix list)' })
-- vim.keymap.set('n', 'dd', delete_qf_entry, { buffer = true, silent = true, desc = 'Delete entry (Quickfix list)' })
