vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move highlights
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- do not move cursor to end of line when appending the line below
vim.keymap.set("n", "J", "mzJ`z")

-- keep curson in the middle while searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever: do not lose the buffer when pasting over
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever: yank to the environment clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])


