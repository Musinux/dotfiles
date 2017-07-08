set exrc
set secure
colorscheme darkblue
execute pathogen#infect()

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'vim-syntastic/syntastic'
Plugin 'wavded/vim-stylus'
Plugin 'pangloss/vim-javascript'
call vundle#end()

filetype indent on
syntax on
set tabstop=2
set expandtab shiftwidth=2 smarttab
set list
set listchars=tab:>-"
set bg=dark
let g:javascript_plugin_jsdoc = 1
let g:ycm_confirm_extra_conf = 0
let g:syntastic_javascript_checkers = ['standard']
autocmd CompleteDone * pclose
