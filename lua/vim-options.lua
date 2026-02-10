vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("set number")
vim.cmd("set nowrap")
vim.cmd("set ph=10")

vim.g.mapleader = " "


vim.keymap.set('n', '<C-l>', ':Lazy<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>tt', ':lua Snacks.terminal.toggle()<Cr>', {noremap = true, silent = true})
vim.keymap.set('n', '<Leader>vs', ':vsplit<Cr>', {noremap = true, silent = true})
vim.keymap.set('n' , '<Leader>hs', ':split<Cr>', {noremap = true, silent = true})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- function to create a list of commands and convert them to autocommands
-------- This function is taken from https://github.com/norcalli/nvim_utils

local M = {}
function M.nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.api.nvim_command('augroup '..group_name)
        vim.api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
            vim.api.nvim_command(command)
        end
        vim.api.nvim_command('augroup END')
    end
end

local autoCommands = {
    -- other autocommands
    open_folds = {
        {"BufReadPost,FileReadPost", "*", "normal zR"}
    }
}

M.nvim_create_augroups(autoCommands)
