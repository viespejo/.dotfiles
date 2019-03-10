"" vim: set sw=2 ts=2 sts=2 foldmethod=marker:

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

" ============================================================================
" VIM-PLUG BLOCK {{{
" ============================================================================

let $GIT_SSL_NO_VERIFY = 'true'

" install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

silent! if plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" ----------------------------------------------------------------------------
" Fuzzy search
" " ----------------------------------------------------------------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/denite.nvim', { 'do': function('DoRemote') }
Plug 'chemzqm/denite-extra'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neoyank.vim'

" ----------------------------------------------------------------------------
" Edit
" ----------------------------------------------------------------------------
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle'   }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'terryma/vim-expand-region'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
" ----------------------------------------------------------------------------
" Color
" ----------------------------------------------------------------------------
Plug 'AlessandroYorba/Despacio'
Plug 'joshdick/onedark.vim'
" ----------------------------------------------------------------------------
" Status Line
" ----------------------------------------------------------------------------
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" Started Page
Plug 'mhinz/vim-startify'

" ----------------------------------------------------------------------------
" Autocomplete
" ----------------------------------------------------------------------------
" Deoplete
 " Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
 " Javascript
 " Plug 'carlitux/deoplete-ternjs', { 'do': 'sudo npm install -g tern' }
 " Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
 " Go
 " Plug 'zchee/deoplete-go', { 'do': 'make'}
 " PHP
 " Plug 'padawan-php/deoplete-padawan'


" Language Server Protocol support
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" NCM - Nvim Completion Manager
" Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" javascript completion
" Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}

" golang completion
Plug 'ncm2/ncm2-go'

" word completion
Plug 'ncm2/ncm2-bufword'
" ultisnips completion
Plug 'ncm2/ncm2-ultisnips'

" Plug 'roxma/ncm-flow'
" language server protocol framework
" Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
" php completion via LanguageClient-neovim
" Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
" autocmd FileType php LanguageClientStart
" ----------------------------------------------------------------------------
" git
" ----------------------------------------------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'idanarye/vim-merginal'

" ----------------------------------------------------------------------------
" linting
" ----------------------------------------------------------------------------
" Plug 'benekastah/neomake'
Plug 'w0rp/ale'

" ----------------------------------------------------------------------------
" find and replace
" ----------------------------------------------------------------------------
Plug 'brooth/far.vim', { 'do': function('DoRemote') }

" ----------------------------------------------------------------------------
" tabs / buffers / files management
" ----------------------------------------------------------------------------
" Plug 'vim-ctrlspace/vim-ctrlspace'
" Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
" Plug 'tpope/vim-eunuch'
" Plug 'justinmk/vim-dirvish'
" ----------------------------------------------------------------------------
" vdebug
" ----------------------------------------------------------------------------
Plug 'joonty/vdebug'
let g:vdebug_features= {
            \"max_data" : 4096
            \}
let g:vdebug_keymap = {
    \    "run" : "<F5>",
    \    "run_to_cursor" : "<F9>",
    \    "step_over" : "<F2>",
    \    "step_into" : "<F3>",
    \    "step_out" : "<F4>",
    \    "close" : "<F6>",
    \    "detach" : "<F7>",
    \    "set_breakpoint" : "<F10>",
    \    "get_context" : "<F1>",
    \    "eval_under_cursor" : "<F12>",
    \    "eval_visual" : "<Leader><Leader>e",
    \}
let g:vdebug_options= {
    \    "port" : 9000,
    \    "server" : '',
    \    "timeout" : 20,
    \    "on_close" : 'detach',
    \    "break_on_open" : 0,
    \    "ide_key" : 'XDEBUG_VIESPEJO',
    \    "path_maps" : {"/usr/share/nginx": "/home/its32ve1/Data/code/www"},
    \    "debug_window_level" : 0,
    \    "debug_file_level" : 0,
    \    "debug_file" : "",
    \    "watch_window_style" : 'expanded',
    \    "marker_default" : '⬦',
    \    "marker_closed_tree" : '▸',
    \    "marker_open_tree" : '▾'
    \}

