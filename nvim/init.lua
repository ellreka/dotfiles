vim.opt.encoding = "utf-8"

vim.opt.ambiwidth = 'double'
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.visualbell = true
vim.opt.number = true
vim.opt.showmatch = true
vim.opt.matchtime = 1
vim.opt.mouse = 'a'
vim.opt.hidden = true
vim.opt.ignorecase = true

vim.opt.hlsearch = true

vim.opt.clipboard:append('unnamedplus')

vim.api.nvim_set_var('loaded_netrw', 1)
vim.api.nvim_set_var('loaded_netrwPlugin', 1)

-- キーバインド
vim.g.mapleader = ' '
vim.keymap.set('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('n', 'x', '"_x')
-- ショートカット
vim.keymap.set('n', '<Leader>w', ':w<CR>')
vim.keymap.set('n', '<Leader>q', ':q<CR>')
vim.keymap.set('n', '<Leader>r', ':source $MYVIMRC<CR>')
-- 画面分割
vim.keymap.set('n', '<Leader>sh', ':split<Return><C-w>w')
vim.keymap.set('n', '<Leader>sv', ':vsplit<Return><C-w>w')
-- アクティブウィンドウの移動
vim.keymap.set('n', '<Leader>h', '<C-w>h')
vim.keymap.set('n', '<Leader>k', '<C-w>k')
vim.keymap.set('n', '<Leader>j', '<C-w>j')
vim.keymap.set('n', '<Leader>l', '<C-w>l')
-- タブの移動
vim.keymap.set('n', '<Tab>', ':BufferNext<CR>')
vim.keymap.set('n', '<S-Tab>', ':BufferPrevious<CR>')
-- nvim-tree
vim.keymap.set('n', '<Leader>e', ':NvimTreeFocus<CR>')

-- LSP
-- 候補を TAB で選択
vim.keymap.set('i', '<Tab>', function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true })

vim.keymap.set('i', '<s-Tab>', function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<s-Tab>"
end, { expr = true })

vim.keymap.set('i', '<Esc>', function()
  return vim.fn.pumvisible() == 1 and "<C-e><Esc>" or "<Esc>"
end, { expr = true })

vim.keymap.set('i', '<CR>', function()
  return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
end, { expr = true })
-- telescope
-- vim.keymap.set('n', '<Leader>f', '<cmd>Telescope file_browser<CR>')
-- vim.keymap.set('n', '<Leader>ff', '<cmd>Telescope find_files<CR>')
-- vim.keymap.set('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>')
-- vim.keymap.set('n', '<Leader>fb', '<cmd>Telescope buffers<CR>')
-- terminal
-- ターミナルを開く
-- vim.keymap.set('n', '<Leader>t', function()
--   -- 既存のターミナルバッファを探す
--   local bufnr
--   for _, buf in ipairs(vim.api.nvim_list_bufs()) do
--       if vim.bo[buf].buftype == 'terminal' then
--           bufnr = buf
--           break
--       end
--   end
--   -- ターミナルバッファが既に存在する場合、それを使用する
--   if bufnr then
--       vim.api.nvim_win_set_buf(0, bufnr)
--   else
--       -- 新しいターミナルウィンドウを作成
--       vim.cmd('botright 10split | terminal')
--   end
-- end, {
--   silent = true,
--   noremap = true
-- })

-- -- ターミナルを隠す
-- vim.keymap.set('t', '<Leader>t', '<C-\\><C-n>:hide<CR>', {
--   silent = true,
--   noremap = true
-- })

-- -- 常にインサートモードで開く
-- vim.api.nvim_create_autocmd('TermOpen', {
--   pattern = "*",
--   command = "startinsert"
-- })
-- load lazy.nvim
require('lazy_nvim')
