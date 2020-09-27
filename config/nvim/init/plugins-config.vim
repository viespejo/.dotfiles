" vim: set sw=2 ts=2 sts=2 foldmethod=marker:

" ============================================================================
" PLUGINS CONF {{{
" ============================================================================

" Emmet
let g:user_emmet_settings = {
  \    'javascript.jsx' : {
  \        'extends' : 'jsx',
  \    },
\}

" Merginal
" ----------------------------------------------------------------------------
let g:merginal_splitType = ''

" Gitgutter
let g:gitgutter_enabled = 0

" Vdebug config
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

" Theme Color

"silent! colo despacio
" let g:onedark_terminal_italics = 1
" silent! colo onedark
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" colo OceanicNext
let g:gruvbox_italic = 1
let g:gruvbox_sign_column = "bg0"
colo gruvbox
" hi MatchParen cterm=bold ctermfg=167

" let g:airline_theme='base16_ocean'
" let g:airline_theme='oceanicnext'
" let g:airline_theme='solarized'
" let g:airline_theme='base16'


" lightline config
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [['linter_errors', 'linter_warnings', 'linter_ok' ],
      \             [ 'lineinfo' ],
      \             [ 'percent' ],
      \             [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
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
      \ 'colorscheme': 'gruvbox',
      \ }

  function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
  endfunction
  
  function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
  endfunction

" Firenvim Chrome Extension
if exists('g:started_by_firenvim')
  set laststatus=0
  set guifont=monospace:h16
  let g:firenvim_config = { 
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
  \ }
endif

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
" vim-polyglot
" let g:polyglot_disabled = ['csv']

" ----------------------------------------------------------------------------
" denite.nvim
"---------------------------------------------------------------------------
if executable('rg')
  " === Denite setup ==="
  " Use ripgrep for searching current directory for files
  " By default, ripgrep will respect rules in .gitignore
  "   --files: Print each file that would be searched (but don't search)
  "   --glob:  Include or exclues files for searching that match the given glob
  "            (aka ignore .git files)
  "
  call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

  " Use ripgrep in place of "grep"
  call denite#custom#var('grep', 'command', ['rg'])

  " Custom options for ripgrep
  "   --vimgrep:  Show results with every match on it's own line
  "   --hidden:   Search hidden directories and files
  "   --heading:  Show the file name above clusters of matches from each file
  "   --S:        Search case insensitively if the pattern is all lowercase
  call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

  " Recommended defaults for ripgrep via Denite docs
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])

else
  call denite#custom#var('file/rec', 'command',
        \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" Open file commands
" call denite#custom#map('insert,normal', "<C-t>", '<denite:do_action:tabopen>')
" call denite#custom#map('insert,normal', "<C-v>", '<denite:do_action:vsplit>')
" call denite#custom#map('insert,normal', "<C-h>", '<denite:do_action:split>')

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'auto_resize': 1,
\ 'prompt': 'λ:',
\ 'direction': 'rightbelow',
\ 'winminheight': '10',
\ 'highlight_mode_insert': 'Visual',
\ 'highlight_mode_normal': 'Visual',
\ 'prompt_highlight': 'Function',
\ 'highlight_matched_char': 'Function',
\ 'highlight_matched_range': 'Normal',
\ 'split': 'horizontal'
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> a
  \ denite#do_map('choose_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> r
  \ denite#do_map('redraw')
  nnoremap <silent><buffer><expr> R
  \ denite#do_map('restart')
  nnoremap <silent><buffer><expr> <ESC>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

	autocmd FileType denite-filter call s:denite_filter_my_settings()
	function! s:denite_filter_my_settings() abort
	  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
	endfunction
" call denite#custom#map('insert', '<C-j>',
"       \ '<denite:move_to_next_line>', 'noremap')
" call denite#custom#map('insert', '<C-k>',
"       \ '<denite:move_to_previous_line>', 'noremap')
" call denite#custom#map('normal', 'r',
"       \ '<denite:do_action:quickfix>', 'noremap')

call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
\ ['git', 'ls-files', '-co', '--exclude-standard'])

" Change matchers to project
call denite#custom#alias('source', 'file_mru_project', 'file_mru')
call denite#custom#source(
	\ 'file_mru_project', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
" ----------------------------------------------------------------------------
" NCM
" ----------------------------------------------------------------------------
" let g:LanguageClient_diagnosticsEnable = 0
" let g:LanguageClient_serverCommands = {
"     \ 'javascript': ['javascript-typescript-stdio'],
"     \ 'javascript.jsx': ['javascript-typescript-stdio'],
"     \ 'css': ['css-languageserver', '--stdio']
"     \ }
" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
" let g:LanguageClient_loggingLevel = 'DEBUG'
" ----------------------------------------------------------------------------
" phpcd
" ----------------------------------------------------------------------------
" let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
" let g:deoplete#ignore_sources.php = ['omni']

" ----------------------------------------------------------------------------
" COC
" ----------------------------------------------------------------------------
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<TAB>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader><leader>f  <Plug>(coc-format-selected)
nmap <leader><leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
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
  " function! Multiple_cursors_before()
  "     call ncm2#lock('vim-multiple-cursors')
  " endfunction

  " function! Multiple_cursors_after()
  "     call ncm2#unlock('vim-multiple-cursors')
  " endfunction

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
" let g:jsx_ext_required = 0

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
" let g:javascript_conceal_function       = "ƒ"
" let g:javascript_conceal_null           = "ø"
" let g:javascript_conceal_this           = "@"
" let g:javascript_conceal_return         = "⇚"
" let g:javascript_conceal_undefined      = "¿"
" let g:javascript_conceal_NaN            = "ℕ"
" let g:javascript_conceal_prototype      = "¶"
" let g:javascript_conceal_static         = "•"
" let g:javascript_conceal_super          = "Ω"
" let g:javascript_conceal_arrow_function = "⇒"
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

" " Only run linters named in ale_linters settings.
" let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'php': ['php', 'phpcs'],
\   'go': ['gometalinter'],
\   'css': ['stylelint'],
\   'json': ['jsonlint']
\}
let g:ale_javascript_eslint_executable='npx eslint'
let g:ale_css_stylelint_executable='npx stylelint'
let g:ale_json_jsonlint_executable='npx jsonlint'

" let g:ale_linter_aliases = {'jsx': 'css'}
let g:ale_go_gometalinter_options = '--fast'
let g:ale_echo_msg_format = '[ALE: %linter%] %s [%severity%]'

let g:ale_fixers = {
\   'php': ['php_cs_fixer']
\}
j

let g:ale_fix_on_save = 1
" let g:ale_lint_on_text_changed = 'never'

let g:ale_sign_error='●'
let g:ale_sign_warning='..'
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
" let g:go_def_mapping_enabled = 0
let g:go_def_mode = 'godef'

" }}}
