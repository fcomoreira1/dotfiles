"Vim-Plug
call plug#begin()

Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'

Plug 'vimwiki/vimwiki'
" Plug 'tools-life/taskwiki'

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'mhinz/vim-startify'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'vim-airline/vim-airline'
Plug 'akinsho/nvim-bufferline.lua'

Plug 'kyazdani42/nvim-web-devicons' 
Plug 'norcalli/nvim-colorizer.lua'
Plug 'b3nj5m1n/kommentary'
Plug 'kdheepak/lazygit.nvim'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'ray-x/lsp_signature.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'kabouzeid/nvim-lspinstall'

call plug#end()

set termguicolors
colorscheme onedark
let g:onedark_termcolors=256
let g:onedark_terminal_italics = 2

let mapleader = " "

nnoremap <silent>Q :noh<CR>
nnoremap <silent><S-Up> :resize +2<CR> 
nnoremap <silent><S-Down> :resize -2<CR>
nnoremap <silent><S-Left> :vertical resize +2<CR>
nnoremap <silent><S-Right> :vertical resize -2<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap ; :
nnoremap : ;
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap > >gv
vnoremap < <gv
nnoremap <C-f> :NvimTreeToggle<CR>
nnoremap <C-t> :terminal<CR>
nnoremap <C-s> :Startify<CR>
nnoremap <C-b> <C-v>
vnoremap <C-c> "+y
inoremap <C-v> "+p
noremap <C-v> "+p

" Keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv

" Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Moving Text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

tnoremap <leader>h <C-\><C-n><C-w>h
tnoremap <leader>j <C-\><C-n><C-w>j
tnoremap <leader>k <C-\><C-n><C-w>k
tnoremap <leader>l <C-\><C-n><C-w>l
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

"Syntax highlighting
autocmd BufNewFile,BufRead *.rasi setf css
autocmd BufNewFile,BufRead *.conf setf conf
autocmd BufNewFile,BufRead config setf cfg

"" Airline
let g:airline_powerline_fonts = 1 
let g:airline_section_z = '☰ %3l/%L:%2v'

"Startify
let g:startify_session_dir='~/.config/nvim/session'
let g:startify_session_persistence = 0

" UltiSnippets
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsListSnippets="<C-a>"

" Lazygit
let g:lazygit_floating_window_scaling_factor = 0.85 " scaling factor for floating windo

" colorizer.lua
lua <<EOF
require'colorizer'.setup(
  {'*';},
  {
    RGB      = true;         -- #RGB hex codes
    RRGGBB   = true;         -- #RRGGBB hex codes
    RRGGBBAA = true;         -- #RRGGBBAA hex codes
    rgb_fn   = true;         -- CSS rgb() and rgba() functions
    hsl_fn   = true;         -- CSS hsl() and hsla() functions
    css      = true;         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn   = true;         -- Enable all CSS *functions*: rgb_fn, hsl_fn
	names = true;
  })
EOF

" Fix weird size when openning directly from nautilus
autocmd VimEnter * :silent exec "!kill -s WINCH $PPID"
