-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
    return
end

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
    -- setup formatters & linters
    sources = {
        -- python
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.black,

        -- go
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports_reviser,
    },

    -- configure format on save
    on_attach = function(current_client, bufnr)
        if current_client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        filter = function(client)
                            --  only use null-ls for formatting instead of lsp server
                            return client.name == "null-ls"
                        end,
                        bufnr = bufnr,
                    })
                end,
            })
        end
    end,
})
