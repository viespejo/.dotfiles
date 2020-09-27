" vim: set sw=2 ts=2 sts=2 foldmethod=marker:

" ============================================================================
" Functions {{{
" ============================================================================

" Toggle options. "{{{
function! ToggleOption(option_name)
  execute 'setlocal' a:option_name.'!'
  execute 'setlocal' a:option_name.'?'
endfunction  "}}}

" DoRemote "{{{
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction  "}}}

" }}}
