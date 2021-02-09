" vim: set sw=2 ts=2 sts=2 foldmethod=marker:

if !exists('g:loaded_vsnip')
  finish
endif

function! s:snippets_complete() abort
    let wordToComplete = matchstr(strpart(getline('.'), 0, col('.') - 1), '\k*$')
    let fromWhere      = col('.') - len(wordToComplete)
    let containWord    = "stridx(v:val.word, wordToComplete)>=0"
    let candidates     = vsnip#get_complete_items(bufnr("%"))

    " echom "wordTocomplete: " . wordToComplete
    " echom "fromWhere: " . fromWhere
    " echom "containWord: " . containWord

    call filter(candidates, containWord)

    if !empty(candidates)
        call complete(fromWhere, candidates)
    endif
    return ""
endfunction

" mappings {{{

" completion for snippets
inoremap <silent> <c-l> <c-r>=<SID>snippets_complete()<cr>

" expand or jump
imap <expr> <c-j>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<c-j>'
smap <expr> <c-j>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<c-j>'

" jump forward or backward

imap <expr> <c-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<c-k>'
smap <expr> <c-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<c-k>'

" select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" see https://github.com/hrsh7th/vim-vsnip/pull/50
" nmap        s   <Plug>(vsnip-select-text)
" xmap        s   <Plug>(vsnip-select-text)
" nmap        S   <Plug>(vsnip-cut-text)
" xmap        S   <Plug>(vsnip-cut-text)

" }}}

