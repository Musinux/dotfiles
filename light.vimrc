" To make everything work:
" $ sudo apt install git vim-nox shellcheck build-essential cmake
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" $ mkdir -p ~/.vim/colors && wget -O ~/.vim/colors/monokai4.vim https://raw.githubusercontent.com/Musinux/dotfiles/master/.vim/colors/monokai4.vim
" $ mkdir -p ~/.vim/macros && wget -O ~/.vim/macros/matchit.vim https://raw.githubusercontent.com/tmhedberg/matchit/master/plugin/matchit.vim
" $ vim +PluginInstall +qall
" $ cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive && cd -
" $ ~/.vim/bundle/YouCompleteMe/install.py --clang-completer


" Stuff to initialize vundle and pathogen
set exrc
set secure
" execute pathogen#infect()

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " Bundle package
Plugin 'Valloric/YouCompleteMe' " Auto-completion plugin, a must-have
Plugin 'w0rp/ale' " Async Syntax checker (linter, fixer, etc.) 
Plugin 'mileszs/ack.vim' " Tool to use ack or ag as a search engine instead of grep. Far more efficient
Plugin 'vim-airline/vim-airline' " have a nice status bar
Plugin 'vim-airline/vim-airline-themes' " have an even nicer status bar
Plugin 'vim-scripts/colorizer' " if you have color codes (like #EEEFFF) in your code, highlight it with the color)
Plugin 'justinmk/vim-syntax-extra' " better c syntax highlighting
call vundle#end()

filetype indent on
syntax on

" default netrw (file browser) mode is 3 (tree-like print) (to test it, type :e)
let g:netrw_liststyle=3
let g:netrw_banner = 0

" :tabn shortcut => Alt-E (think of Ctrl+E in term that goes to the right)
nmap <silent> <A-e> :tabn<CR>

" Smoother scroll with C-Y and C-D
set scroll=2

" Options to have all indentation formatted the same way: 2 spaces, no tab
set tabstop=2
set expandtab shiftwidth=2 smarttab softtabstop=2
set list
" Tool to highlight tabs characters, because we don't want them
set listchars=tab:>-"
" activate the mouse, but don't start inserting when I click
set mouse=nicr
" fix backspace default behaviour
set backspace=indent,eol,start

" allow for code folding with zi/zM
set foldmethod=syntax
" when I fold, fold everything up to the 20th level
set foldlevelstart=20
set scrolloff=2

let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1

" automatically read a file that was modified outside the editor (and ask user for what to do)
set autoread

" don't show a 20+ props on the first char I type
let g:ycm_min_num_of_chars_for_completion = 3
" auto trigger the YCM suggestions
let g:ycm_auto_trigger = 1

" close YCM window after showing the GetType helper
autocmd CompleteDone * pclose

" %% expands the full dirpath
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'


" Convert the ack package to ag if 'ag - the silver researcher' is available
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case --ignore tags --ignore dist --ignore test'
endif
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack 
" Disable the arrow keys
" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>

" on azerty keyboard, the % char needs to use Shift+ù, so make it work with ù alone
nmap ù %
vmap ù %

" disable Shift^K for js (annoying when mistyping)
au FileType javascript noremap <S-K> <Nop>

" i think that's for neovim (not sure)
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" set of colors I like
set termguicolors
set background=dark
colorscheme monokai4
runtime macros/matchit.vim

highlight Normal guibg=NONE ctermbg=NONE
highlight NonText ctermbg=NONE

" have a normal feeling when opening new windows
set splitbelow
set splitright

" Search for the visually selected text instead of the word in the visual
" selection mode (and *)
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch(cmdtype)
let temp = @s
norm! gv"sy
let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
let @s = temp
endfunction

" disable Help when hitting F1 (really annoying)
map <F1> <Esc>
imap <F1> <Esc>

" Add spaces after comment delimiters by default
let mapleader = "-"
let g:NERDSpaceDelims = 1
let g:NERDTogleCheckAllLines = 1

let g:ale_c_gcc_options = '-Wall'
