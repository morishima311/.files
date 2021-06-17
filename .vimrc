"rmkm/dotfiles

set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd

autocmd ColorScheme * highlight Normal ctermbg=236
syntax on
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark
set t_Co=256
colorscheme molokai

" Show row number
set number
set cursorline
set virtualedit=onemore
set smartindent
set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest
nnoremap j gj
nnoremap k gk

set list listchars=tab:\▸\-
set expandtab
set tabstop=4
set shiftwidth=4

set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
set backspace=indent,eol,start
