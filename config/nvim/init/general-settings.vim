" vim: set sw=2 ts=2 sts=2 foldmethod=marker:

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
set cmdheight=2
set visualbell
set backspace=indent,eol,start
set timeoutlen=500
set whichwrap=b,s
set shortmess=aITc
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
" set completeopt=noinsert,menuone,noselect
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
set t_ut=
if (has("termguicolors"))
  set termguicolors
endif


" hi Normal ctermbg=none


" }}}
