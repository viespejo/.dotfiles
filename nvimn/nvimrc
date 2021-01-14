" vim: set sw=2 ts=2 sts=2 foldmethod=marker:

" ENVIROMENT VARIABLES {{{

let $XDG_CONFIG_HOME = $HOME.'/.config/nvimn-config'
let $XDG_DATA_HOME = $HOME.'/.local/share/nvimn-data'

" }}}

" VIM VARIABLES {{{

let mapleader = ","

" }}}

" OPTIONS {{{

" runtimepath
set runtimepath=/usr/share/vim/vimfiles "archlinux
set runtimepath+=$XDG_CONFIG_HOME/nvim,$XDG_DATA_HOME/nvim/site,$VIMRUNTIME,$XDG_DATA_HOME/nvim/site/after,$XDG_CONFIG_HOME/nvim/after
" packpath
let &packpath = &runtimepath
" options for insert mode completion 
set completeopt=menuone,preview,noinsert,noselect
" list of directories which will be searched when using the |gf|, [f, ]f, ^Wf, |:find|, |:sfind|, |:tabfind| and other commands
set path=.,**
" splitting window -> bellow and right
set splitbelow splitright
" d, y, p, P using CLIPBOARD ["+] [unnamedplus]
set clipboard=unnamedplus
" strings to use in list mode
set listchars=tab:→.,trail:·,eol:¬,extends:…,precedes:…
" tab and indent
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab " use space in indents
set breakindent
set showbreak=↳\ 
"set linebreak

"}}}

" MAPPINGS {{{

" edit and source nvim config file
nnoremap <leader>ev :edit $XDG_CONFIG_HOME/nvim/init.vim<cr>
nnoremap <leader>sv :source $XDG_CONFIG_HOME/nvim/init.vim<cr>
" delete buffer 
nnoremap <silent> Q :bd<cr>
" operates on a function name in the current line
onoremap <silent> <leader>f :<c-u>normal! 0f(hviw<cr>
" moving lines
nnoremap <silent> <c-k> :move-2<cr>
nnoremap <silent> <c-j> :move+<cr>
xnoremap <silent> <c-k> :move-2<cr>gv
xnoremap <silent> <c-j> :move'>+<cr>gv
" terminal emulator and windows  navigation
tnoremap <leader><esc> <c-\><c-n>
tnoremap <silent> <leader>w <c-\><c-n><c-w>
nnoremap <silent> <leader>w <c-w>
" pre/next Buffers
nnoremap <silent> <a-h> :bp<cr>
nnoremap <silent> <a-l> :bn<cr>
nnoremap <silent> <leader>3 :b#<cr>
" turn highlighted matches off but it does not change hlsearch option
nnoremap <silent> <leader>/ :nohlsearch<CR>

"}}}

" FUNCTIONS {{{

function! ToggleOption(option_name) abort
	execute 'setlocal' a:option_name.'!'
	execute 'setlocal' a:option_name.'?'
endfunction

" PLUGINS {{{
" }}}

