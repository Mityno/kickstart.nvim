local M = { 'neoclide/coc.nvim', branch = 'release' }

function M.config()
  -- https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.lua

  -- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
  -- delays and poor user experience
  vim.opt.updatetime = 300

  -- Always show the signcolumn, otherwise it would shift the text each time
  -- diagnostics appeared/became resolved
  vim.opt.signcolumn = 'yes'

  local keyset = vim.keymap.set
  -- Autocomplete
  function _G.check_back_space()
    local col = vim.fn.col '.' - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
  end

  -- Use `[g` and `]g` to navigate diagnostics
  -- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
  keyset('n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true })
  keyset('n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true })

  -- GoTo code navigation
  keyset('n', 'gd', '<Plug>(coc-definition)', { desc = '[G]oto [D]efinition', silent = true })
  keyset('n', 'gy', '<Plug>(coc-type-definition)', { desc = '[G]oto T[y]pe Definition', silent = true })
  keyset('n', 'gi', '<Plug>(coc-implementation)', { desc = '[G]oto [I]mplementation', silent = true })
  keyset('n', 'gr', '<Plug>(coc-references)', { desc = '[G]oto [R]eferences', silent = true })

  -- Use K to show documentation in preview window
  function _G.show_docs()
    local cw = vim.fn.expand '<cword>'
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
      vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval 'coc#rpc#ready()' then
      vim.fn.CocActionAsync 'doHover'
    else
      vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
  end
  keyset('n', 'K', '<CMD>lua _G.show_docs()<CR>', { desc = 'Show hover docs', silent = true })

  -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
  vim.api.nvim_create_augroup('CocGroup', {})
  vim.api.nvim_create_autocmd('CursorHold', {
    group = 'CocGroup',
    command = "silent call CocActionAsync('highlight')",
    desc = 'Highlight symbol under cursor on CursorHold',
  })

  -- Symbol renaming
  keyset('n', '<leader>rn', '<Plug>(coc-rename)', { desc = '[R]e[n]ame', silent = true })

  -- Setup formatexpr specified filetype(s)
  vim.api.nvim_create_autocmd('FileType', {
    group = 'CocGroup',
    pattern = 'typescript,json',
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = 'Setup formatexpr specified filetype(s).',
  })

  -- Update signature help on jump placeholder
  vim.api.nvim_create_autocmd('User', {
    group = 'CocGroup',
    pattern = 'CocJumpPlaceholder',
    command = "call CocActionAsync('showSignatureHelp')",
    desc = 'Update signature help on jump placeholder',
  })

  -- -- Apply codeAction to the selected region
  -- -- Example: `<leader>aap` for current paragraph
  -- local opts = { silent = true, nowait = true }
  -- keyset('x', '<leader>a', '<Plug>(coc-codeaction-selected)', opts)
  -- keyset('n', '<leader>a', '<Plug>(coc-codeaction-selected)', opts)

  -- -- Remap keys for apply code actions at the cursor position.
  -- keyset('n', '<leader>ac', '<Plug>(coc-codeaction-cursor)', opts)
  -- -- Remap keys for apply source code actions for current file.
  -- keyset('n', '<leader>as', '<Plug>(coc-codeaction-source)', opts)
  -- -- Apply the most preferred quickfix action on the current line.
  -- keyset('n', '<leader>qf', '<Plug>(coc-fix-current)', opts)

  -- Remap keys for apply refactor code actions.
  keyset('n', '<leader>re', '<Plug>(coc-codeaction-refactor)', { desc = '[Re]factor', silent = true })
  keyset('x', '<leader>r', '<Plug>(coc-codeaction-refactor-selected)', { desc = '[R]efactor selected', silent = true })
  keyset('n', '<leader>r', '<Plug>(coc-codeaction-refactor-selected)', { silent = true })

  -- -- Run the Code Lens actions on the current line
  -- keyset('n', '<leader>cl', '<Plug>(coc-codelens-action)', opts)

  -- -- Map function and class text objects
  -- -- NOTE: Requires 'textDocument.documentSymbol' support from the language server
  -- keyset('x', 'if', '<Plug>(coc-funcobj-i)', opts)
  -- keyset('o', 'if', '<Plug>(coc-funcobj-i)', opts)
  -- keyset('x', 'af', '<Plug>(coc-funcobj-a)', opts)
  -- keyset('o', 'af', '<Plug>(coc-funcobj-a)', opts)
  -- keyset('x', 'ic', '<Plug>(coc-classobj-i)', opts)
  -- keyset('o', 'ic', '<Plug>(coc-classobj-i)', opts)
  -- keyset('x', 'ac', '<Plug>(coc-classobj-a)', opts)
  -- keyset('o', 'ac', '<Plug>(coc-classobj-a)', opts)

  -- Remap <C-f> and <C-b> to scroll float windows/popups
  ---@diagnostic disable-next-line: redefined-local
  local opts = { silent = true, nowait = true, expr = true }
  keyset('n', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
  keyset('n', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
  keyset('i', '<C-f>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
  keyset('i', '<C-b>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
  keyset('v', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
  keyset('v', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

  -- Add `:Format` command to format current buffer
  vim.api.nvim_create_user_command('Format', "call CocAction('format')", {})

  -- " Add `:Fold` command to fold current buffer
  vim.api.nvim_create_user_command('Fold', "call CocAction('fold', <f-args>)", { nargs = '?' })

  -- Add `:OR` command for organize imports of the current buffer
  vim.api.nvim_create_user_command('OR', "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

  -- Add (Neo)Vim's native statusline support
  -- NOTE: Please see `:h coc-status` for integrations with external plugins that
  -- provide custom statusline: lightline.vim, vim-airline
  vim.opt.statusline:prepend "%{coc#status()}%{get(b:,'coc_current_function','')}"

  -- Mappings for CoCList
  -- code actions and coc stuff
  -- opts = { silent = true, nowait = true }
  function keyset(mode, key, action, desc)
    vim.keymap.set(mode, key, action, { desc = desc, silent = true, nowait = true })
  end
  -- Show all diagnostics
  keyset('n', '<leader>q', ':<C-u>CocList diagnostics<cr>', 'Open Diagnostics List')
  -- Manage extensions
  keyset('n', '<leader>e', ':<C-u>CocList extensions<cr>', "Open [E]xtesion List")
  -- Find symbol of current document
  keyset('n', '<leader>o', ':<C-u>CocList outline<cr>', 'Open Document Symbols')
  -- Search workspace symbols
  keyset('n', '<leader>s', ':<C-u>CocList -I symbols<cr>', 'Open Workspace Symbols')
  -- Do default action for next item
  -- keyset('n', '<leader>j', ':<C-u>CocNext<cr>', opts)
  -- Do default action for previous item
  -- keyset('n', '<leader>k', ':<C-u>CocPrev<cr>', opts)
end

return M
