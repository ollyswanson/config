" Don't want to use Fish
set shell=/bin/bash
syntax on

set clipboard=unnamedplus
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu rnu
set nowrap
set smartcase
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
set encoding=utf-8

set mouse=a
set background=dark

"keymappings
let mapleader = "\<Space>"
" Start editing init.vim with "<Space r>"

" Clear highlighted text with \<space>
nnoremap <leader><space> :noh<CR>

" Opens a file adjacent to the currently open file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Select the word under the cursor for easy find/replace
nnoremap sw :%s/<C-R><C-W>//g<left><left>

nnoremap <leader>m :Man <C-R><C-W><CR><C-w>_
" Open prompt for man page under selected word, places caret before word
" to easily select different pages for man.
nnoremap <leader>M :Man <C-R><C-W><C-R>b

" Window navigation remap
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Remap escape (<C-j> sometimes doesn't work so remap <C-k> as well)
nnoremap <C-j> <Esc>
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
snoremap <C-j> <Esc>
xnoremap <C-j> <Esc>
cnoremap <C-j> <C-c>
onoremap <C-j> <Esc>
lnoremap <C-j> <Esc>
tnoremap <C-j> <Esc>

nnoremap <C-k> <Esc>
inoremap <C-k> <Esc>
vnoremap <C-k> <Esc>
snoremap <C-k> <Esc>
xnoremap <C-k> <Esc>
cnoremap <C-k> <C-c>
onoremap <C-k> <Esc>
lnoremap <C-k> <Esc>
tnoremap <C-k> <Esc>

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
