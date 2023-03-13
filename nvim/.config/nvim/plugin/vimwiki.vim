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


autocmd FileType vimwiki nnoremap <silent>go :w <bar> :silent call OpenMarkdown(expand("%:p"))<CR>
autocmd FileType vimwiki nnoremap <silent>gO :w<bar> call CreatePDF(expand("%:p"))<cr>

function! OpenMarkdown(path)

    let l:path = a:path[:-3] . "pdf"
    call CreatePDF(a:path)
	" let l:splitPath = split(a:path, '/')
	" let l:finalPath = join(l:splitPath[3:],'/')
	" let l:ex = "! xdg-open http://wiki.localhost/" . l:finalPath . "&" 
	" execute l:ex
    execute "!xdg-open " . l:path . ' &' 
endfunction

function! CreatePDF(path)
    let l:path = a:path[:-3] . "pdf"
    execute "!pandoc " . a:path ." -s --mathjax -t pdf -f markdown -o " . l:path . " &"
endfunction

" TaskWiki
let g:taskwiki_markup_syntax = 'markdown'
