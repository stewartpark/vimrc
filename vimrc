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

" Neovim: Python support
" Find the global python and use it
let g:python_host_prog=system('PATH=/usr/local/bin:/usr/bin:/bin which python')

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

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Git integration
Plugin 'airblade/vim-gitgutter'

" Python virtualenv integration
Plugin 'jmcantrell/vim-virtualenv'

" Bufferline
Plugin 'bling/vim-bufferline'

" Syntax checking
Plugin 'scrooloose/syntastic'

" Auto completion
Plugin 'Valloric/YouCompleteMe'

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

" Python better syntax
Plugin 'hdima/python-syntax'

" Autotag
Plugin 'craigemery/vim-autotag'

" Speeddating
Plugin 'tpope/vim-speeddating'

" Org mode
Plugin 'jceb/vim-orgmode'

" Elm syntax
Plugin 'lambdatoast/elm.vim'

" Ack
Plugin 'mileszs/ack.vim'

" Gruvbox theme
Plugin 'morhetz/gruvbox'

" Don't delete the lines below.
call vundle#end()
filetype plugin indent on


" GUI setup
try
    set background=dark
    color gruvbox
catch
    color default
endtry

" For Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set laststatus=2
if !has('gui_running')
  set t_Co=256
endif

" VimFiler shortcut
command Tree :VimFilerExplorer

" VimFiler setup
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_tree_opened_icon = "▽"
let g:vimfiler_tree_closed_icon = "▶"
let g:vimfiler_tree_leaf_icon = "⋮"

autocmd FileType vimfiler call s:vimfiler_settings()

function! s:vimfiler_settings()
    nunmap <buffer> <C-l>
    nunmap <buffer> <C-j>
    nnoremap <buffer> <C-r> <Plug>(vimfiler_redraw_screen)
    nmap <buffer> ' <Plug>(vimfiler_toggle_mark_current_line)
    nmap <buffer> <C-q> <Plug>(vimfiler_quick_look)
    nmap <buffer> <C-s> <Plug>(vimfiler_switch_to_history_directory)
    set nonumber
endfunction

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

" CtrlP setup
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['tag', 'line']
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

" Ack setup
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
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

" Length color
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
