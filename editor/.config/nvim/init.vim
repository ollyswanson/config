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

set mouse=a

" specify a directory for vim plugins

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'janko/vim-test'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'alvan/vim-closetag'

" Requires fzf to be installed
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

Plug 'rust-lang/rust.vim'
Plug 'morhetz/gruvbox'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
call plug#end()

colorscheme gruvbox
set background=dark

"keymappings
let mapleader = "\<Space>"
" Start editing init.vim with "<Space r>"
nnoremap <leader>r :e ~/.config/nvim/init.vim<CR>
" Start editing coc config
nnoremap <leader>c :e ~/.config/nvim/coc-settings.json<CR>
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

nmap <C-n> :NERDTreeToggle<CR>

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

" Toggle pairs plugin
nmap <leader>c :call CocAction('toggleExtension', 'coc-pairs')<CR>

" echo syntax stack for debugging of plugins
nnoremap zS :echo join(reverse(map(synstack(line('.'), col('.')), 'synIDattr(v:val,"name")')),' ')<cr>

" Vim Test
let test#strategy = 'vimterminal'

" FZF
nnoremap <C-p> :Files<CR>
let $FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'

command! -bang -nargs=* -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)

" coc config
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-eslint', 
    \ 'coc-prettier', 
    \ 'coc-json', 
    \ 'coc-clangd',
    \ 'coc-yaml',
    \ 'coc-java',
    \ 'coc-tailwindcss',
\ ]

" rust format
let g:rustfmt_autosave = 1

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

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

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
" Recently vim can merge signcolumn and number column into one
    set signcolumn=number
    else
    set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> gc :CocCommand clangd.switchSourceHeader<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
autocmd!
" Setup formatexpr specified filetype(s).
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder.
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <,>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <,>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <,>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <,>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <,>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <,>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <,>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <,>p  :<C-u>CocListResume<CR>

" Nerd tree
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
\ }

" git gutter
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

" airline themes
let g:airline_powerline_fonts = 1

" vim-closetag
let g:closetag_filenames = '*.html, *.jsx, *.tsx, *.js'
"Makes the list of non-closing tags self-closing in these file types
let g:closetag_xhtml_filetypes = 'xhtml,jsx, tsx'
" Makes the list case sensitive
let g:closetag_emptyTags_caseSensitive = 1

" Disables autclose if not in 'valid region'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ }

" language specifics
autocmd FileType rust call SetRustOptions()

function SetRustOptions()
    set tabstop=4
    set shiftwidth=4
    set expandtab
    let b:coc_pairs_disabled = ["'"]
endfunction 

autocmd FileType scheme call SetSchemeOptions()

function SetSchemeOptions()
    set autoindent
endfunction

autocmd FileType java call SetJavaOptions()

function SetJavaOptions()
    set tabstop=4
    set shiftwidth=4
    set expandtab
endfunction

autocmd FileType make call SetMakeOptions()

function SetMakeOptions()
    set noexpandtab
endfunction

autocmd FileType typescriptreact call SetTypescriptReactOptions()

function SetTypescriptReactOptions()
    let b:coc_pairs_disabled = ["<"]
endfunction

autocmd FileType markdown call SetMarkdownOptions()
autocmd FileType text call SetMarkdownOptions()

function SetMarkdownOptions()
  set wrap
  set textwidth=80
endfunction
