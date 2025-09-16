-- Telescope configuration
local M = {}

function M.setup()
  local builtin = require('telescope.builtin')
  local actions = require('telescope.actions')
  
  vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' }) -- pf: project file
  vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
  vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Telescope live grep' })
  
  -- Custom telescope configuration with split actions
  require('telescope').setup({
    defaults = {
      mappings = {
        i = {
          ['<C-v>'] = actions.select_vertical,
          ['<C-s>'] = actions.select_horizontal,
          ['<C-t>'] = actions.select_tab,
        },
        n = {
          ['<C-v>'] = actions.select_vertical,
          ['<C-s>'] = actions.select_horizontal,
          ['<C-t>'] = actions.select_tab,
        },
      },
    },
  })
end

return M