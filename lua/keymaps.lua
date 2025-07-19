-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- [[ Movement ]]
-- Create newlines like o and O but stay in normal mode
vim.keymap.set('n', 'zj', 'o<Esc>k', { desc = 'Create newline below and stay in normal mode' })
vim.keymap.set('n', 'zk', 'O<Esc>j', { desc = 'Create newline above and stay in normal mode' })

-- Move cursor by display lines when line is wrapped
vim.keymap.set('n', 'j', 'gj', { desc = 'Move down by display line' })
vim.keymap.set('n', 'k', 'gk', { desc = 'Move up by display line' })
vim.keymap.set('v', 'j', 'gj', { desc = 'Move down by display line' })
vim.keymap.set('v', 'k', 'gk', { desc = 'Move up by display line' })
vim.keymap.set('n', '<Down>', 'gj', { desc = 'Move down by display line' })
vim.keymap.set('n', '<Up>', 'gk', { desc = 'Move up by display line' })
vim.keymap.set('v', '<Down>', 'gj', { desc = 'Move down by display line' })
vim.keymap.set('v', '<Up>', 'gk', { desc = 'Move up by display line' })
vim.keymap.set('i', '<Down>', '<C-o>gj', { desc = 'Move down by display line' })
vim.keymap.set('i', '<Up>', '<C-o>gk', { desc = 'Move up by display line' })

-- [[ Copy and Paste ]]

-- Delete and pasting over text does not yank text
--  These keymaps use the black hole register ("_) to prevent overwriting clipboard
vim.keymap.set('n', 'd', '"_d', { desc = 'Delete without yanking' })
vim.keymap.set('x', 'd', '"_d', { desc = 'Delete without yanking' })
vim.keymap.set('x', 'p', '"_dP', { desc = 'Paste over without yanking deleted text' })

-- [[ Windows and Tabs ]]
--  See `:help wincmd` for a list of all window commands

-- Open splits
vim.keymap.set('n', '<C-i>', ':vsplit<CR>', { desc = 'Open vertical split' })
vim.keymap.set('n', '<C-o>', ':split<CR>', { desc = 'Open horizontal split' })

-- Close window
vim.keymap.set('n', '<C-q>', ':close<CR>', { desc = 'Close current window' })

-- Move between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Switch between tabs
vim.keymap.set('n', '<M-n>', ':tabnew<CR>', { desc = 'Create new tab' })
vim.keymap.set('n', '<M-q>', ':tabclose<CR>', { desc = 'Close current tab' })
vim.keymap.set('n', '<M-l>', ':tabnext<CR>', { desc = 'Go to next tab' })
vim.keymap.set('n', '<M-h>', ':tabprev<CR>', { desc = 'Go to previous tab' })
vim.keymap.set('n', '<M-1>', '1gt', { desc = 'Go to tab 1' })
vim.keymap.set('n', '<M-2>', '2gt', { desc = 'Go to tab 2' })
vim.keymap.set('n', '<M-3>', '3gt', { desc = 'Go to tab 3' })
vim.keymap.set('n', '<M-4>', '4gt', { desc = 'Go to tab 4' })
vim.keymap.set('n', '<M-5>', '5gt', { desc = 'Go to tab 5' })
vim.keymap.set('n', '<M-6>', '6gt', { desc = 'Go to tab 6' })
vim.keymap.set('n', '<M-7>', '7gt', { desc = 'Go to tab 7' })
vim.keymap.set('n', '<M-8>', '8gt', { desc = 'Go to tab 8' })
vim.keymap.set('n', '<M-9>', '9gt', { desc = 'Go to tab 9' })

-- [[ File Explorer ]]
-- See `:help nvim-tree-mappings-default` for default keymaps

-- Create :E command to focus tree (replaces netrw :E)
vim.api.nvim_create_user_command('E', function()
  vim.cmd 'NvimTreeFocus'
end, { desc = 'Focus file explorer tree' })

-- <leader>e for sidebar tree focus
vim.keymap.set('n', '<leader>e', ':NvimTreeFocus<CR>', { desc = 'Focus [E]xplorer' })

-- <leader>se for opening current file in tree
vim.keymap.set('n', '<leader>se', ':NvimTreeFindFile<CR>', { desc = '[S]earch for current file in [E]xplorer' })

-- [[ Help Configuration ]]
-- Open help in new tab instead of split
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = { '*.txt' },
  callback = function()
    if vim.bo.filetype == 'help' then
      vim.cmd 'wincmd T' -- Move current window to new tab
    end
  end,
  desc = 'Open help in new tab',
})

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
