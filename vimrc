"
"   .vimrc
"       Stewart Park <hello@stewartjpark.com>
"

syntax on
set nocompatible
set fileformat=unix
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr
set mouse=a
set number

set backspace=indent,eol,start

" Default tab setup
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab

"File-type-specific tab setup
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType jade setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType make setlocal noexpandtab

" Delete all trailing whitespaces before saving.
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.json :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.css :%s/\s\+$//e
autocmd BufWritePre *.c :%s/\s\+$//e
autocmd BufWritePre *.cc :%s/\s\+$//e

" Vundle setup
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Bundle 'gmarik/vundle'

" Better status line
Bundle 'bling/vim-airline'

" Git integration
Bundle 'airblade/vim-gitgutter'

" Python virtualenv integration
Bundle 'jmcantrell/vim-virtualenv'

" Bufferline
Bundle 'bling/vim-bufferline'

" Syntax checking
Bundle 'scrooloose/syntastic'

" Auto completion
Bundle 'Valloric/YouCompleteMe'

" Various color schemes
Bundle 'flazz/vim-colorschemes'

" Various syntaxes
Plugin 'kchmck/vim-coffee-script'

" Fuzzy finder
Plugin 'ctrlpvim/ctrlp.vim'

" Git
Plugin 'tpope/vim-fugitive'

" Surrounding
Plugin 'tpope/vim-surround'

" Semantic highlighting
Plugin 'jaxbot/semantic-highlight.vim'

" Whitespace highlighting
Plugin 'ntpeters/vim-better-whitespace'

" Python import sort
Plugin 'fisadev/vim-isort'

" Unite.vim
Plugin 'Shougo/unite.vim'

" VimFiler
Plugin 'Shougo/vimfiler.vim'

" Vimproc
Plugin 'Shougo/vimproc.vim'

" VimShell
Plugin 'Shougo/vimshell.vim'

" Don't delete the lines below.
call vundle#end()
filetype plugin indent on


" GUI setup
try
    color Chasing_Logic
catch
    color default
endtry
let &t_Co=256

" For vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" VimFiler shortcut
command Tree :VimFilerExplorer

" Font setup
if has("gui_running")
  if has("gui_gtk2")
      set guifont=Roboto\ Mono\ 13
  elseif has("gui_macvim")
      set guifont=Roboto\ Mono:h13
  elseif has("gui_win32")
      set guifont=Roboto\ Mono:h13:cANSI
  endif
endif

" If there's ag,
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

" Tab key-binding
map <D-S-]> gt
map <D-S-[> gT
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>

" Whitespace color
highlight ExtraWhitespace ctermbg=red

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
