local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' }) -- pf: project file
    vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
    vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Telescope livre grep' })
