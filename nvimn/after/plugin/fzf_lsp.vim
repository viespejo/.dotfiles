" vim: set sw=2 ts=2 sts=2 foldmethod=marker:

if !exists('g:loaded_fzf_lsp') || !exists('g:loaded_fzf_vim')
  finish
endif

" mappings
nnoremap <silent> <leader>c<space>d :Definitions<cr>
nnoremap <silent> <leader>c<space>D :Declarations<cr>
nnoremap <silent> <leader>c<space>r :References<cr>
nnoremap <silent> <leader>c<space>e :Diagnostics<cr>
nnoremap <silent> <leader>c<space>s :DocumentSymbols<cr>
