local map = require('utils').map

local opts = {noremap = true, silent = true}

map('n', '<C-j>', '<Esc>', opts)
map('i', '<C-j>', '<Esc>', opts)
map('v', '<C-j>', '<Esc>', opts)
map('s', '<C-j>', '<Esc>', opts)
map('x', '<C-j>', '<Esc>', opts)
map('c', '<C-j>', '<Esc>', opts)
map('o', '<C-j>', '<Esc>', opts)
map('l', '<C-j>', '<Esc>', opts)
map('t', '<C-j>', '<Esc>', opts)

map('n', '<C-k>', '<Esc>', opts)
map('i', '<C-k>', '<Esc>', opts)
map('v', '<C-k>', '<Esc>', opts)
map('s', '<C-k>', '<Esc>', opts)
map('x', '<C-k>', '<Esc>', opts)
map('c', '<C-k>', '<Esc>', opts)
map('o', '<C-k>', '<Esc>', opts)
map('l', '<C-k>', '<Esc>', opts)
map('t', '<C-k>', '<Esc>', opts)

map('n', '<leader>e', ':e <C-R>=expand("%:p:h") . "/" <CR>', opts)
map('n', 'sw', ':%s/<C-R><C-W>//g<left><left>', opts)
map('n', '<leader><leader>', ':noh<CR>', opts)

map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
