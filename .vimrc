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

" =================== plugins ==================== "
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" other plugins start
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
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


" =================== powerline status ==================== "
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" =================== netrw setup ==================== "
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END