" ----------------------------------------------------------------------------
" Easy Align
" ----------------------------------------------------------------------------
Plug 'junegunn/vim-easy-align'

" ----------------------------------------------------------------------------
" Go Vim
" ----------------------------------------------------------------------------
Plug 'fatih/vim-go'
Plug 'sebdah/vim-delve'

" ----------------------------------------------------------------------------
" Tagbar
" ----------------------------------------------------------------------------
Plug 'majutsushi/tagbar'

" ----------------------------------------------------------------------------
" Emmet
" ----------------------------------------------------------------------------
Plug 'mattn/emmet-vim'

" ----------------------------------------------------------------------------
" Syntax Highlighting and Indentation
" ----------------------------------------------------------------------------
" Javascript
" Plug 'pangloss/vim-javascript', {'for': ['javascript']}
" Plug 'othree/javascript-libraries-syntax.vim', {'for': ['javascript']}
" Plug 'othree/yajs.vim', {'for': ['javascript']}
" Plug 'othree/es.next.syntax.vim', {'for': ['javascript']}
" Plug 'mxw/vim-jsx', {'for': ['javascript']}
Plug 'sheerun/vim-polyglot'

call plug#end()
endif

" }}}

" ============================================================================
" BASIC SETTINGS {{{
" ============================================================================
let loaded_matchit = 1 " matchit plugin is enabled by default in Neovim
"
let mapleader = ','
let maplocalleader = ','
"
set nu
set autoindent
set smartindent
set lazyredraw
set laststatus=2
set showcmd
set visualbell
set backspace=indent,eol,start
set timeoutlen=500
set whichwrap=b,s
set shortmess=aIT
set hlsearch " CTRL-L / CTRL-R W
set incsearch
set hidden
set ignorecase smartcase
set wildmenu
set wildmode=full
set tabstop=2
set shiftwidth=2
set expandtab smarttab
set scrolloff=5
set encoding=utf-8
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set virtualedit=block
set nojoinspaces
set diffopt=filler,vertical
set autoread
set mousehide
set mouse=a
set clipboard=unnamed
set foldlevelstart=99
set grepformat=%f:%l:%c:%m,%f:%l:%m
" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
"set completeopt=menuone,preview
set nocursorline
set nrformats=hex
silent! set cryptmethod=blowfish2

set formatoptions+=1
if has('patch-7.3.541')
  set formatoptions+=j
endif
if has('patch-7.4.338')
  let &showbreak = '↳ '
  set breakindent
  set breakindentopt=sbr
endif

set pastetoggle=<F9>
set modelines=2
set synmaxcol=1000

" ctags
set tags=./tags;/

" Initialize directories 
set nobackup
set nowritebackup
function! InitializeDirectories()
   let parent = $HOME
   let prefix = 'vim'
   let dir_list = {
                \ 'views': 'viewdir',
                \ 'swap': 'directory' }

   if has('persistent_undo')
       let dir_list['undo'] = 'undodir'
   endif

   let common_dir = parent . '/.' . prefix

   for [dirname, settingname] in items(dir_list)
       let directory = common_dir . dirname . '/'
       if exists("*mkdir")
           if !isdirectory(directory)
               call mkdir(directory)
           endif
       endif
       if !isdirectory(directory)
           echo "Warning: Unable to create backup directory: " . directory
           echo "Try: mkdir -p " . directory
       else
           let directory = substitute(directory, " ", "\\\\ ", "g")
           exec "set " . settingname . "=" . directory . "/"
       endif
   endfor
endfunction
call InitializeDirectories()

" undo config
if has('persistent_undo')
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

" set complete=.,w,b,u,t
set complete-=i

" 80 chars/line
set textwidth=0
if exists('&colorcolumn')
  set colorcolumn=80
endif

" Keep the cursor on the same column
set nostartofline

" color
set background=dark
set notermguicolors "used in terminal
if (has("termguicolors"))
  set termguicolors
endif

