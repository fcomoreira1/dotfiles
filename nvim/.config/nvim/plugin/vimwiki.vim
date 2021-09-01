au FileType vimwiki setlocal shiftwidth=6 tabstop=6 noexpandtab
let g:vimwiki_list = [{'path': '~/wiki', 'syntax': 'markdown', 
			\'ext': '.md',
			\'nested_syntaxes': {'python': 'python', 'c++': 'cpp'},
			\'auto_diary_index': 1}]
"let g:vimwiki_folding = 'expr'
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_table_mappings = 0

function! Math()
    "" Define certain regions
    syn region math start=/\$\$/ end=/\$\$/
    syn match math_block '\$[^$].\{-}\$'

    hi link math Statement
    hi link math_block Function
endfunction

autocmd FileType vimwiki call Math()
autocmd FileType vimwiki setlocal foldenable


autocmd FileType vimwiki nnoremap <silent><leader>c :w <bar> :silent call OpenMarkdown(expand("%:p"))<CR>

function! OpenMarkdown(path)
	let l:splitPath = split(a:path, '/')
	let l:finalPath = join(l:splitPath[3:],'/')
	let l:ex = "! xdg-open http://wiki.localhost/" . l:finalPath . "&" 
	execute l:ex
endfunction

" TaskWiki
let g:taskwiki_markup_syntax = 'markdown'
