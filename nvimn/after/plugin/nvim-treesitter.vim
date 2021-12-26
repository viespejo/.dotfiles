" vim: set sw=2 ts=2 sts=2 foldmethod=marker:

if !exists('g:loaded_nvim_treesitter')
  finish
endif

nnoremap <silent> <leader>Tp :TSPlaygroundToggle<cr>
nnoremap <silent> <leader>Th :TSHighlightCapturesUnderCursor<cr>
