local cmp = require "cmp"

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<esc>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  completion = {
    completeopt = 'menu,menuone,noinsert', -- Always hightlight the first option
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.disable,
  },
  sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    },
    {
      { name = "path" },
      { name = 'buffer' },
    })
})
