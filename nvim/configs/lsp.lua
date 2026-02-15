vim.lsp.enable({'clangd', 'golps'})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- Enable the new 0.11 native completion
    -- This makes LSP suggestions appear in the omnifunc menu automatically
    if client.supports_method('textDocument/completion') then
      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy' }
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
      vim.keymap.set('i', 'C-Space', function()
          vim.lsp.completion.get()
      end)
    end

    -- Set up some minimal keymaps
    local opts = { buffer = args.buf }
    --vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)
    --vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    --vim.keymap.set('n', 'grr', vim.lsp.buf.references, opts) -- 0.11 default is grr
    --vim.keymap.set('n', 'grn', vim.lsp.buf.rename, opts)     -- 0.11 default is grn
  end,
})

vim.diagnostic.config({
    virtual_lines = {
      current_line = true,
    },
})
