local map = require('utils').map

map('n', '<C-j>', '<Esc>', { noremap = true })
map('i', '<C-j>', '<Esc>', { noremap = true })
map('v', '<C-j>', '<Esc>', { noremap = true })
map('s', '<C-j>', '<Esc>', { noremap = true })
map('x', '<C-j>', '<Esc>', { noremap = true })
map('c', '<C-j>', '<Esc>', { noremap = true })
map('o', '<C-j>', '<Esc>', { noremap = true })
map('l', '<C-j>', '<Esc>', { noremap = true })
map('t', '<C-j>', '<Esc>', { noremap = true })

map('n', '<C-k>', '<Esc>', { noremap = true })
map('i', '<C-k>', '<Esc>', { noremap = true })
map('v', '<C-k>', '<Esc>', { noremap = true })
map('s', '<C-k>', '<Esc>', { noremap = true })
map('x', '<C-k>', '<Esc>', { noremap = true })
map('c', '<C-k>', '<Esc>', { noremap = true })
map('o', '<C-k>', '<Esc>', { noremap = true })
map('l', '<C-k>', '<Esc>', { noremap = true })
map('t', '<C-k>', '<Esc>', { noremap = true })

map('n', '<leader>e', ':e <C-R>=expand("%:p:h") . "/" <CR>', { noremap = true })
map('n', '<leader><leader>', ':noh<CR>', { noremap = true })

map('n', '<C-h>', '<C-w>h', { noremap = true })
map('n', '<C-j>', '<C-w>j', { noremap = true })
map('n', '<C-k>', '<C-w>k', { noremap = true })
map('n', '<C-l>', '<C-w>l', { noremap = true })