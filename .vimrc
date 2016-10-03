"Install plugins with VimPlug
call plug#begin('~/.vim/plugged') 
Plug 'christoomey/vim-tmux-navigator'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'groenewege/vim-less'
Plug 'edkolev/tmuxline.vim'
Plug 'flazz/vim-colorschemes'
" Markdown extensions
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'kchmck/vim-coffee-script'
Plug 'ctrlpvim/ctrlp.vim'
" HTML Handlebars support
Plug 'mustache/vim-mustache-handlebars'
Plug 'neomake/neomake'
Plug 'pangloss/vim-javascript'
Plug 'StanAngeloff/php.vim'
Plug 'rust-lang/rust.vim'
Plug 'mxw/vim-jsx'
Plug 'freitass/todo.txt-vim'
call plug#end()

" Activate relative line numbers on the left + absolut number for current line
set number
set relativenumber

" Use spaces instead of TABs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Put backup, swap and undo files in global seperate directory
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//

" Highlight search + case insensitive search
set ic is hls

" Add airline at all times
set laststatus=2
" Enable smarter tab line
let g:airline#extensions#tabline#enabled = 1
" Add theme to airline
let g:airline_theme='sol'

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
set t_Co=256
set hlsearch
syntax on

" Set color column on .js .html and .less files 
" to help restrict length of line
autocmd FileType javascript,html,less,coffee setlocal colorcolumn=100

" Activate folding for coffee script files
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

" associate *.lessimport with less filetype
au BufRead,BufNewFile *.lessimport set filetype=less

" On Markdown file: Enable TOC to autofit
let g:vim_markdown_toc_autofit = 1

" Neomake config
autocmd! BufWritePost,BufEnter * Neomake


"##################################################################################

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2014 Feb 05
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
