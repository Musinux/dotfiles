" Stuff to initialize vundle and pathogen
set exrc
set secure
execute pathogen#infect()


set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " Bundle package
Plugin 'w0rp/ale' " Async Syntax checker (linter) 
Plugin 'neoclide/coc.nvim'
Plugin 'neoclide/coc-tsserver'
Plugin 'wavded/vim-stylus' " The stylus syntax highlighter (stylus is a CSS preprocessor)
Plugin 'pangloss/vim-javascript' " A better syntax higlighting for javascript
Plugin 'tpope/vim-surround' " bindings to be able to add or remove quotes and stuff aroud text objects
Plugin 'tpope/vim-fugitive' " git
"Plugin 'SirVer/ultisnips' " tool to have snippets of code that you can add on the fly
"Plugin 'honza/vim-snippets' " utlisnips default snippets
Plugin 'mileszs/ack.vim' " Tool to use ack or ag as a search engine instead of grep. Far more efficient
Plugin 'musinux/coverage.vim' " Manage test coverage reports
Plugin 'othree/html5.vim' " better indent css/js in html
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/colorizer'
Plugin 'wincent/command-t' " Efficient file explorer
Plugin 'mbbill/undotree'
Plugin 'tmhedberg/SimpylFold' " folding for python
Plugin 'scrooloose/nerdcommenter' " easy comments
Plugin 'JulesWang/css.vim'
Plugin 'justinmk/vim-syntax-extra' " better c syntax highlighting
Plugin 'altercation/vim-colors-solarized'
Plugin 'editorconfig/editorconfig-vim' " Support .editorconfig files
Plugin 'lbrayner/vim-rzip' " Read into zip files
call vundle#end()

filetype indent on
syntax on


" easy swap two characters
:nnoremap <silent> gc xph

" auto indent on MacOS ...
" :nnoremap -- ==
" :vnoremap -- ==

" remap exit terminal insert mode for macos
" tnoremap <Esc><Esc> <C-\><C-n>
" remap new terminal tab
command! TT tabe <bar> term

" default netrw (file browser) mode is 3 (tree-like print)
let g:netrw_liststyle=3
let g:netrw_banner = 0

nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" file explorer (CommandT)
nmap <silent> <A-t> <Plug>(CommandT)
nmap <silent> <A-b> <Plug>(CommandTBuffer)
nmap <silent> <A-j> <Plug>(CommandTJump)
let g:CommandTWildIgnore=&wildignore . ",*/node_modules,*/coverage"

" :tabn shortcut => Alt-E (think of Ctrl+E in term that goes to the right)
nmap <silent> <A-e> :tabn<CR>
nmap <silent> <A-z> :tabp<CR>

" when typing comments, automatically break lines after 100 chars
" set textwidth=100

" Smoother scroll with C-Y and C-D
set scroll=2

" Options to have all indentation formatted the same way: tab on 2 spaces
" tabs to spaces > replaced by .editorconfig
" set expandtab
" set tabstop=2
" set shiftwidth=2  softtabstop=2
set smarttab

set list
" Tool to highlight tabs characters
set listchars=tab:>-"

set nolist
" activate the mouse, but don't start inserting when I click
set mouse=nicr
" fix backspace default behaviour
set backspace=indent,eol,start

" allow for code folding with zi/zM
set foldmethod=syntax
" when I fold, fold everything up to the 20th level
set foldlevelstart=20
set scrolloff=2