" Theme
"silent! colo despacio
let g:onedark_terminal_italics = 1
silent! colo onedark
" hi MatchParen cterm=bold ctermfg=167
" hi Normal ctermbg=none
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [['linter_errors', 'linter_warnings', 'linter_ok' ],
      \             [ 'lineinfo' ],
      \             [ 'percent' ],
      \             [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component_expand': {
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \ },
      \ 'colorscheme': 'onedark',
      \ }


" let g:airline_theme='base16_ocean'
" let g:airline_theme='oceanicnext'
" let g:airline_theme='solarized'
" let g:airline_theme='base16'
"
" }}}

" ============================================================================
" PLUGINS CONF {{{
" ============================================================================

" Started Page
let g:startify_bookmarks = [
      \ { 'df': '~/.dotfiles'},
      \ { 'go': '~/.gvm/pkgsets/go1.9.3/global/src'},
      \ {'react': '~/Data/code/www/reactapps/'},
      \ ]

" ----------------------------------------------------------------------------
" deoplete
" ----------------------------------------------------------------------------
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_smart_case = 1

" ----------------------------------------------------------------------------
" deoplete-ternjs
" ----------------------------------------------------------------------------
" let g:tern_request_timeout = 1
" let g:tern_show_signature_in_pum = 0  " This do disable full signature type on autocomplete
" au InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" ----------------------------------------------------------------------------
" deoplete-go
" ----------------------------------------------------------------------------
" let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'

" ----------------------------------------------------------------------------
" denite.nvim
"---------------------------------------------------------------------------

if executable('rg')
  call denite#custom#var('file_rec', 'command',
        \ ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'default_opts',
        \ ['--vimgrep', '--no-heading'])
else
  call denite#custom#var('file_rec', 'command',
        \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif

call denite#custom#map('insert', '<C-j>',
      \ '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>',
      \ '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('normal', 'r',
      \ '<denite:do_action:quickfix>', 'noremap')

call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
\ ['git', 'ls-files', '-co', '--exclude-standard'])
call denite#custom#option('default', 'highlight_mode_insert', 'Search')

" ----------------------------------------------------------------------------
" NCM
" ----------------------------------------------------------------------------
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'css': ['css-languageserver', '--stdio']
    \ }
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
" let g:LanguageClient_loggingLevel = 'DEBUG'
" ----------------------------------------------------------------------------
" phpcd
" ----------------------------------------------------------------------------
" let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
" let g:deoplete#ignore_sources.php = ['omni']


" ----------------------------------------------------------------------------
" find and replace
" ----------------------------------------------------------------------------
let g:far#source = 'agnvim'

" ----------------------------------------------------------------------------
" vinegar
" ----------------------------------------------------------------------------
"delete directory recursively
let g:netrw_localrmdir="rm -r"
let g:netrw_localmvcmd="mv"

" ----------------------------------------------------------------------------
" ranger.vim
" ----------------------------------------------------------------------------
" let g:ranger_replace_netrw = 1

" ----------------------------------------------------------------------------
" multiple-cursor
" ----------------------------------------------------------------------------
  function! Multiple_cursors_before()
      call ncm2#lock('vim-multiple-cursors')
  endfunction

  function! Multiple_cursors_after()
      call ncm2#unlock('vim-multiple-cursors')
  endfunction

" ----------------------------------------------------------------------------
" undotree
" ----------------------------------------------------------------------------
" If undotree is opened, it is likely one wants to interact with it.
let g:undotree_SetFocusWhenToggle=1

" ----------------------------------------------------------------------------
" Airline
" ----------------------------------------------------------------------------
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"

" ----------------------------------------------------------------------------
" JSX
" ----------------------------------------------------------------------------
let g:jsx_ext_required = 0

" ----------------------------------------------------------------------------
" TagBar
" ----------------------------------------------------------------------------
let g:tagbar_autoclose = 1
" let g:tagbar_autofocus = 1
" golang
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
        \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
        \ 'r:constructor', 'f:functions' ],
    \ 'sro' : '.',
    \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
    \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" ----------------------------------------------------------------------------
