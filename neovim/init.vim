set number
set relativenumber
set autoindent
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
set expandtab
set mouse=a
set cursorline
set list listchars=trail:»,tab:»-
set fillchars+=vert:\ 
set wrap breakindent
set encoding=UTF-8

set nowrap

set foldmethod=indent
set foldlevel=4

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/solyarisoftware/nera.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'Pocco81/AutoSave.nvim'
Plug 'maxboisvert/vim-simple-complete'

Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors

Plug 'nvim-lua/plenary.nvim'
" Plug 'tanvirtin/vgit.nvim'
Plug 'https://github.com/tpope/vim-fugitive'

call plug#end()

au FileType coffee setl noet ts=3 sw=3 sts=3 smartindent aw foldmethod=indent
au FileType c    setl noet sw=8 sts=8 ts=8 tw=80 cms=//%s wig=*[^.]?,*.o
au FileType javascript setl fdm=marker et ts=2 sw=2 sts=2
au FileType ruby setl et ts=2 sts=2 sw=2 aw mp=ruby\ %
au FileType perl setl et ts=4 sw=4 sts=4
au FileType php setl et ts=4 sw=4 sts=4
au FileType jade setl noet ts=2 sw=2 sts=2
au FileType haskell setl et ts=2 sw=2 sts=2
au FileType sh setl et ts=2 sts=2 sw=2
au FileType yaml setl ts=2 sts=2 sw=2 et
au FileType vue setl ts=2 sts=2 sw=2 et
au FileType yml setl ts=2 sts=2 sw=2 et
au FileType haml setl ts=2 sts=2 sw=2 et
au FileType pug setl ts=2 sts=2 sw=2 et
au FileType make setl noet
au FileType tex  setl mp=/usr/local/bin/pdflatex\ %
au FileType st   setl ts=4 sts=4 sw=4 aw mp=gst\ % "noet

lua << EOF
local autosave = require("autosave")

autosave.setup(
    {
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = false,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
)

EOF

let mapleader = "\\"

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

let NERDTreeQuitOnOpen=1

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

:colorscheme molokai

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
"
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>t :tabnew<cr>

nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<cr>

set pastetoggle=<leader>p

" set keymap=vietnamese-vni
