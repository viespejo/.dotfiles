" vim: set sw=2 ts=2 sts=2 foldmethod=marker:

if !exists('g:loaded_fzf_vim')
  finish
endif

" fzf-marks
" command! -bang Fzm call fzf#run(fzf#wrap({'source': "cat ~/.fzf-marks | awk '{ print $3 }'", 'sink': 'lcd'}, <bang>0))

" fzf-neomru
function! s:_recent_files(project)
  let l:candidates =  filter([expand('%')], 'len(v:val)')
    \   + filter(map(fzf#vim#_buflisted_sorted(), 'bufname(v:val)'), 'len(v:val)')
    \   + filter(neomru#_gather_file_candidates(), "filereadable(fnamemodify(v:val, ':p'))")
  if a:project
    let l:candidates = filter(l:candidates, 'v:val =~# getcwd()')
  endif
  return fzf#vim#_uniq(map(
    \ l:candidates,
    \ 'fnamemodify(v:val, ":~:.")'))
endfunction

functio! s:_show_header_lines(project)
  if a:project
    return expand('%:p') =~# getcwd()
  endif
  return !empty(expand('%'))
endfunction

command! -bang -narg=1 Fzo call fzf#run(fzf#wrap({
  \ 'source': s:_recent_files(<args>),
  \ 'options' : extend(
    \ fzf#vim#with_preview('right', 'ctrl-/')['options'],
    \ ['-m', '--header-lines', s:_show_header_lines(<args>), '--prompt', 'Buffers+MRUFiles> '])
  \ }, <bang>0))

command! -bang Fzd call fzf#run(fzf#wrap({
  \ 'source': map(neomru#_gather_directory_candidates(),'fnamemodify(v:val, ":~:.")'),
  \ 'sink': 'lcd',
  \ 'options': ['--prompt', 'MRUDir> ']
  \ }, <bang>0))

" delete buffers command 
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept --prompt "DelBuf> "'
\ }))

" mappings
nnoremap <silent> [Space]<space> :Buffers<cr>
nnoremap <silent> [Space]b :BD<cr>
nnoremap <silent> [Space]t :Filetypes<cr>
nnoremap <silent> [Space]p :GFiles<cr>
nnoremap <silent> [Space]P :Files<cr>
" nnoremap <silent> [Space]o :History<cr>
nnoremap <silent> [Space]o :Fzo 0<cr>
nnoremap <silent> [Space]O :Fzo 1<cr>
nnoremap <silent> [Space]d :Fzd<cr>
" nnoremap <silent> [Space]d :Fzm<cr>
nnoremap <silent> [Space]: :History:<cr>
nnoremap <silent> [Space]/ :History/<cr>
nnoremap <silent> [Space]h :Helptags<cr>
nnoremap <silent> [Space]l :BLines<cr>
nnoremap <silent> [Space]m :Marks<cr>
nnoremap <silent> [Space]<tab> :call fzf#vim#maps("")<cr>
nnoremap <silent> <leader><tab>n :call fzf#vim#maps("n")<cr>
nnoremap <silent> <leader><tab>x :call fzf#vim#maps("x")<cr>
nnoremap <silent> <leader><tab>i :call fzf#vim#maps("i")<cr>
nnoremap <silent> <leader><tab>o :call fzf#vim#maps("o")<cr>
nnoremap <silent> [Space]c :Commands<cr>
nnoremap <silent> [Space]g :Rg <c-r><c-w><cr>
nnoremap <silent> [Space]G :Rg<cr>
nnoremap <silent> [Space]s :Snippets<cr>

  " `:Files [PATH]`    | Files (runs  `$FZF_DEFAULT_COMMAND`  if defined)
  " `:GFiles [OPTS]`   | Git files ( `git ls-files` )
  " `:GFiles?`         | Git files ( `git status` )
  " `:Buffers`         | Open buffers
  " `:Colors`          | Color schemes
  " `:Ag [PATTERN]`    | {ag}{7} search result ( `ALT-A`  to select all,  `ALT-D`  to deselect all)
  " `:Rg [PATTERN]`    | {rg}{8} search result ( `ALT-A`  to select all,  `ALT-D`  to deselect all)
  " `:Lines [QUERY]`   | Lines in loaded buffers
  " `:BLines [QUERY]`  | Lines in the current buffer
  " `:Tags [QUERY]`    | Tags in the project ( `ctags -R` )
  " `:BTags [QUERY]`   | Tags in the current buffer
  " `:Marks`           | Marks
  " `:Windows`         | Windows
  " `:Locate PATTERN`  |  `locate`  command output
  " `:History`         |  `v:oldfiles`  and open buffers
  " `:History:`        | Command history
  " `:History/`        | Search history
  " `:Snippets`        | Snippets ({UltiSnips}{9})
  " `:Commits`         | Git commits (requires {fugitive.vim}{10})
  " `:BCommits`        | Git commits for the current buffer
  " `:Commands`        | Commands
  " `:Maps`            | Normal mode mappings
  " `:Helptags`        | Help tags [1]
  " `:Filetypes`       | File types
