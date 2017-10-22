set exrc
set secure
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
Plugin 'tpope/vim-surround'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tomtom/tcomment_vim'
Plugin 'mileszs/ack.vim'
call vundle#end()

filetype indent on
syntax on
set tabstop=2
set mouse=a
set path+=~/pepper/prod_PlatypusServices/**
set backspace=indent,eol,start
set expandtab shiftwidth=2 smarttab
set list
set listchars=tab:>-"
set bg=dark
set foldmethod=syntax
set foldlevelstart=20
set hls
let g:javascript_plugin_jsdoc = 1
let g:ycm_confirm_extra_conf = 0
let g:syntastic_javascript_checkers = ['standard']
" Correction auto
autocmd bufwritepost *.js silent! execute "!standard --fix % > /dev/null 2>&1"
set autoread
let g:ycm_min_num_of_chars_for_completion = 0
let g:ycm_auto_trigger = 1

let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsListSnippets='<c-k>'

let g:ultisnips_javascript = {
      \ 'keyword-spacing': 'always',
      \ 'semi': 'never',
      \ 'space-before-function-paren': 'always'
      \ }


nmap <C-N> :set invrelativenumber invnumber<CR>
nmap <C-F> :YcmCompleter GetType<CR>
nmap <C-D> :YcmCompleter GoToDefinition<CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

autocmd CompleteDone * pclose

" %% expands the full dirpath
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case --ignore tags --ignore dist --ignore uploads'
endif
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
