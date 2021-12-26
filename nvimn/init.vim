" vim: set sw=2 ts=2 sts=2 foldmethod=marker:

" ENVIROMENT VARIABLES USED BY VIM {{{

let $XDG_CONFIG_HOME = $HOME.'/.config/nvimn-config'
let $XDG_DATA_HOME = $HOME.'/.local/share/nvimn-data'

" }}}

" ENVIROMENT VARIABLES USED BY ME {{{

let $MYNVIMDIR = '~/.dotfiles/nvimn'

" }}}

" FUNCTIONS {{{
function! ToggleOption(option_name) abort
  execute 'setlocal' a:option_name.'!'
  execute 'setlocal' a:option_name.'?'
endfunction

function! s:initialize_directories()
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
      exec "set " . settingname . "=" . directory
    endif
  endfor
endfunction

" }}}

" VIM VARIABLES {{{

let mapleader = ","
let g:netrw_banner = 0
" custom default timeoutlen
let g:vec_timeoutlen = 1200
" the g:vimsyn_embed option allows users to select what, if any, types of
" embedded script highlighting they wish to have.
" default -> g:vimsyn_embed == 0      : disable (don't embed any scripts)
" g:vimsyn_embed == 'lPr'  " support embedded lua, python and ruby
let g:vimsyn_embed = 'l'

" }}}

" VIM OPTIONS {{{

" runtimepath
set runtimepath=/usr/share/vim/vimfiles "archlinux
set runtimepath+=$XDG_CONFIG_HOME/nvim,$XDG_DATA_HOME/nvim/site,$VIMRUNTIME
set runtimepath+=$XDG_DATA_HOME/nvim/site/after,$XDG_CONFIG_HOME/nvim/after
" packpath
let &packpath = &runtimepath
" options for insert mode completion 
set completeopt=menuone,noinsert,noselect
" list of directories which will be searched when using the |gf|, [f, ]f, ^Wf,
" |:find|, |:sfind|, |:tabfind| and other commands
set path=.,**
" splitting window -> bellow and right
set splitbelow splitright
" d, y, p, P using CLIPBOARD ["+] [unnamedplus]
set clipboard=unnamedplus
" strings to use in list mode
set listchars=tab:→.,trail:·,eol:¬,extends:…,precedes:…
set list
" tab and indent
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab " use space in indents
set breakindent
set showbreak=↳\ 
" allow switching buffers without writting to disk
set hidden
" search
set ignorecase smartcase
" column highlighted
set colorcolumn=80
" number
" set number relativenumber
set number
" true terminal color
set termguicolors
" milliseconds to wait for a mapped sequence to complete
let &timeoutlen = g:vec_timeoutlen
" backup, viewdir, undodir, directory
set nobackup nowritebackup
call s:initialize_directories()
" undo config
set undofile                " So is persistent undo ...
set undolevels=1000         " Maximum number of changes that can be undone
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
" ctags
set tags=./tags;/
" not to show the mode message on the last line
set noshowmode
" always show the signcolumn, otherwise it would shift the text each time
set signcolumn=yes
" default vertical split for diff mode
set diffopt+=vertical

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
nnoremap <silent> <m-p> :bp<cr>
nnoremap <silent> <m-n> :bn<cr>
nnoremap <silent> <leader>3 :b#<cr>
" turn highlighted matches off but it does not change hlsearch option
nnoremap <silent> <leader>/ :nohlsearch<cr>
" change Working Directory to that of the current file
cnoremap cd. lcd %:p:h
" open netwr on directory of the current file 
nnoremap <leader>e. :Ex<cr>
" for when you forget to sudo.. Really Write the file.
cnoremap w!! w !sudo tee % >/dev/null
" helper to edit mode
cnoremap %% <C-R>=expand('%:h').'/'<cr>
nmap <leader>ew :e %%
" smart space mapping.
nmap  <Space>   [Space]
nnoremap  [Space]   <Nop>
" toggle wrap
nnoremap [Space]w :<c-u>call ToggleOption('wrap')<CR>
" quickfix and location list
nnoremap <silent> <leader>qo :copen<cr>
nnoremap <silent> <leader>qc :cclose<cr>
nnoremap <silent> <leader>qn :cnext<cr>zz
nnoremap <silent> <leader>qp :cprev<cr>zz
nnoremap <silent> <leader>qgg :cfirst<cr>
nnoremap <silent> <leader>qG :clast<cr>
nnoremap <silent> <leader>lo :lopen<cr>
nnoremap <silent> <leader>lc :lclose<cr>
nnoremap <silent> <leader>ln :lnext<cr>zz
nnoremap <silent> <leader>lp :lprev<cr>zz
nnoremap <silent> <leader>lgg :lfirst<cr>
nnoremap <silent> <leader>lG :llast<cr>
" i_ctrlx_ctrlf
inoremap <c-f> <c-x><c-f>
" selecting text you just pasted
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]h'
" resize windows
nnoremap <silent> <m-j> :resize -1<cr>
nnoremap <silent> <m-k> :resize +1<cr>
nnoremap <silent> <m-h> :vertical resize -1<cr>
nnoremap <silent> <m-l> :vertical resize +1<cr>

