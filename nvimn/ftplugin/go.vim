" Only do this when not done yet for this buffer
if exists("b:did_vec_ftplugin")
  finish
endif
let b:did_vec_ftplugin = 1
function! s:check_dap() abort
  if !exists('g:loaded_dap')
    echomsg('DAP not loaded. Please, load DAP ('. g:mapleader .'dd) and try again.')
    return
  endif
  lua require('vec.dap-go').debug_test()
endfunction
nnoremap <buffer> <unique> <silent> <leader>dt :call <SID>check_dap()<cr>
