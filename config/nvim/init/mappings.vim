" vim: set sw=2 ts=2 sts=2 foldmethod=marker:

" ============================================================================
" MAPPINGS {{{
" ============================================================================
" <Leader>e: Fast editing of the .vimrc
nnoremap <Leader>e :e! ~/.config/nvim/init.vim<cr>
" Terminal emulator and windows  navigation
tnoremap <Leader><Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Pre/Next Buffers
nnoremap <silent> <C-H> :bp<CR>
nnoremap <silent> <C-l> :bn<CR>
nnoremap <silent> <Leader>3 :b#<CR>

" Location list
nnoremap <silent> <Leader>lo :lop<CR>
nnoremap <silent> <Leader>lc :lcl<CR>

" Quickfix list
nnoremap <silent> <Leader>co :cope<CR>
nnoremap <silent> <Leader>cc :ccl<CR>

" Coc list
nnoremap <silent> <Leader>cc :CocConfig<CR>
nnoremap <silent> <Leader>cl :CocList<CR>

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk
" End pair
inoremap <C-l> <ESC>A
" ---------------------------------------------------------------------------
" Omnifunction
" ----------------------------------------------------------------------------
inoremap <C-\> <C-X><C-O>

" ----------------------------------------------------------------------------
" Moving lines
" ----------------------------------------------------------------------------
nnoremap <silent> <C-k> :move-2<cr>
nnoremap <silent> <C-j> :move+<cr>
xnoremap <silent> <C-k> :move-2<cr>gv
xnoremap <silent> <C-j> :move'>+<cr>gv

" Stupid shift key fixes
if has("user_commands")
	 command! -bang -nargs=* -complete=file E e<bang> <args>
	 command! -bang -nargs=* -complete=file W w<bang> <args>
	 command! -bang -nargs=* -complete=file Wq wq<bang> <args>
	 command! -bang -nargs=* -complete=file WQ wq<bang> <args>
	 command! -bang Wa wa<bang>
	 command! -bang WA wa<bang>
	 command! -bang Q q<bang>
	 command! -bang QA qa<bang>
	 command! -bang Qa qa<bang>
endif

cmap Tabe tabe

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Quickly select text you just pasted:
nnoremap gV `[v`]

" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" Most prefer to toggle search highlighting rather than clear the current search results.
nmap <silent> <leader>/ :set invhlsearch<CR>

" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
map <leader>e. :Ex<CR>

" Adjust viewports to the same size
map <Leader>2 <C-w>=
" Maximize viewports to the same size
map <Leader>1 <C-w>_

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Easier horizontal scrolling
map zl zL
map zh zH

" Wipe buffer 
nnoremap <silent> Q :bd<CR>

" ----------------------------------------------------------------------------
" fzf
" ----------------------------------------------------------------------------
nmap <silent> <c-p> :GitFiles<CR>
nmap <silent> <leader>p :Files<CR>
nnoremap <c-f> :Ag! <C-R><C-W><CR>
nnoremap <A-f> :Far <C-R><C-W> 
nnoremap <leader>ag :Ag! 
nnoremap <leader>rg :Rg! 
nmap <leader><tab> <plug>(fzf-maps-n)
nmap <leader>s :CocList snippets<CR>
imap <c-x><c-f> <plug>(fzf-complete-path)

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Rg
  \ call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case
  \ --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
" ----------------------------------------------------------------------------
" Easy Align
" ----------------------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ----------------------------------------------------------------------------
" Smart space mapping.
" ----------------------------------------------------------------------------
nmap  <Space>   [Space]
nnoremap  [Space]   <Nop>

" Toggle Wrap
nnoremap [Space]w
      \ :<C-u>call ToggleOption('wrap')<CR>

" ----------------------------------------------------------------------------
" Denite mapping
" ----------------------------------------------------------------------------

" General fuzzy search
nnoremap <silent> [Space]<space> :<C-u>Denite buffer<CR>
nnoremap <silent> [Space]a :<C-u>Denite file_mru<CR>
nnoremap <silent> [Space]s :<C-u>Denite file_mru_project<CR>
nnoremap <silent> [Space]p :<C-u>Denite
\ `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<CR>

" Quick registers
nnoremap <silent> [Space]r :<C-u>Denite register<CR>

" ChangeFiletype
nnoremap <silent> [Space]t :<C-u>Denite filetype<CR>
" Marks
nnoremap <silent> [Space]m :<C-u>Denite mark<CR>
" Quick yank history
nnoremap <silent> [Space]y :<C-u>Denite neoyank<CR>

" Quick outline
nnoremap <silent> [Space]o :<C-u>Denite outline<CR>

" Quickly switch lcd
nnoremap <silent> [Space]d
      \ :<C-u>Denite -default-action=cd directory_mru<CR>

" Quick grep
nnoremap <silent> [Space]g :<C-u>Denite grep:.<CR>
nnoremap <silent> [Space]j :<C-u>DeniteCursorWord grep:.<CR>

" Quick help
nnoremap <silent> [Space]h :<C-u>Denite help<CR>

" Quick line
nnoremap <silent> [Space]l :<C-u>Denite line<CR>

" Quick commands
nnoremap <silent> [Space]c :<C-u>Denite command_history<CR>

" ----------------------------------------------------------------------------
" undotree
" ----------------------------------------------------------------------------
nnoremap <Leader>u :UndotreeToggle<CR>

" ----------------------------------------------------------------------------
" Fugitive
" ----------------------------------------------------------------------------
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>:GitGutter<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>gg :GitGutterToggle<CR>

" ----------------------------------------------------------------------------
" Merginal
" ----------------------------------------------------------------------------
nmap <silent> <leader>m :MerginalToggle<CR>
" ----------------------------------------------------------------------------
" Tagbar
" ----------------------------------------------------------------------------
nnoremap <silent> <leader>tt :TagbarToggle<CR>

" ----------------------------------------------------------------------------
" Expand Region
" ----------------------------------------------------------------------------
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" ----------------------------------------------------------------------------
" Copy & paste to system clipboard with <Space>p and <Space>y:
" ----------------------------------------------------------------------------
vmap <Leader><Leader>y "+y
vmap <Leader><Leader>d "+d
nmap <Leader><Leader>p "+p
nmap <Leader><Leader>P "+P
vmap <Leader><Leader>p "+p
vmap <Leader><Leader>P "+P

" ----------------------------------------------------------------------------
" Vim Go
" ----------------------------------------------------------------------------
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>s <Plug>(go-implements)

au FileType go nmap <Leader>i <Plug>(go-info)
" }}}
