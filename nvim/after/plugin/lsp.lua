local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'pyright',
    'gopls',
    'lua-language-server',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(_, bufnr)
    -- keybind options
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- set keybinds
    vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)                   -- show definition, references
    vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)        -- got to declaration
    vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)              -- see definition and make edits in window
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)     -- go to implementation
    vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)          -- see available code actions
    vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)               -- smart rename
    vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
    vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
    vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)         -- jump to previous diagnostic in buffer
    vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)         -- jump to next diagnostic in buffer
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)                     -- show documentation for what is under cursor
    vim.keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)               -- see outline on right hand side
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
