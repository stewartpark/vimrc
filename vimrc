"
"   .vimrc 
"       Stewart Park <stewartpark92@gmail.com>
"

syntax on
set nocompatible
set fileformat=unix
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr
set mouse=a


" Default tab setup
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab

"File-type-specific tab setup
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType jade setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType make setlocal noexpandtab

" Vundle setup
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/vundle'

" Better status line
Bundle 'bling/vim-airline'

" Git integration
Bundle 'airblade/vim-gitgutter'

" NERD Tree
Bundle 'scrooloose/nerdtree.git'

" Python virtualenv integration
Bundle 'jmcantrell/vim-virtualenv'

" Bufferline
Bundle 'bling/vim-bufferline'

" Syntax checking
Bundle 'scrooloose/syntastic'

" Various color schemes
Bundle 'flazz/vim-colorschemes'

" Don't delete the lines below.
call vundle#end()
filetype plugin indent on


" GUI setup
set guifont=Source\ Code\ Pro:h15
try
    color Monokai
catch 
    color default
endtry
let &t_Co=256

" For vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" NERDTree shortcut
command Tree :NERDTree
