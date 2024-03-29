return {
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require 'cmp'
            local luasnip = require 'luasnip'
            cmp.setup {
                snippet = {
                    expand = function(args)
                      luasnip.lsp_expand(args.body)
                    end,
                  },
                window = {
                  completion = cmp.config.window.bordered(),
                  documentation = cmp.config.window.bordered()
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
                    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
                    -- C-b (back) C-f (forward) for snippet placeholder navigation.
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm {
                      behavior = cmp.ConfirmBehavior.Replace,
                      select = true,
                    },
                    ['<Tab>'] = cmp.mapping(function(fallback)
                      if cmp.visible() then
                        cmp.select_next_item()
                      elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                      else
                        fallback()
                      end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                      if cmp.visible() then
                        cmp.select_prev_item()
                      elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                      else
                        fallback()
                      end
                    end, { 'i', 's' }),
                }),
                sources = {
                { name = 'nvim_lsp', keyword_length = 1 },
                { name = "nvim_lsp_signature_help" }, { name = 'luasnip' },
                { name = "path" }, { name = 'buffer' }, { name = "nvim_lua" }
              },
            }
        end
    }, {
        "hrsh7th/cmp-nvim-lsp",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-buffer",
    }
}
