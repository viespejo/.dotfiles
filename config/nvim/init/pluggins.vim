" vim: set sw=2 ts=2 sts=2 foldmethod=marker:

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


" ----------------------------------------------------------------------------
" Firenvim Chrome Extension
" ----------------------------------------------------------------------------
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" ----------------------------------------------------------------------------
" Fuzzy search
" " ----------------------------------------------------------------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/denite.nvim', { 'do': function('DoRemote') }
Plug 'chemzqm/denite-extra'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neoyank.vim'

" ----------------------------------------------------------------------------
" Edit
" ----------------------------------------------------------------------------
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle'   }
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'terryma/vim-expand-region'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'DougBeney/pickachu'

" ----------------------------------------------------------------------------
" Color
" ----------------------------------------------------------------------------
" Plug 'AlessandroYorba/Despacio'
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'

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
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
" NCM - Nvim Completion Manager
" Plug 'roxma/nvim-completion-manager'
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()

" javascript completion
" Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
" Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}

" golang completion
" Plug 'ncm2/ncm2-go'

" word completion
" Plug 'ncm2/ncm2-bufword'
" ultisnips completion
" Plug 'ncm2/ncm2-ultisnips'

" Plug 'roxma/ncm-flow'
" language server protocol framework
" Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
" php completion via LanguageClient-neovim
" Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
" autocmd FileType php LanguageClientStart
"
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

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
Plug 'dense-analysis/ale'

" ----------------------------------------------------------------------------
" find and replace
" ----------------------------------------------------------------------------
Plug 'brooth/far.vim', { 'do': function('DoRemote') }

" ----------------------------------------------------------------------------
" tabs / buffers / files management
" ----------------------------------------------------------------------------
" Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
" Plug 'tpope/vim-vinegar'
" Plug 'tpope/vim-eunuch'
" Plug 'justinmk/vim-dirvish'
" ----------------------------------------------------------------------------
" vdebug
" ----------------------------------------------------------------------------
Plug 'joonty/vdebug'

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
" R
" ----------------------------------------------------------------------------
Plug 'jalvesaq/Nvim-R'

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

Plug 'ryanoasis/vim-devicons'
call plug#end()
endif

" }}}
