local opt = require('utils').opt

-- use Bash
opt('o', 'shell', '/bin/bash')

-- encoding
opt('o', 'encoding', 'utf-8')

-- proper colours
opt('o', 'termguicolors', true)

-- default update time is 4000ms = 4s, prefer shorter
opt('o', 'updatetime', 200)

-- mouse (for when I need to show people code)
opt('o', 'mouse', 'a')

-- use system clipboard
opt('o', 'clipboard', 'unnamedplus')

-- undo file
opt('o', 'undodir', '$HOME/.vim/undodir')
opt('b', 'undofile', true)

-- nice tabs
local indent = 4
opt('b', 'expandtab', true)
opt('b', 'shiftwidth', indent)
opt('b', 'smartindent', true)
opt('b', 'tabstop', indent)
opt('b', 'softtabstop', indent)
opt('o', 'shiftround', true)

-- stop autocompletion on every key press
opt('o', 'completeopt', 'menuone,noinsert,noselect')

-- allow background buffers
opt('o', 'hidden', true)

-- nicer joins
opt('o', 'joinspaces', false)

-- line numbers
opt('w', 'number', true)
opt('w', 'relativenumber', true)
opt('w', 'signcolumn', 'yes')

-- cursor line highlighting
opt('w', 'cursorline', true)

-- line wrap.
opt('w', 'wrap', false)

-- window splits
opt('o', 'splitbelow', true)
opt('o', 'splitright', true)

-- space for displaying messages
opt('o', 'cmdheight', 1)

-- Don't need to see which mode I'm in
opt('o', 'showmode', false)

-- start scrolling window when we reach given offset
opt('o', 'scrolloff', 6)

-- find a better place for these
vim.cmd [[augroup Tabs]]
vim.cmd [[  autocmd FileType javascript,typescript,javascriptreact,typescriptreact,javascript.jsx,typescript.tsx,lua set shiftwidth=2]]
vim.cmd [[  autocmd FileType javascript,typescript,javascriptreact,typescriptreact,javascript.jsx,typescript.tsx,lua set tabstop=2]]
vim.cmd [[  autocmd FileType javascript,typescript,javascriptreact,typescriptreact,javascript.jsx,typescript.tsx,lua set softtabstop=2]]
vim.cmd [[augroup END]]