"""" JS stuff

" activate JSDoc highlighting
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_apidoc = 1
let g:ale_linters = {'javascript': ['prettier', 'eslint'], 'sh': ['shellcheck']}
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_fix_on_save = 1
let g:ale_javascript_eslint_options = "--debug"
let g:ale_linter_aliases = {'vue': ['html', 'css', 'scss', 'stylus', 'javascript']}
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#encoding#enabled = 0
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_powerline_fonts = 1
let g:airline_section_x = ''

let g:ale_sign_column_always = 1

"" vue js
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html

" Correction auto shortcut: AltGr+Maj+s
" nnoremap „ :silent! execute "!eslint --fix % > /dev/null 2>&1"<CR>
" autocmd bufwritepost *.js 
set autoread

"" Path for test-coverage file to read
let g:coverage_json_project_path = "~/projects/"
" let g:coverage_json_report_path = "coverage/coverage-final.json"
let g:coverage_json_report_pathes = ["coverage/coverage-final.json"]
let g:coverage_sign_uncovered = '😢'
let g:coverage_show_covered = 0
let g:coverage_show_uncovered = 1

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
nmap <C-N> :set invnumber<CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" %% expands the full dirpath
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'


" Convert the ack package to ag if 'ag - the silver researcher' is available
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case --ignore node_modules --ignore tags --ignore doc --ignore dist --ignore yarn.lock'
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

inoremap jk <Esc>
nmap ù %
vmap ù %

" disable Shift^K for js
" au FileType javascript noremap <S-K> <Nop>

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set termguicolors
set background=dark
colorscheme monokai4 "afterglow  solarized8
runtime macros/matchit.vim

highlight Normal guibg=NONE ctermbg=NONE
highlight NonText ctermbg=NONE
set splitbelow
set splitright

" Caps lock is now the ^2 key instead of CAPS LOCK (next to the 1)
"set imsearch=-1
" set keymap=insert-only_capslock
"set iminsert=0
"noremap  ² :let &l:imi = !&l:imi<CR>
"inoremap ² <C-O>:let &l:imi = !&l:imi<CR>
"cnoremap ² <C-^>


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

" disable Help when hitting F1
map <F1> <Esc>
imap <F1> <Esc>

" Add spaces after comment delimiters by default
let mapleader = "-"
let g:NERDSpaceDelims = 1
let g:NERDTogleCheckAllLines = 1

" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction('runCommand', 'jest.init')

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


"""" <This part is for yarn pnp>

" Decode URI encoded characters
function! DecodeURI(uri)
    return substitute(a:uri, '%\([a-fA-F0-9][a-fA-F0-9]\)', '\=nr2char("0x" . submatch(1))', "g")
endfunction

" Attempt to clear non-focused buffers with matching name
function! ClearDuplicateBuffers(uri)
    " if our filename has URI encoded characters
    if DecodeURI(a:uri) !=# a:uri
        " wipeout buffer with URI decoded name - can print error if buffer in focus
        sil! exe "bwipeout " . fnameescape(DecodeURI(a:uri))
        " change the name of the current buffer to the URI decoded name
        exe "keepalt file " . fnameescape(DecodeURI(a:uri))
        " ensure we don't have any open buffer matching non-URI decoded name
        sil! exe "bwipeout " . fnameescape(a:uri)
    endif
endfunction

function! RzipOverride()
    " Disable vim-rzip's autocommands
    autocmd! zip BufReadCmd   zipfile:*,zipfile:*/*
    exe "au! zip BufReadCmd ".g:zipPlugin_ext

    " order is important here, setup name of new buffer correctly then fallback to vim-rzip's handling
    autocmd zip BufReadCmd   zipfile:*  call ClearDuplicateBuffers(expand("<amatch>"))
    autocmd zip BufReadCmd   zipfile:*  call rzip#Read(DecodeURI(expand("<amatch>")), 1)

    if has("unix")
        autocmd zip BufReadCmd   zipfile:*/*  call ClearDuplicateBuffers(expand("<amatch>"))
        autocmd zip BufReadCmd   zipfile:*/*  call rzip#Read(DecodeURI(expand("<amatch>")), 1)
    endif

    exe "au zip BufReadCmd ".g:zipPlugin_ext."  call rzip#Browse(DecodeURI(expand('<amatch>')))"
endfunction

autocmd VimEnter * call RzipOverride()

"""" </This part is for yarn pnp>
