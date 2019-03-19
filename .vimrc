set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')
" --------------PLUGIN BEGIN--------------

Plugin 'VundleVim/Vundle.vim'
" Plugin formats supported:
" 	- GitHub repo
" 	- http://vim-scripts.org/vim/scripts.html
" 	- Git plugin not on GitHub
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'file:///home/gmarik/path/to/plugin'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Remove Unnecesary Folds
Plugin 'tmhedberg/SimpylFold'
" Auto Indent
Plugin 'vim-scripts/indentpython.vim'
" Auto-Complete
Bundle 'Valloric/YouCompleteMe'


" ---------------PLUGIN END---------------
call vundle#end()
filetype plugin indent on

" Split navigations 
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L> 
nnoremap <C-H> <C-W><C-H>

" Enable folding + folding with spacebar 
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" docstrings for folded code
let g:SimpylFold_docstring_preview=1

" PEP8 Indentation
au BufNewFile,BufRead *.py
	\ set tabstop=4
	\ set softtabstop=4
	\ set shiftwidth=4
	\ set textwidth=79
	\ set expandtab
	\ set autoindent     
	\ set fileformat=unix

" Flag Unnecessary Whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Default UTF-8 Characters
set encoding=utf-8
