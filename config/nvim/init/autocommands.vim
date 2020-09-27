" vim: set sw=2 ts=2 sts=2 foldmethod=marker:

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

