set nocompatible                  " Must come first because it changes other options.

if filereadable(expand("$HOME/.vim/vundles.vim"))
  source $HOME/.vim/vundles.vim
endif

set visualbell                                 " No beeping.
set history=1000                               " Store a lot of history
set number                                     " Turn on line numbers
set tabstop=2                                  " Global tab width.
set shiftwidth=2                               " And again, related.
set expandtab                                  " Use spaces instead of tabs
set smarttab                                   " sw at start of line, sts everywhere else
set autoread                                   " Reload files changed outside vim
set autoindent
set backspace=2                                " make backspace work like most other apps
set directory=/tmp//
set backupdir=/tmp//
set laststatus=2                               " Show the status line all the time

set secure                                     " disable unsafe commands in local .vimrc files

syntax on                                      " Enable syntax highlighting
filetype on                                    " Enable filetype detection
filetype indent on                             " Enable filetype-specific indenting
filetype plugin on                             " Enable filetype-specific plugins
compiler ruby                                  " Enable compiler support for ruby

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch        "Find the next match as we type the search
set hlsearch         "Highlight searches by default

" When you’re pressing Escape to leave insert mode in the terminal, it will by
" default take a second or another keystroke to leave insert mode completely
" and update the statusline. This fixes that. I got this from:
" https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
if !has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

autocmd BufWritePre * :%s/\s\+$//e     " auto remove trailing whitespace

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Leader """""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

" NERDTree """""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>n :NERDTreeToggle<CR>