"}}}

" COMMANDS {{{


" }}}

" AUTOCOMMANDS {{{

" reduce waiting for mapping sequence en terminal
" I'm using "," as <leader> for mapping en terminal
" and type a comma in fzf terminal is delayed
augroup FastTerminalLeader
  autocmd!
  au TermEnter * let &timeoutlen = 200
  au TermLeave * let &timeoutlen = g:vec_timeoutlen
augroup END

" javascript
" ----------------------------------------------------------------------------
au BufNewFile,BufRead *.pjs setf javascript

" }}}

" PLUGINS {{{
" ...see package in ~/.dotfiles/nvimn/pack

" add vim-oscyank on-demand
call lazy#setCmdMap(["OSCYank","OSCYankReg"],"vim-oscyank")

" vim-fugitive
" ...see custom after vimscript in ~/.dotfiles/nvimn/after/plugin/fugitive.vim

" undotree {{{

" add undotree on-demand
call lazy#setCmdMap("UndotreeToggle","undotree")

" If undotree is opened, it is likely one wants to interact with it.
let g:undotree_SetFocusWhenToggle = 1
nnoremap <silent> <leader>u :UndotreeToggle<cr>

" }}}

" fzf {{{

" overwrite default command (only files)
let $FZF_DEFAULT_COMMAND = $FZF_DEFAULT_COMMAND." --type f"
" - down / up / left / right
let g:fzf_layout = { 'up': '60%' }
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']
" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = $XDG_DATA_HOME."/fzf-history"
" commands and mappings for fzf
" ...see custom after vimscript in ~/.dotfiles/nvimn/after/plugin/fzf.vim

" }}}

" colorscheme oceanicnext
" colo OceanicNext

" colorscheme gruvbox-material
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_sign_column_background = 'none'
colo gruvbox-material

" lightline {{{

let g:lightline = {
  \'enable': {
    \'statusline': 1,
    \'tabline': 0,
  \},
  \'active': {
    \'left': [
      \[ 'mode', 'paste' ],
      \[ 'gitbranch', 'readonly', 'filename', 'modified' ]
    \],
    \'right': [
      \['linter_errors', 'linter_warnings', 'linter_ok' ],
      \[ 'lineinfo' ],
      \[ 'percent' ],
      \[ 'fileformat', 'fileencoding', 'filetype' ]
    \]
  \},
  \'component_function': {
    \'gitbranch': 'fugitive#head',
  \},
  \'component_expand': {
    \'linter_warnings': 'lightline#ale#warnings',
    \'linter_errors': 'lightline#ale#errors',
    \'linter_ok': 'lightline#ale#ok',
  \},
  \'component_type': {
    \'linter_warnings': 'warning',
    \'linter_errors': 'error',
  \},
  \'colorscheme': 'gruvbox_material',
\}

"}}}

" highlighter nvim-colorizer.lua
" ...see ~/.dotfiles/nvimn/lua/vec/configs/nvim-colorizer.lua
lua require'vec.configs.nvim-colorized'

" nvim-treesitter
" ...see ~/.dotfiles/nvimn/lua/vec/configs/nvim-treesitter.lua
lua require'vec.configs.nvim-treesitter'

" nvim-lspconfig {{{

" set v:null if you don't want lsp for any server
let g:lsp_vimls = v:null
" let g:lsp_vimls = 1
let g:lsp_tsserver = 1
let g:lsp_gopls = 1
let g:lsp_cssls = 1
let g:lsp_cssmodules_ls = 1
let g:lsp_intelephense = 1
" set v:null if you don't want lsp auto_document_highlight
" let g:lsp_auto_document_highlight = v:null
let g:lsp_auto_document_highlight = 1
" ...see ~/.dotfiles/nvimn/lua/vec/configs/nvim-lspconfig.lua
lua require'vec.configs.nvim-lspconfig'

" }}}

" completion-nvim {{{

" let g:completion_enable_auto_popup = 0
" let g:completion_confirm_key = "\<C-y>"
" let g:completion_enable_snippet = "vim-vsnip"
" let g:completion_enable_auto_signature = 0
" let g:completion_enable_auto_hover = 0
" " avoid showing message extra message when using completion
" " set shortmess+=c

" let g:completion_chain_complete_list = {
"       \'default' : [
"       \    {'complete_items': ['lsp']},
"       \    {'complete_items': ['snippet']}
"       \]
"       \}

" " ...see custom after vimscript in ~/.dotfiles/nvimn/after/plugin/completion.vim

" }}}

" vem-tabline
" ...see custom after vimscript in ~/.dotfiles/nvimn/after/plugin/vem_tabline.vim

" vim-polyglot
let g:polyglot_disabled = ['csv']

" ale {{{
let g:ale_disable_lsp = 1
let g:ale_linters_explicit = 1
" only run linters named in ale_linters settings.
let g:ale_linters = {
  \'javascript': ['eslint'],
  \'php': ['php', 'phpcs'],
  \'go': ['golangci-lint'],
  \'css': ['stylelint'],
  \'scss': ['stylelint'],
  \'json': ['jsonlint']
\}

