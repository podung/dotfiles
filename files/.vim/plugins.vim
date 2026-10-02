" Plugins via vim-plug — :PlugInstall / :PlugUpdate / :PlugClean

" Install vim-plug itself on first launch
let s:plug_path = expand('~/.vim/autoload/plug.vim')
if empty(glob(s:plug_path))
  silent execute '!curl -fsLo ' . s:plug_path . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Make it pretty
Plug 'w0ng/vim-hybrid'
Plug 'nordtheme/vim', { 'as': 'nord-vim' }

" Git
Plug 'tpope/vim-fugitive'

" General Vim
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'

" Consider if I need this...
Plug 'djoshea/vim-autoread'

" Text Manipulation
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'godlygeek/tabular'

" Javascript
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'

" Also runs `filetype plugin indent on` and `syntax enable`
call plug#end()
