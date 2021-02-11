" vim: set sw=2 ts=2 sts=2 foldmethod=marker:

" default cpo for vim
let s:cpo_save = &cpo
set cpo&vim

let s:TYPE = {
  \'list':    type([])
\}

function! lazy#setCmdMap(cmd, package) abort
  for cmd in s:to_list(a:cmd)
    if cmd =~? '^<Plug>.\+'
      let map = cmd
      if empty(mapcheck(cmd)) && empty(mapcheck(cmd, 'i'))
        " for [mode, map_prefix, key_prefix] in
        "       \ [['i', '<C-O>', ''], ['n', '', ''], ['v', '', 'gv'], ['o', '', '']]
        for [mode, map_prefix, key_prefix] in
              \ [['n', '', '']]
          exec printf(
                \ '%snoremap <silent> %s %s:<C-U>packadd %s<bar>call <SID>do_map("%s", %s, "%s")<CR>',
                \ mode, map, map_prefix, a:package, map, mode != 'i', key_prefix)
        endfor
      endif
    elseif cmd =~# '^[A-Z]'
      let cmd = substitute(cmd, '!*$', '', '')
      if exists(':'.cmd) != 2
        exec printf(
              \ "command! -nargs=* -range -bang -complete=file %s packadd %s | call s:do_cmd('%s',\"<bang>\", <line1>, <line2>, <q-args>)",
              \ cmd, a:package, cmd)
      endif
    else
      call s:err('Invalid command: '.cmd.
            \ '. Should start with an uppercase letter or `<Plug>`.')
    endif
  endfor
endfunction

function! s:to_list(v)
  return type(a:v) == s:TYPE.list ? a:v : [a:v]
endfunction

function! s:do_cmd(cmd, bang, start, end, args)
  exec printf('%s%s%s %s', (a:start == a:end ? '' : (a:start.','.a:end)), a:cmd, a:bang, a:args)
endfunction

function! s:do_map(map, with_prefix, prefix)
  let extra = ''
  while 1
    let c = getchar(0)
    if c == 0
      break
    endif
    let l:extra .= nr2char(c)
  endwhile

  if a:with_prefix
    let prefix = v:count ? v:count : ''
    let prefix .= '"'.v:register.a:prefix
    if mode(1) == 'no'
      if v:operator == 'c'
        let prefix = "\<esc>" . prefix
      endif
      let prefix .= v:operator
    endif
    call feedkeys(prefix, 'n')
  endif
  call feedkeys(substitute(a:map, '^<Plug>', "\<Plug>", '') . extra)
endfunction

" set initial cpo value again
let &cpo = s:cpo_save
unlet s:cpo_save