" Vim Javascript
" ----------------------------------------------------------------------------
let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_this           = "@"
let g:javascript_conceal_return         = "⇚"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_prototype      = "¶"
let g:javascript_conceal_static         = "•"
let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"
" ----------------------------------------------------------------------------
" Linting
" ----------------------------------------------------------------------------

" Javascript & Json
" let g:neomake_javascript_enabled_makers = ['eslint']
" let g:neomake_json_enabled_makers = ['jsonlint']

" PHP
" let g:neomake_php_enabled_makers = ['php', 'phpcs']

" Run neomake on save for all files
" autocmd! BufWritePost * Neomake

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'php': ['php', 'phpcs'],
\   'go': ['gometalinter'],
\   'css': ['stylelint']
\}
" let g:ale_linter_aliases = {'jsx': 'css'}
let g:ale_go_gometalinter_options = '--fast'
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'css': ['stylelint'],
\   'json': ['prettier']
\}
let g:ale_fix_on_save = 1

" ----------------------------------------------------------------------------
" CtrlSpace
" ----------------------------------------------------------------------------
" set showtabline=0
" let g:CtrlSpaceDefaultMappingKey = "<C-space> "
" if executable("ag")
"   let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
" endif

" ----------------------------------------------------------------------------
" Vim Go
" ----------------------------------------------------------------------------
"let g:go_fmt_autosave = 0
let g:go_fmt_fail_silently = 1

" }}}

" ============================================================================
" AUTOCOMMANDS {{{
" ============================================================================
augroup MyAutoCmd	
	au!
augroup END

" ----------------------------------------------------------------------------
" json = javascript syntax highlight
" ----------------------------------------------------------------------------
" au MyAutoCmd FileType json setlocal syntax=javascript
" ----------------------------------------------------------------------------

" javascript
" ----------------------------------------------------------------------------
au BufNewFile,BufRead *.pjs setf javascript
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" Fugitive
" ----------------------------------------------------------------------------
" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" }}}

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

" Adjust viewports to the same size
map <Leader>= <C-w>=
" Maximize viewports to the same size
map <Leader>_ <C-w>_

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Easier horizontal scrolling
map zl zL
map zh zH

" Wipe buffer 
nnoremap <silent> Q :bw<CR>

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
nmap <leader>s :Snippets<CR>
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
nnoremap <silent> [Space]<space> :<C-u>Denite file_mru buffer<CR>

nnoremap <silent> [Space]p :<C-u>Denite
\ `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`<CR>

" Quick registers
nnoremap <silent> [Space]r :<C-u>Denite register<CR>

" Quick yank history
nnoremap <silent> [Space]y :<C-u>Denite neoyank<CR>

" Quick outline
nnoremap <silent> [Space]o :<C-u>Denite outline<CR>

" Quickly switch lcd
nnoremap <silent> [Space]d
      \ :<C-u>Denite -default-action=cd directory_mru<CR>

" Quick grep from pwd
nnoremap <silent> [Space]g :<C-u>Denite grep:.<CR>

" Quick help
nnoremap <silent> [Space]h :<C-u>Denite help<CR>

" Quick line
nnoremap <silent> [Space]l :<C-u>Denite line<CR>

" Quick commands
nnoremap <silent> [Space]c :<C-u>Denite -start-insert command_history<CR>

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
let g:merginal_splitType = ''
" ----------------------------------------------------------------------------
" Tagbar
" ----------------------------------------------------------------------------
nnoremap <silent> <leader>tt :TagbarToggle<CR>

" ----------------------------------------------------------------------------
" Emmet
" ----------------------------------------------------------------------------
let g:user_emmet_settings = {
  \    'javascript.jsx' : {
  \        'extends' : 'jsx',
  \    },
\}

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

au FileType go nmap <Leader>gd <Plug>(go-doc)

au FileType go nmap <Leader>s <Plug>(go-implements)

au FileType go nmap <Leader>i <Plug>(go-info)
" }}}

