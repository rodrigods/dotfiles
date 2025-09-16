require("rodrigods.lazy")
require("rodrigods.remap")
require("rodrigods.set")

-- Set up plugins with a delay to ensure they're loaded
vim.defer_fn(function()
  require('rodrigods.telescope').setup()
  require('rodrigods.lsp').setup()
end, 100)
