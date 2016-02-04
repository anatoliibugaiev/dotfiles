syntax on
set nocompatible              " be iMproved, required
filetype off                  " required
set mouse=a


let mapleader = ","

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'othree/xml.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'majutsushi/tagbar'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ternjs/tern_for_vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tyok/nerdtree-ack'
Plugin 'mileszs/ack.vim'
Plugin 'ervandew/screen'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
"Plugin 'neilagabriel/vim-geeknote'
"Plugin 'vim-scripts/AutoComplPop'
"Plugin 'yegappan/mru'
"Plugin 'Raimondi/delimitMate'
"Plugin 'L9'
"Plugin 'FuzzyFinder'
"Plugin 'xolox/vim-easytags'
"Plugin 'xolox/vim-misc'
" The following are examples of different formats supported.
call vundle#end()            " required
filetype plugin indent on    " required
"set omnifunc=syntaxcomplete#Complete

set t_Co=256
"set background=dark

nmap <leader>n :NERDTreeToggle<CR>
nmap <F2> :TernDef<CR>
nmap <F3> :TernRefs<CR>
nmap <F8> :TagbarToggle<CR>

nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==

inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi

vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

nnoremap d "_d
vnoremap d "_d
nnoremap <leader>c i<CR><esc>
filetype plugin on

"autocmd VimEnter * NERDTree

let g:tern_map_keys=1

set tabstop=4 shiftwidth=4 expandtab softtabstop=4
set shiftround
set hidden
set number
set autoindent
set smartindent
set clipboard=unnamed
set noswapfile
set backspace=indent,eol,start

set fileencodings=utf-8,cp1251
" Always add lf in the end of file
set fileformat=unix
" Enhance command-line completion
" Only available when compiled with the +wildmenu feature
set wildmenu
" Set completion mode
" When more than one match, list all matches and complete first match
" Then complete the next full match
set wildmode=list:longest,full
" Ignore following files when completing file/directory names
" Version control
set wildignore+=.hg,.git,.svn
" OS X
set wildignore+=*.DS_Store
" Python byte code
set wildignore+=*.pyc
" Binary images
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg

" Splitting a window will put the new window below the current one
" See :sp
" Only available when compiled with the +windows feature
set splitbelow
" Splitting a window will put the new window right of the current one
" See :vsp
" Only available when compiled with the +vertsplit feature
set splitright
" Don't show the intro message starting Vim
set shortmess+=I
" No beeps, no flashes
set visualbell
set t_vb=

    " < >
        vnoremap < <gv
        vnoremap > >gv

        nnoremap <tab> >>
        nnoremap <s-tab> <<
        vnoremap <tab> >>
        vnoremap <s-tab> <<
    
    " <Esc><Esc>
        " Clear the search highlight in Normal mode
        nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

    " ,p
        " Toggle the 'paste' option
        set pastetoggle=<Leader>p


    " ,a
        " Fast grep
        " Recursive search in current directory for matches with current word
        nnoremap <Leader>a :<C-u>execute "Ack " . expand("<cword>") <Bar> cw<CR>
	
	" ,h
        " Shortcut for :%s//
        nnoremap <leader>h :<C-u>%s//<left>
        vnoremap <leader>h :s//<left>

 
	" Switch splits
        nnoremap <C-h> <C-W>h
        nnoremap <C-j> <C-W>j
        nnoremap <C-k> <C-W>k
        nnoremap <C-l> <C-W>l

     " n и N
        " Search matches are always in center
        nnoremap n nzz
        nnoremap N Nzz
        nnoremap * *zz
        nnoremap # #zz
        nnoremap g* g*zz
        nnoremap g# g#zz

    " Navigate through wrapped lines
        noremap j gj
        noremap k gk

    " ,bl
        " Show buffers
        nnoremap <Leader>bl :<C-u>ls<cr>:b

    " ,bp
        " Go to prev buffer
        nnoremap <Leader>bp :<C-u>bp<cr>

    " ,bn
        " Go to next buffer
        nnoremap <Leader>bn :<C-u>bn<cr>

    " ,w
        " Jump to next split
        nnoremap <Leader>w <C-w>w

	" Bind :Q to :q
        command! Q q

" Folding
    " za = toggle current fold
    " zR = open all folds
    " zM = close all folds
    " From https://github.com/sjl/dotfiles/blob/master/vim/.vimrc
    function! MyFoldText()
        let line = getline(v:foldstart)
        let nucolwidth = &fdc + &number * &numberwidth
        let windowwidth = winwidth(0) - nucolwidth - 3
        let foldedlinecount = v:foldend - v:foldstart
        " expand tabs into spaces
        let onetab = strpart(' ', 0, &tabstop)
        let line = substitute(line, '\t', onetab, 'g')
        let line = strpart(line, 0, windowwidth - 2 - len(foldedlinecount))
        let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
        return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
    endfunction
    set foldtext=MyFoldText()
    " Lines with equal indent form a fold
    set foldmethod=indent
    " Maximum nesting of folds
    " Only available when compiled with the +folding feature
    set foldnestmax=10
    " All folds are open
    " Only available when compiled with the +folding feature
    set nofoldenable
    " Folds with a higher level will be closed
    " Only available when compiled with the +folding feature
    set foldlevel=1
    " Remove the extrafills --------
    " Only available when compiled with the +windows and +folding features
    set fillchars="fold: "

" Search
    " While typing a search command, show pattern matches as it is typed
    " Only available when compiled with the +extra_search feature
    set incsearch
    " When there is a previous search pattern, highlight all its matches
    " Only available when compiled with the +extra_search feature
    set hlsearch
    " Ignore case in search patterns
    set ignorecase
    " Override the 'ignorecase' if the search pattern contains upper case characters
    set smartcase
    " All matches in a line are substituted instead of one
    set gdefault
:autocmd InsertEnter,InsertLeave * set cul!


" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif


set timeout timeoutlen=1000 ttimeoutlen=100


autocmd QuickFixCmdPost *grep* cwindow


" Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

set completeopt=longest,menuone
cnoreabbrev W w
