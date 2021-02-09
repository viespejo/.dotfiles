" vim: set sw=2 ts=2 sts=2 foldmethod=marker:

if !exists('g:loaded_nvim_treesitter')
  finish
endif

" show syntax group stack
function! s:syn_stack ()
  if exists("b:current_syntax")
    for i1 in synstack(line("."), col("."))
      let i2 = synIDtrans(i1)
      let n1 = synIDattr(i1, "name")
      let n2 = synIDattr(i2, "name")
      echo n1 "->" n2
    endfor
  else " only if treesitter highlight is active
    execute "TSHighlightCapturesUnderCursor"
  endif
endfunction

nnoremap <silent> <leader>Tp :TSPlaygroundToggle<cr>
nnoremap <silent> <leader>Th :call <SID>syn_stack()<cr>
