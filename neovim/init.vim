set number
set relativenumber
set termguicolors
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
set nohlsearch
set smarttab

set foldmethod=indent
set foldlevel=4

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'seblj/nvim-tabline'
Plug 'https://github.com/Yggdroot/indentLine'

Plug 'maxboisvert/vim-simple-complete'
Plug 'lepture/vim-jinja'
Plug 'https://github.com/solyarisoftware/nera.vim'
Plug 'joanrivera/vim-highlight'

Plug 'https://github.com/tpope/vim-fugitive'
Plug 'pocco81/auto-save.nvim'

Plug 'ahmedkhalf/project.nvim'
Plug 'chrisbra/unicode.vim'

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
au FileType yml setl ts=2 sts=2 sw=2 et
au FileType yaml setl ts=2 sts=2 sw=2 et
au FileType haml setl ts=2 sts=2 sw=2 et
au FileType pug setl ts=2 sts=2 sw=2 et
au FileType make setl noet
au FileType tex  setl mp=/usr/local/bin/pdflatex\ %
au FileType st   setl ts=4 sts=4 sw=4 aw mp=gst\ % "noet

lua << EOF
require("auto-save").setup({
  enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
  execution_message = {
    message = function() -- message to print on save
      return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
    end,
    dim = 0.18, -- dim the color of `message`
    cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
  },
  trigger_events = {"InsertLeave", "TextChanged"}, -- vim events that trigger auto-save. See :h events
  -- function that determines whether to save the current buffer or not
  -- return true: if buffer is ok to be saved
  -- return false: if it's not ok to be saved
  condition = function(buf)
    local fn = vim.fn
    local utils = require("auto-save.utils.data")

    if
      fn.getbufvar(buf, "&modifiable") == 1 and
      utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
      return true -- met condition(s), can save
    end
    return false -- can't save
  end,
  write_all_buffers = false, -- write all buffers when the current one meets `condition`
  debounce_delay = 135, -- saves the file at most every `debounce_delay` milliseconds
  callbacks = { -- functions to be executed at different intervals
    enabling = nil, -- ran when enabling auto-save
    disabling = nil, -- ran when disabling auto-save
    before_asserting_save = nil, -- ran before checking `condition`
    before_saving = nil, -- ran before doing the actual save
    after_saving = nil -- ran after doing the actual save
  }
})

require('tabline').setup({
    no_name = '[No Name]',    -- Name for buffers with no name
    modified_icon = '',      -- Icon for showing modified buffer
    close_icon = '',         -- Icon for closing tab with mouse
    separator = "▌",          -- Separator icon on the left side
    padding = 3,              -- Prefix and suffix space
    color_all_icons = false,  -- Color devicons in active and inactive tabs
    right_separator = false,  -- Show right separator on the last tab
    show_index = true,       -- Shows the index of tab before filename
    show_icon = false,         -- Shows the devicon
})

require("project_nvim").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}

EOF

let mapleader = "\\"

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

let NERDTreeQuitOnOpen=1

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

nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

map <Enter> o<ESC>
map <S-Enter> O<ESC>

set pastetoggle=<leader>p

" Set key-mapping for dealing with two alphabetical registers easily
vnoremap <Leader>a "ay
vnoremap <Leader>A "Ay
nnoremap <Leader>a "ap
 
vnoremap <Leader>x "xy
vnoremap <Leader>X "Xy
nnoremap <Leader>x "xp


" Move lines
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

"Navigating in insert mode
inoremap <M-t> <C-o>t
inoremap <M-f> <C-o>f
inoremap <M-d> <C-o>d


"Inserting in insert mode
inoremap <M-o> <C-o>o

" Big QUIT
inoremap <M-q> <Esc>:wq<CR>

