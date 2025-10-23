-- Peek.nvim configuration and keybindings
local peek = require("peek")

-- Keybindings for peek.nvim
vim.keymap.set("n", "<leader>mp", peek.open, { desc = "Open markdown preview" })
vim.keymap.set("n", "<leader>mc", peek.close, { desc = "Close markdown preview" })
vim.keymap.set("n", "<leader>mt", function()
  if peek.is_open() then
    peek.close()
  else
    peek.open()
  end
end, { desc = "Toggle markdown preview" })

-- Additional keybindings for better UX
vim.keymap.set("n", "<leader>mr", function()
  peek.close()
  vim.defer_fn(function()
    peek.open()
  end, 100)
end, { desc = "Refresh markdown preview" })

-- Auto-open preview when entering markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Optional: auto-open preview (uncomment if you want this behavior)
    -- peek.open()
  end,
})

-- Close preview when leaving markdown files
vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*.md",
  callback = function()
    peek.close()
  end,
})