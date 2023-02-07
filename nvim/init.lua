vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.completeopt = table.concat({ 'menuone', 'noinsert', 'noselect' }, ',')
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.diffopt = table.concat({ 'internal', 'filler', 'algorithm:histogram', 'indent-heuristic' }, ',')

-- For WSL2 clipboard
vim.g.clipboard = {
    name = 'clipboard',
    copy = {
        ['+'] = 'win32yank.exe -i --crlf',
        ['*'] = 'win32yank.exe -i --crlf',
    },
    paste = {
        ['+'] = 'win32yank.exe -o --lf',
        ['*'] = 'win32yank.exe -o --lf',
    },
    cache_enabled = 1,
}
vim.o.clipboard = vim.o.clipboard .. 'unnamedplus'

-- For JIS keyboard, that assigns semicolon to the right little finger position
vim.api.nvim_set_keymap('n', ':', ';', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', ';', ':', { noremap=true, silent=true })

vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap=true, silent=true })

require('packer_init')
