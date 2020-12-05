set noshowmode

set ignorecase
set smartcase

set mouse=a

set hidden

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set autoindent
set smartindent
set shiftround

syntax on

set printoptions+=syntax:y

set showmatch

set undofile

set undodir=~/.vim/undodir
set wrap

filetype plugin indent on
filetype plugin on

set splitright
set splitbelow

set nocompatible

set clipboard=unnamedplus

if !&scrolloff
	set scrolloff=10
endif

if !&sidescrolloff
	set sidescrolloff=5
endif

if has("audocmd")
	au BufReadPost * if line("\") > 0 && line(""\"")
		\| exe "normal! g'\'" | endif
endif

set number

set termguicolors
set noerrorbells

autocmd BufEnter * silent! lcd X:p:h

set nohlsearch

set noshowmatch
set noswapfile
set nobackup
set incsearch

set updatetime=50

set shortmess=c

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'

Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'

Plug 'jiangnao/auto-pairs'

Plug 'sheerun/vim-polyglot'

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'preservim/nerdtree'
Plug 'sbdchd/neoformat'
Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim'

Plug 'mbbill/undotree'


call plug#end()

colorscheme Aura

let g:gitgutter_enabled = 1
let g:gitgutter_grep=''

let NERDTreeQuitOnOpen = 1
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=35

" let g:airline_theme='nord'
" let g:airline_skip_empty_sections = 1
" let g:airline#extensions#tabline#enabled = 1

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

if executable('rg')
    let g:rg_derive_root='true'
endif

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0

let mapleader = " "
let maplocalleader = " "

nnoremap <Leader>v <C-w>s<C-w>j
nnoremap <Leader>h <C-w>v<C-w>l

" set colorcolumn
" highlight ColorColumn ctermbg=0 guibg=#4C544A

noremap <silent> <Tab> :bnext<CR>
noremap <silent> <S-Tab> :bprevious<CR>
noremap <silent> <Space>d :bdelete<CR>
noremap <silent> <Space>D :bw!<CR>
nnoremap <silent> <leader>nn :call NERDComment(0,"toggle")<cr>

nnoremap <silent> <Leader>w :w!<CR>

nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>rg :Rg<CR>
nnoremap <silent> <Leader>on :NERDTree<CR>

tnoremap <silent> <c-f> <c-\><c-n>
nnoremap <silent> <Leader>t :terminal<CR>

nnoremap <silent> <Leader>u :UndotreeShow<CR>:UndotreeFocus<CR>

nnoremap  <silent> <Leader>gs  :Gstatus<cr>
nnoremap  <silent> <Leader>gd  :Git diff<cr>
nnoremap  <silent> <Leader>gc  :Gcommit<cr>
nnoremap  <silent> <Leader>gp  :Gpush<cr>
nnoremap  <silent> <Leader>gP  :Gpull<cr>
nnoremap <silent> <Leader>gC :Commits<CR>
