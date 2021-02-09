" vim: set sw=2 ts=2 sts=2 foldmethod=marker:

if !exists('g:loaded_vem_tabline')
  finish
endif


nmap <c-n> <Plug>vem_move_buffer_left-
nmap <c-h> <Plug>vem_prev_buffer-
nmap <c-p> <Plug>vem_move_buffer_right-
nmap <c-l> <Plug>vem_next_buffer-
