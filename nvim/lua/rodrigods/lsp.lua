-- LSP configuration
local M = {}

function M.setup()
  -- note: diagnostics are not exclusive to lsp servers
  -- so these can be global keybindings
  vim.keymap.set('n', '<leader>vd', '<cmd>lua vim.diagnostic.open_float()<cr>')
  vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
  vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>') 

  vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
      local opts = {buffer = event.buf}

      -- these will be buffer-local keybindings
      -- because they only work if you have an active language server
      vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
      vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set('n', '<leader>ws', function() vim.lsp.buf.workspace_symbol() end, opts)
      vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
      vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
      vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
      vim.keymap.set('n', '<leader>rr', function() vim.lsp.buf.references() end, opts)
      vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
      
      -- Auto-fix and auto-import keybindings
      vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.code_action({ source = { "organizeImports" } }) end, opts)
      vim.keymap.set('n', '<leader>fx', function() vim.lsp.buf.format() end, opts)
    end
  })

  local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
  
  -- Enhanced capabilities for auto-imports and formatting
  lsp_capabilities.textDocument.completion.completionItem.snippetSupport = true
  lsp_capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    }
  }

  require('mason').setup({})
  require('mason-lspconfig').setup({
    ensure_installed = {
      'lua_ls',      -- Lua
      'pyright',     -- Python
      'ts_ls',       -- TypeScript/JavaScript
      'jsonls',      -- JSON
      'html',        -- HTML
      'cssls',       -- CSS
      'bashls',      -- Bash
      'clangd',      -- C/C++
      'gopls',       -- Go
      'rust_analyzer', -- Rust
    },
    handlers = {
      function(server_name)
        require('lspconfig')[server_name].setup({
          capabilities = lsp_capabilities,
          on_attach = function(client, bufnr)
            -- Enable auto-formatting on save for supported clients
            if client.supports_method("textDocument/formatting") then
              vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function()
                  vim.lsp.buf.format({ async = false })
                end,
              })
            end
            
            -- Enable auto-imports on save for TypeScript/JavaScript
            if server_name == "ts_ls" then
              vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function()
                  vim.lsp.buf.code_action({ source = { "organizeImports" } })
                end,
              })
            end
          end,
        })
      end,
    },
  })

  local cmp = require('cmp')

  cmp.setup({
    sources = {
      {name = 'nvim_lsp'},
      {name = 'path'},
      {name = 'buffer'},
    },
    mapping = cmp.mapping.preset.insert({
      -- Enter key confirms completion item
      ['<CR>'] = cmp.mapping.confirm({select = true}),

      -- Ctrl + space triggers completion menu
      ['<C-Space>'] = cmp.mapping.complete(),
      
      -- Tab to cycle through completions
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    }),
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    -- Enable auto-imports in completion
    completion = {
      completeopt = 'menu,menuone,noinsert,noselect',
    },
  })
end

return M