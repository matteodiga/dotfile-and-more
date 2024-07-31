""""""""""""""""""""""
" NVIM config file
"
" ~ Matteo Di Gaetano
"   https://github.com/matteodiga
""""""""""""""""""""""
"
" Content
" - GENERAL
" - PLUGINS
" - THEME
" - MAP/REMAP
"
"
" This file needs to be stored as ~/.config/nvim/init.vim


" -----------------------------------------------------------------------------
" ### GENERAL -----------------------------------------------------------------
" -----------------------------------------------------------------------------

set nocompatible            " disable compatibility to old-time vi
set number                  " add line numbers
set showmatch               " show matching
set ignorecase              " case insensitive
set hlsearch                " highlight search
set smartcase               " smartcase search
set incsearch               " incremental search
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
set ttyfast                 " Speed up scrolling
set history=5000            " command history
set tags=tags;/             " look for tags in up folder dir till '/'
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set shiftwidth=4            " width for autoindents
set expandtab               " converts tabs to white space
set autoindent              " indent a new line the same amount as the line just typed
set directory=$HOME/.local/share/nvim/swap//     " set swap folder
set backupdir=$HOME/.local/share/nvim/backup//   " set backup folder
set backup                  " enable backup
silent !mkdir -p $HOME/.local/share/nvim/backup/

" -----------------------------------------------------------------------------
" ### PLUGINS -----------------------------------------------------------------
" -----------------------------------------------------------------------------
"
" vim-plug -> https://github.com/junegunn/vim-plug
"
" Follow instruction to install vim-plug on github repo, then use command
" 'PlugInstall' to install listed plugin.
"
" The plugin directory for neovim is:
"   - Neovim: '~/.local/share/nvim/site/autoload/plug.vim'
"
"   You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')` (avoid using standard Vim directory names like 'plugin')

call plug#begin()

Plug 'https://github.com/preservim/nerdtree.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dominikduda/vim_current_word'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" plugin options

" disable coc startup warning
let g:coc_disable_startup_warning = 1
"accept first suggestion with enter
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
" open nerdtree if no file is being passed to editor
autocmd VimEnter * if argc() == 0 | NERDTree | endif

" --------------------------------------------------------------------------------
" ### THEME ----------------------------------------------------------------------
" --------------------------------------------------------------------------------
"

" vim color scheme
colorscheme desert

" vimdiff color scheme
if &diff
    highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
endif

" column border and its color
set colorcolumn=80
highlight ColorColumn ctermbg=238 guibg=gray

" misc
highlight Search ctermbg=Yellow
highlight Search ctermfg=Red
highlight Pmenu ctermfg=black ctermbg=brown

" match endline space and color them
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" options come from plugin 'dominikduda/vim_current_word'
highlight CurrentWord ctermbg=53 ctermfg=255
highlight CurrentWordTwins ctermbg=53 ctermfg=255

" highlight syntax in Yocto recipes
filetype plugin indent on
autocmd BufNewFile,BufRead *.bb set filetype=python
autocmd BufNewFile,BufRead *.bb set syntax=python
autocmd BufNewFile,BufRead *.bbappend set filetype=python
autocmd BufNewFile,BufRead *.bbappend set syntax=python

" --------------------------------------------------------------------------------
" ### MAP/REMAP ------------------------------------------------------------------
" --------------------------------------------------------------------------------

"" open tag in current view with <C-]>
"nnoremap <C-]> :execute "tag " . expand("<cword>")<CR>
"" open tag in new tab with <C-w><C-]>
"nnoremap <C-w><C-]> :execute "tab ptag " . expand("<cword>")<CR>
"" open tag in orizontal split with <C-w><A-]> (default behavior)

" remove arrow key, use hjkl ;)
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" ctrl-[hjkl] to move between the active pane split
noremap <silent> <c-k> :wincmd k<CR>
noremap <silent> <c-j> :wincmd j<CR>
noremap <silent> <c-h> :wincmd h<CR>
noremap <silent> <c-l> :wincmd l<CR>

" insert not expandable tab (useful when expandtab is setted and you are editing a pure tab file)
inoremap <S-Tab> <C-V><Tab>

" line scroll and page scroll -> Alt + e-y/f-b
map <ESC>e <A-e>
nnoremap <A-e> 3<C-e>
map <ESC>y <A-y>
nnoremap <A-y> 3<C-y>
map <ESC>f <A-f>
nnoremap <A-f> <C-f>
map <ESC>b <A-b>
nnoremap <A-b> <C-b>

" Functions keys
" F2 to indent entire file
nnoremap <F2> gg=G<C-o><C-o>
" F4 to toggle NERDTREE
nnoremap <F4> :NERDTreeToggle<CR>
" F8 to fold/unfold code ('zi' to unfold/fold all)
let $isFold=0
function FoldMe()
    if foldlevel('.') > 0
        if $isFold==0
            :exe "normal zO"
        else
            :exe "normal zC"
        endif
        let $isFold = !$isFold
    endif
endfunction
set foldmethod=indent
let c_no_comment_fold = 1
nnoremap <F8> :call FoldMe()<CR>
