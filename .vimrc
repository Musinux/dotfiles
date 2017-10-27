" Stuff to initialize vundle and pathogen
set exrc
set secure
execute pathogen#infect()

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " Bundle package
Plugin 'Valloric/YouCompleteMe' " Auto-completion plugin, a must-have
Plugin 'rdnetto/YCM-Generator' " An auto-completion generator for YCM, for C projects (create appropriate tags)
Plugin 'vim-syntastic/syntastic' " A syntax checker, with default languages. Important for StandardJS
Plugin 'wavded/vim-stylus' " The stylus syntax highlighter (stylus is a CSS preprocessor)
Plugin 'pangloss/vim-javascript' " A better syntax higlighting for javascript
Plugin 'tpope/vim-surround' " bindings to be able to add or remove quotes and stuff aroud text objects
Plugin 'SirVer/ultisnips' " tool to have snippets of code that you can add on the fly
Plugin 'honza/vim-snippets' " utlisnips default snippets
Plugin 'mileszs/ack.vim' " Tool to use ack or ag as a search engine instead of grep. Far more efficient
call vundle#end()

filetype indent on
syntax on
" Options to have all indentation formatted the same way: 2 spaces, no tab
set tabstop=2
set expandtab shiftwidth=2 smarttab
set list
" Tool to highlight tabs characters, because we don't want them
set listchars=tab:>-"
" activate the mouse, but don't start inserting when I click
set mouse=nicr
" search path for ack/ag/grep
set path+=~/pepper/prod_PlatypusServices/**
" fix backspace default behaviour
set backspace=indent,eol,start

" let see vim in the dark
set bg=dark
" allow for code folding with zi/zM
set foldmethod=syntax
" when I fold, fold everything up to the 20th level
set foldlevelstart=20
" activate JSDoc highlighting
let g:javascript_plugin_jsdoc = 1
" I don't remember
let g:ycm_confirm_extra_conf = 0
" Activate the javascript standard linter for syntastic
let g:syntastic_javascript_checkers = ['standard']
" Correction auto
autocmd bufwritepost *.js silent! execute "!standard --fix % > /dev/null 2>&1"
set autoread
" don't show a 20+ props on the first char I type
let g:ycm_min_num_of_chars_for_completion = 2
" auto trigger the YCM suggestions
let g:ycm_auto_trigger = 1

" Use Ctrl+j to expand snippets
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsListSnippets='<c-k>'

" Let ultisnips follow my js conventions
let g:ultisnips_javascript = {
      \ 'keyword-spacing': 'always',
      \ 'semi': 'never',
      \ 'space-before-function-paren': 'always'
      \ }


" show numbers & relative numbering with Ctrl+N
nmap <C-N> :set invrelativenumber invnumber<CR>
" Get the Type of the current highlighted piece of code
nmap <C-F> :YcmCompleter GetType<CR>
" Go to the definition of a function/method
nmap <C-D> :YcmCompleter GoToDefinition<CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" close YCM window after showing the GetType helper
autocmd CompleteDone * pclose

" %% expands the full dirpath
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'


" Convert the ack package to ag if 'ag - the silver researcher' is available
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case --ignore tags --ignore dist --ignore uploads'
endif
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack 
" Disable the arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
