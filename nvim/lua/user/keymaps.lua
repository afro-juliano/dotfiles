local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap


local key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    { noremap = true, silent = true}
  )
end

key_mapper('n', '<Space>', '<NOP>')

vim.g.mapleader = " "

-- no hl
key_mapper('n', '<leader>h', ':set hlsearch!<CR>')

-- Nvim-tree
key_mapper('n', '<leader>t', ':NvimTreeToggle<CR>')
key_mapper('n', '<leader>f', ':NvimTreeFocus<CR>')

--  Better window movement
key_mapper('n', '<C-h>', '<C-w>h')
key_mapper('n', '<C-j>', '<C-w>j')
key_mapper('n', '<C-k>', '<C-w>k')
key_mapper('n', '<C-l>', '<C-w>l')

-- Buffer movement
key_mapper('', '<leader>1', ':BufferLineGoToBuffer 1<CR>')
key_mapper('', '<leader>2', ':BufferLineGoToBuffer 2<CR>')
key_mapper('', '<leader>3', ':BufferLineGoToBuffer 3<CR>')
key_mapper('', '<leader>4', ':BufferLineGoToBuffer 4<CR>')
key_mapper('', '<leader>5', ':BufferLineGoToBuffer 5<CR>')
key_mapper('', '<leader>6', ':BufferLineGoToBuffer 6<CR>')
key_mapper('', '<leader>7', ':BufferLineGoToBuffer 7<CR>')
key_mapper('', '<leader>8', ':BufferLineGoToBuffer 8<CR>')
key_mapper('', '<leader>9', ':BufferLineGoToBuffer 9<CR>')
key_mapper('', '<leader>0', ':BufferLineGoToBuffer 10<CR>')

-- Closing tabs
key_mapper('', '<leader>p', ':bprev<CR>')
key_mapper('', '<leader>n', ':bnext<CR>')
key_mapper('', '<leader>bd', ':bd<CR>')
key_mapper('n', '<leader>bx', ':%bd<bar>e#<bar>bd#<CR>')
key_mapper('', '<leader>q', ':wq<CR>')
key_mapper('', '<leader>w', ':w<CR>')
key_mapper('', '<leader>e', ':e<CR>')
key_mapper('', '<leader>r', ':LspRestart<CR>')

-- Better indenting
key_mapper('v', '<', '<gv')
key_mapper('v', '>', '>gv')

-- Not using escape
key_mapper('i', 'jk', '<ESC>')
key_mapper('i', 'kj', '<ESC>')
key_mapper('i', 'jj', '<ESC>')

--[[Tab switch buffer
key_mapper('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
key_mapper('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})]]

-- Move selected line / block of text in visual mode
key_mapper('x', 'K', ':move \'<-2<CR>gv-gv\'')
key_mapper('x', 'K', ':move \'>+1<CR>gv-gv\'')

-- Telescopeeeee
key_mapper('x',  '<expr><TAB>', 'pumvisible() ? \"\\<C-n\" : \"\\<TAB>\"')
keymap("n", "<leader>xx", "<cmd>Telescope find_files<cr>", opts)
keymap('n','<leader>xf', "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap('n','<c-t>','<cmd>Telescope live_grep<cr>', opts)
