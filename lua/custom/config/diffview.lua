local actions = require 'diffview.actions'

require('diffview').setup {
  keymaps = {
    view = {
      -- The `view` bindings are active in the diff buffers, only when the current
      -- tabpage is a Diffview.
      { 'n', '<M-k>', actions.prev_conflict, { desc = 'In the merge-tool: jump to the previous conflict' } },
      { 'n', '<M-j>', actions.next_conflict, { desc = 'In the merge-tool: jump to the next conflict' } },
    },
    file_panel = {
      { 'n', '<M-k>', actions.prev_conflict, { desc = 'Go to the previous conflict' } },
      { 'n', '<M-j>', actions.next_conflict, { desc = 'Go to the next conflict' } },
    },
  },
}
