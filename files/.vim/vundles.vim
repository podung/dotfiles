set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/vundle "set the runtime path to include Vundle and initialize
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" General Vim
Plugin 'scrooloose/nerdtree'

" Required, plugins available after
call vundle#end()
filetype plugin indent on
