local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-i>", "<C-i>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-tab>", "<c-6>", opts)

-- better tab navigation
keymap("n", "<leader>aN", "<cmd>tabnew %<cr>", vim.tbl_extend("force", opts, { desc = "Duplicate in New Tab" }))
keymap("n", "<leader>ac", "<cmd>tabclose<cr>", vim.tbl_extend("force", opts, { desc = "Close" }))
keymap("n", "<leader>ah", "<cmd>-tabmove<cr>", vim.tbl_extend("force", opts, { desc = "Move Left" }))
keymap("n", "<leader>al", "<cmd>+tabmove<cr>", vim.tbl_extend("force", opts, { desc = "Move Right" }))
keymap("n", "<leader>an", "<cmd>$tabnew<cr>", vim.tbl_extend("force", opts, { desc = "New Empty Tab" }))
keymap("n", "<leader>ao", "<cmd>tabonly<cr>", vim.tbl_extend("force", opts, { desc = "Only" }))
--- Tabmove
keymap("n", "<C-S-Right>", ":+tabnext<CR>", opts)
keymap("n", "<C-S-Left>", ":-tabnext<CR>", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

vim.cmd [[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]]
vim.cmd [[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]]
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

-- more good
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- tailwind bearable to work with
keymap({ "n", "x" }, "j", "gj", opts)
keymap({ "n", "x" }, "k", "gk", opts)
keymap("n", "<leader>w", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", opts)

vim.api.nvim_set_keymap("t", "<C-;>", "<C-\\><C-n>", opts)
