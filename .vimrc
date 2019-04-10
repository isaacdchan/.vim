set nocompatible              "be iMproved, required
filetype off                  "required

set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')
"--------------PLUGIN BEGIN--------------
Plugin 'VundleVim/Vundle.vim'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Remove Unnecesary Folds
Plugin 'tmhedberg/SimpylFold'
"Auto Indent
Plugin 'vim-scripts/indentpython.vim'
"Auto-Complete
Bundle 'Valloric/YouCompleteMe'
"Check Syntax with Each Save
Plugin 'vim-syntastic/syntastic'
"PEP 8 Checking
Plugin 'nvie/vim-flake8'
"File Browsing
Plugin 'scrooloose/nerdtree'
"Tabs
Plugin 'jistr/vim-nerdtree-tabs'
"VIM Search
Plugin 'kien/ctrlp.vim'
"Git Integration
Plugin 'tpope/vim-fugitive'
"Comment Functions
Plugin 'scrooloose/nerdcommenter'
"Gruvbox
Plugin 'morhetz/gruvbox'


"---------------PLUGIN END---------------
call vundle#end()
filetype plugin indent on

"Color Schemes
set termguicolors
if !has("gui_running")
	set term=xterm
	set t_Co=256
	let &t_AB="\e[48;5;%dm"
	let &t_AF="\e[38;5;%dm"
	
	colorscheme gruvbox
	let g:gruvbox_contrast_light = 'hard'
	set background=dark
	"set background=light
endif


"Backspace 
inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>

"Enable Mouse Scroll
if !has("gui_running")
	set term=xterm
	set mouse=a
endif

"Split navigations remapping
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L> 
nnoremap <C-H> <C-W><C-H>

"Enable folding + folding with spacebar 
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"docstrings for folded code
let g:SimpylFold_docstring_preview=1

"PEP8 Indentation
au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |    
	\ set fileformat=unix |

"Flag Unnecessary Whitespace
:highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"Default UTF-8 Char
set encoding=utf-8

"Use non-experimental clangd for Autocomplete
let g:ycm_use_clangd = 0

"Syntax Highlighting/Line Numbering
syntax on
set nu
set relativenumber

"Backspace to previous line
set backspace=indent,eol,start

"Pretty Code
let python_highlight_all=1

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

"System Clipboard
set clipboard=unnamed

"Remap colon to semicolon in norman and visual mode, but not in insert mode
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
