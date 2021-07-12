au FileType vimwiki setlocal shiftwidth=6 tabstop=6 noexpandtab
let g:vimwiki_list = [{'path': '~/wiki', 'syntax': 'markdown', 
			\'ext': '.md',
			\'nested_syntaxes': {'python': 'python', 'c++': 'cpp'},
			\'auto_diary_index': 1}]
"let g:vimwiki_folding = 'expr'
let g:vimwiki_markdown_link_ext = 1

autocmd FileType vimwiki setlocal foldenable
autocmd Filetype vimwiki syn region match start=/\\$\\$/ end=/\\$\\$/
autocmd Filetype vimwiki syn match math '\\$[^$].\{-}\$'

autocmd FileType vimwiki nnoremap <silent><leader>c :w <bar> :silent call OpenMarkdown(expand("%:p"))<CR>

function! OpenMarkdown(path)
	let l:splitPath = split(a:path, '/')
	let l:finalPath = join(l:splitPath[3:],'/')
	let l:ex = "! xdg-open http://wiki.localhost/" . l:finalPath . "&" 
	execute l:ex
endfunction

" TaskWiki
let g:taskwiki_markup_syntax = 'markdown'
