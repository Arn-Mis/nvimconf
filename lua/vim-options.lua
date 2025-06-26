vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("set number")
vim.cmd("set nowrap")
vim.cmd("set ph=10")
vim.g.mapleader = " "
vim.keymap.set('n', '<C-l>', ':Lazy<CR>', { noremap = true, silent = true })
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.api.nvim_set_keymap('n', '<leader>tt', ':10split | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tv', ':vsplit | terminal<CR>', { noremap = true, silent = true })
