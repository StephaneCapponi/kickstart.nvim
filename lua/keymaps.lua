local mark = require 'harpoon.mark'
local ui = require 'harpoon.ui'

-- harpoon
vim.keymap.set('n', '<C-a>', mark.add_file)
vim.keymap.set('n', '<C-x>', ui.toggle_quick_menu)

-- Move selected lines around
vim.keymap.set('v', 'J', ":m '>+1<CR>gb=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gb=gv")

-- Keep cursor in the middle when jumping betweeb pages
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Keep cursor in the middle when searching for a word
vim.keymap.set('n', 'n', 'nzzzv')

-- Yank to clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

-- Paste on selected without loosing the one that we want to copy
vim.keymap.set('x', '<leader>vp', '"_dP', { desc = 'Void paster' })
vim.keymap.set('n', '<leader>vd', '"_d', { desc = 'Void delete' })
vim.keymap.set('v', '<leader>vd', '"_d', { desc = 'Void delete' })

-- Replace / Rename a word
vim.keymap.set('n', '<leader>rw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[R]ename [W]ord' })

-- Oil keymap
vim.keymap.set('n', '<leader>pv', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
