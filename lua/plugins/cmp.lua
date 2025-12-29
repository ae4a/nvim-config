return {
  {
    "onsails/lspkind-nvim",
    config = function()
      require("lspkind").init({
        mode = "symbol_text",
        preset = "default",
        symbol_map = {
          Text = "󰦨 ",
          Method = " ",
          Function = "󰊕 ",
          Constructor = "󰊕 ",
          Field = " ",
          Variable = " ",
          Class = " ",
          Interface = " ",
          Module = " ",
          Property = " ",
          Unit = " ",
          Value = " ",
          Enum = " ",
          Keyword = " ",
          Snippet = " ",
          Color = " ",
          File = " ",
          Reference = " ",
          Folder = " ",
          EnumMember = " ",
          Constant = " ",
          Struct = " ",
          Event = " ",
          Operator = " ",
          TypeParameter = " ",
          Copilot = " ",
          Supermaven = " ",
        },
      })
    end,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    lazy = true,
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter" },
    dependencies = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "ray-x/cmp-treesitter",
      "saadparwaiz1/cmp_luasnip",
      "js-everts/cmp-tailwind-colors",
    },
    lazy = true,
    config = function()
      local luasnip = require("luasnip")
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      --local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp_tailwind = require("cmp-tailwind-colors")
      local autocomplete_group = vim.api.nvim_create_augroup("dadbod-autocomplete", { clear = true })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function()
          cmp.setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
        end,
        group = autocomplete_group,
      })

      cmp.setup({
        -- enabled = function()
        --   return require("util.cmp").is_enabled()
        -- end,
        preselect = cmp.PreselectMode.Item,
        keyword_length = 2,
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(), -- TODO change
          documentation = cmp.config.window.bordered(),
        },
        view = {
          entries = "native",
        },
        sources = cmp.config.sources({
          {
            name = "luasnip",
            option = { use_show_condition = true },
            entry_filter = function()
              local context = require("cmp.config.context")
              return not context.in_treesitter_capture("string") and not context.in_syntax_group("String")
            end,
          },
          {
            name = "nvim_lsp",
          },
          {
            name = "nvim_lua",
          },
          {
            name = "treesitter",
            keyword_length = 4,
          },
          {
            name = "path",
            keyword_length = 4,
          },
          {
            name = "buffer",
            keyword_length = 3,
            option = {
              get_bufnrs = function()
                local bufs = {}
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                  bufs[vim.api.nvim_win_get_buf(win)] = true
                end
                return vim.tbl_keys(bufs)
              end,
            },
          },
          {
            name = "lazydev",
            keyword_length = 2,
          },
        }),
        -- formatting = {
        --   fields = {'menu', 'abbr', 'kind'},
        --   format = function(entry, item)
        --     local menu_icon = {
        --       nvim_lsp = 'λ',
        --       luasnip = '⋗',
        --       buffer = 'Ω',
        --       path = '🖫',
        --     }
        --
        --     item.menu = menu_icon[entry.source.name]
        --     return item
        --   end,
        -- },
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            ellipsis_char = "...",
            before = function(entry, item)
              cmp_tailwind.format(entry, item)
              return item
            end,
            menu = {
              nvim_lsp = "[LSP]",
              nvim_lua = "[LUA]",
              luasnip = "[SNIP]",
              buffer = "[BUF]",
              path = "[PATH]",
              treesitter = "[TREE]",
              ["vim-dadbod-completion"] = "[DB]",
            },
          }),
        },
        sorting = {
          priority_weight = 2,
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
          },
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              -- If completion menu is visible, confirm the selected item
              cmp.confirm({ select = true })
            elseif luasnip.expand_or_jumpable() then
              -- If we are in a snippet and can jump, do it
              luasnip.expand_or_jump()
            else
              -- Otherwise, fallback to a regular tab
              fallback()
            end
          end, { "i", "s" }),
          ["<C-j>"] = cmp.mapping.select_next_item({
            behavior = cmp.ConfirmBehavior.Insert,
          }),
          ["<C-k>"] = cmp.mapping.select_prev_item({
            behavior = cmp.ConfirmBehavior.Insert,
          }),
          --["<C-b>"] = cmp.mapping.scroll_docs(-5),
          --["<C-f>"] = cmp.mapping.scroll_docs(5),
          --["<C-q>"] = cmp.mapping.abort(),
          ["<escape>"] = cmp.mapping.abort(),
        }),
      })
      -- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done()) -- TEST
    end,
  },
}
