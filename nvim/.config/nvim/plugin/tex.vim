" Change default Vimtex mapping that makes ] wait
autocmd VimEnter tex iunmap <buffer> ]]

let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_open_on_warning = '0'
let g:vimtex_indent_enabled = 1
let g:vimtex_fold_enabled=1
let g:vimtex_matchparen_enabled = 0
let g:vimtex_syntax_enabled = 0

" autocmd FileType tex setlocal conceallevel=1
autocmd FileType tex setlocal tw=80
" let g:tex_conceal="abdgm"