let g:ale_javascript_eslint_executable='npx eslint'
let g:ale_javascript_prettier_executable='npx prettier'
let g:ale_javascript_prettier_options='--parser typescript'
let g:ale_css_stylelint_executable='npx stylelint'
let g:ale_scss_stylelint_executable='npx stylelint'
let g:ale_json_jsonlint_executable='npx jsonlint'
" let g:ale_go_golangci_lint_options = '--fast'
let g:ale_echo_msg_format = '[ALE: %linter%] %s [%severity%]'

let g:ale_fixers = {
  \'php': ['php_cs_fixer'],
  \'javascript': ['prettier'],
  \'css': ['stylelint'],
  \'scss': ['stylelint'],
  \'go': ['goimports']
\}

let g:ale_fix_on_save = 1

let g:ale_linter_aliases = {'html': ['html', 'javascript', 'css']}
" let g:ale_virtualtext_cursor = 1

let g:ale_sign_error='●'
let g:ale_sign_warning='..'

" }}}

" vim-vsnip {{{

let g:vsnip_snippet_dir = expand($MYNVIMDIR."/snippets/.vsnip")

" ...see custom after vimscript in ~/.dotfiles/nvimn/after/plugin/vsnip.vim

" }}}

" emmet {{{

" binding Ctrl-, to '6#9' in alacritty because <c-,> is no mappable in vim
let g:user_emmet_leader_key = '6#9'

" }}}

" " vimspector {{{

" " add vimspector on-demand
" call lazy#setCmdMap(["<Plug>VimspectorContinue"],"vimspector")
" " packadd! vimspector
" " let g:vimspector_enable_mappings = 'HUMAN'
" nmap <leader>dc <Plug>VimspectorContinue
" nmap <leader>ds <Plug>VimspectorStop
" nmap <leader>dr <Plug>VimspectorRestart
" nmap <leader>dp <Plug>VimspectorPause
" nmap <leader>dbb <Plug>VimspectorToggleBreakpoint
" nmap <leader>dbc <Plug>VimspectorToggleConditionalBreakpoint
" nmap <leader>dbf <Plug>VimspectorAddFunctionBreakpoint
" nmap <leader>dg <Plug>VimspectorRunToCursor
" nmap <leader>dn <Plug>VimspectorStepOver
" nmap <leader>di <Plug>VimspectorStepInto
" nmap <leader>do <Plug>VimspectorStepOut
" nnoremap <silent> <leader>dq :VimspectorReset<cr>
" nmap <Leader>de <Plug>VimspectorBalloonEval
" xmap <Leader>de <Plug>VimspectorBalloonEval

" " }}}

" nvim-dap {{{

function! s:init_dap() abort
  if exists('g:loaded_dap')
    " echom "DAP was already added previously!"
    echom "Disconnecting..."
    lua << EOF
    local dap = require('dap')
    dap.close()
    dap.disconnect()
EOF
    return
  endif
  packadd! nvim-dap
  packadd! nvim-dap-ui
  nnoremap <silent> <leader>dc :lua require'dap'.continue()<CR>
  nnoremap <silent> <leader>ds :lua require'dap'.close()<CR>
  nnoremap <silent> <leader>dk :lua require'dap'.up()<CR>
  nnoremap <silent> <leader>dj :lua require'dap'.down()<CR>
  nnoremap <silent> <leader>dn :lua require'dap'.step_over()<CR>
  nnoremap <silent> <leader>di :lua require'dap'.step_into()<CR>
  nnoremap <silent> <leader>do :lua require'dap'.step_out()<CR>
  nnoremap <silent> <leader>dg :lua require'dap'.run_to_cursor()<CR>
  nnoremap <silent> <leader>db :lua require'dap'.toggle_breakpoint()<CR>
  nnoremap <silent> <leader>dB :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
  nnoremap <silent> <leader>dr :lua require'dapui'.toggle('tray')<CR>
  nnoremap <silent> <leader>d/ :lua require'dapui'.toggle('sidebar')<CR>
  nnoremap <silent> <leader>de :lua require'dapui'.eval()<CR>
  vnoremap <silent> <leader>de <Cmd>lua require("dapui").eval()<CR>
  nnoremap <silent> <leader>dv :lua require'dapui'.float_element('scopes', {enter = true})<CR>
  " ...see ~/.dotfiles/nvimn/lua/vec/configs/nvim-dap.lua
  lua require'vec.configs.nvim-dap'
  " ...see ~/.dotfiles/nvimn/lua/vec/configs/nvim-dap-ui.lua
  lua require'vec.configs.nvim-dap-ui'
  let g:loaded_dap = 1
  echom "DAP added!"
endfunction

nnoremap <silent> <leader>dd :call <SID>init_dap()<cr>

" }}}

" rnvimr {{{

nnoremap <silent> <leader>r :RnvimrToggle<CR>
tnoremap <silent> <leader>r :RnvimrToggle<CR>
tnoremap <silent> <M-i> <C-\><C-n>:RnvimrResize<CR>

" }}}

" nvim-autopairs {{{

lua require('nvim-autopairs').setup{}

" }}}

" }}}
