set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" code-completion
Plugin 'Valloric/YouCompleteMe'
" automatic closing brackets
Plugin 'Raimondi/delimitMate'
" colorscheme
Plugin 'tomasr/molokai'
" make commenting in/out easier
Plugin 'scrooloose/NERDCommenter'
" navigate files
Plugin 'scrooloose/nerdtree' 
" error checking
Plugin 'scrooloose/syntastic'
" add end to if/else/etc in Ruby
Plugin 'tpope/vim-endwise'
" git wrapper
Plugin 'tpope/vim-fugitive'
" indent guides
Plugin 'nathanaelkane/vim-indent-guides'
" make vim handle rails
Plugin 'tpope/vim-rails'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"General Options
syntax on
set wildmenu
set showcmd
set hlsearch
set visualbell
set confirm 
set number
"autocmd BufWritePre * :normal mqgg=G`qzz
"Colorscheme
colorscheme molokai
" Use one of the following to define the camel characters.
" Stop on capital letters.
"let g:camelchar = A-Z
" Also stop on numbers.
"let g:camelchar = A-Z0-9
" Include '.' for class member, ',' for separator, ';' end-statement,
" and <[< bracket starts and "'` quotes.
let g:camelchar = "A-Z0-9.,;:{([`'\""
nnoremap <silent><C-h> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-l> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-h> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-l> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
vnoremap <silent><C-h> :<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>v`>o
vnoremap <silent><C-l> <Esc>`>:<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>v`<o

"Move lines
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi

vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

"Pasting
nnoremap <C-t> :set invpaste paste?<CR>
set pastetoggle=<C-t>
set showmode

"Tab spaces
set ts=2 sts=2 sw=2 "et 
au FileType python set ts=2 sts=2 sw=2 "et
"
"NerdTree shortcur
map <C-o> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let g:NERDTreeWinPos = "right"

"Indent Guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
"let g:indent_guides_auto_colors=0
"hi IndentGuidesOdd  ctermbg=white
"hi IndentGuidesEven ctermbg=lightgrey

"Syntastic
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_scss_checkers=[''] "http://stackoverflow.com/questions/29041876/fixing-syntasticcheck-bootstrap-error-vim-syntastic-plugin
"let g:syntastic_ruby_checker_args = '--ignore=E225'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
