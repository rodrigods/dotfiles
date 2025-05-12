local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file) -- add current file to harpoon
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu) -- show menu
