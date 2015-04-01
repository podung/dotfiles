set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/vundle "set the runtime path to include Vundle and initialize
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Git
Plugin 'tpope/vim-fugitive'

" General Vim
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'jlanzarotta/bufexplorer'

" Consider if I need this...
Plugin 'djoshea/vim-autoread'

" Text Manipulation
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

" Required, plugins available after
call vundle#end()
filetype plugin indent on
