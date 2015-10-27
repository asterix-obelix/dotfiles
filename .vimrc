set nocompatible              " be iMproved, required
set encoding=utf-8
filetype off                  " required
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " True gui colors in terminal

if has('nvim')
    let s:editor_root=expand("~/.nvim")
else
    let s:editor_root=expand("~/.vim")
endif

if has("unix")
    let g:python_host_prog='/usr/bin/python'
endif

" Setting up Vundle - the vim plugin bundler
let vundle_installed=0
let vundle_readme=s:editor_root . '/bundle/Vundle.vim/README.md'
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    " silent execute "! mkdir -p ~/." . s:editor_path_name . "/bundle"
    silent call mkdir(s:editor_root . '/bundle', "p")
    silent execute "!git clone https://github.com/gmarik/vundle " . s:editor_root . "/bundle/Vundle.vim"
    let vundle_installed=1
endif
if has('nvim')
  set rtp+=~/.nvim/bundle/Vundle.vim
else
  set rtp+=~/.vim/bundle/Vundle.vim
endif
" set the runtime path to include Vundle and initialize
call vundle#rc(s:editor_root . '/bundle')

"	call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" core plugins
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

"	additional plugins
Plugin 'tpope/vim-fugitive'
"	Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/vim-easymotion'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'

" non github repos
Plugin 'git://git.wincent.com/command-t.git'

if vundle_installed == 1
    echo "Installing Plugins, please ignore key map error messages"
    echo ""
    :PluginInstall
endif

" All of your Plugins must be added before the following line
"	to be deleted 
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""
"
" SETTINGS & KEYBINDINGS
"
""""""""""""""""""""""""""""""""
set t_Co=256
set mouse=a
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set ruler
set hidden
set ignorecase
set smartcase
set showmatch
set incsearch
set hls
set relativenumber
set ls=2
set cursorline
set nowrap
set backspace=indent,eol,start
set shell=/bin/bash
set completeopt -=preview
set textwidth=100
set wildmenu
set ttyfast
set noshowmode
set cmdheight=1
" set autoread
set number
colorscheme Monokai
syntax on	" syntax highlighting

" airline
let g:airline_powerline_fonts = 1
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif

let g:airline_theme="powerlineish"

let g:airline_detect_modified = 1
let g:airline_theme="dark"
" Required for CtrlSpace integration
let g:airline_exclude_preview = 1
" End CtrlSpace integration
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#branch#empty_message  =  "no .git"

let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb

let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter

let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'z', 'warning' ]
    \ ]

"	syntastic stuff
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"	function key mappings
nnoremap <F3> :NERDTree<CR>
nnoremap <F4> :NERDTreeToggle<CR>
