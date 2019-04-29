set nocompatible              " be iMproved, required
filetype off                  " required

" =================== general config ====================
set number                                " i like line numbers
set guifont=Operator\ Mono:20             " sets font, not sure if it currently does anything though
syntax on                                 " turn on syntax highlighting

" =================== indentation ====================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set expandtab

nnoremap p p=`]<C-o>                      " auto indent pasted text
nnoremap P P=`]<C-o>                      " auto indent pasted text

" =================== splits ==================== "
" remap jumping between splits
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" =================== tabs ==================== "
" Press Ctrl-Tab to switch between open tabs (like browser tabs) to
" the right side. Ctrl-Shift-Tab goes the other way.
noremap <C-1> :tabn 1<CR>
noremap <C-2> :tabn 2<CR>
noremap <D-3> :tabn 3<CR>
noremap <D-4> :tabn 4<CR>
noremap <D-5> :tabn 5<CR>
noremap <D-6> :tabn 6<CR>
noremap <D-7> :tabn 7<CR>
noremap <D-8> :tabn 8<CR>
noremap <D-9> :tabn 9<CR>

" =================== plugins ==================== "
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" other plugins start
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" other plugins end

" colorschemes
Plugin 'flazz/vim-colorschemes'
Plugin 'KKPMW/distilled-vim'
Plugin 'abnt713/vim-hashpunk'
Plugin 'KKPMW/oldbook-vim'
Plugin 'morhetz/gruvbox'
" colorschemes end

call vundle#end()            " required
filetype plugin indent on    " required

" =================== set colorscheme ==================== "
silent! colorscheme gruvbox              " set colorscheme, but don't complain on first
set background=dark
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_termcolors=256

" =================== cursor changes colors and form on mode change ==================== "
" Enable CursorLine
set cursorline
" Default Colors for CursorLine
highlight  CursorLine ctermbg=darkgray ctermfg=None
" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLine ctermbg=darkgreen ctermfg=Black
" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLine ctermbg=darkgray ctermfg=None
" cursor shapes based on modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" =================== other things ==================== "
let mapleader = ","

" =================== netrw setup ==================== "
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif" let g:netrw_banner = 0
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
nmap <leader>d :NERDTreeToggle<cr>
