set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/vundle "set the runtime path to include Vundle and initialize
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Make it pretty
Plugin 'w0ng/vim-hybrid'
Plugin 'arcticicestudio/nord-vim'

" Git
Plugin 'tpope/vim-fugitive'

" General Vim
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'

" Consider if I need this...
Plugin 'djoshea/vim-autoread'

" Text Manipulation
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

" Ruby
Plugin 'tpope/vim-endwise'

" Elixir
Plugin 'tpope/vim-dispatch'      " optional - async tasks
Plugin 'elixir-lang/vim-elixir'  " optional
Plugin 'tpope/vim-projectionist' " required
Plugin 'avdgaag/vim-phoenix'

" Required, plugins available after
call vundle#end()
filetype plugin indent on

" Javascript
Plugin 'leafgarland/typescript-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'peitalin/vim-jsx-typescript'
