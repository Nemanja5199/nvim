vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })

vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

--Void register when pasting so the work stays in the
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- ================================
-- Tab management keymaps
-- ================================

local opts = { noremap = true, silent = true }

-- Open a new tab
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", opts)

-- Close current tab
vim.keymap.set("n", "<leader>to", ":tabclose<CR>", opts)

-- Navigate tabs
vim.keymap.set("n", "<leader>tl", ":tabnext<CR>", opts) -- next tab
vim.keymap.set("n", "<leader>th", ":tabprevious<CR>", opts) -- previous tab

for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, i .. "gt", opts)
end

-- Optional: move current tab left/right
vim.keymap.set("n", "<leader>tm", ":tabmove -1<CR>", opts) -- move tab left
vim.keymap.set("n", "<leader>tM", ":tabmove +1<CR>", opts) -- move tab right

-- Exit terminal mode with ESC
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })

-- NORMAL mode: Ctrl+. comments the current line
vim.keymap.set("n", "<C-.>", "<Plug>(comment_toggle_linewise_current)", {})

-- VISUAL mode: Ctrl+. comments the selection
vim.keymap.set("x", "<C-.>", "<Plug>(comment_toggle_linewise_visual)", {})

-- Keep selection after indenting so you can press > / < repeatedly
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })

-- Wrap selection with single quotes
vim.keymap.set("v", "'", "c'<C-r>\"'<Esc>", { noremap = true })

-- Wrap selection with double quotes
vim.keymap.set("v", '"', [[c"<C-r>""<Esc>]], { noremap = true, silent = true })
