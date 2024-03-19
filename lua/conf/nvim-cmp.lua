local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local lspkind = require('lspkind')
local luasnip = require('luasnip')
local cmp = require('cmp')

require('cmp').setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif require('copilot.suggestion').is_visible() then
				require('copilot.suggestion').accept()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			'i',
			's',
		}),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			'i',
			's',
		}),
	},
	formatting = {
		format = lspkind.cmp_format({
		  mode = 'symbol', -- show only symbol annotations
		  maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						 -- can also be a function to dynamically calculate max width such as 
						 -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
		  ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
		  show_labelDetails = true, -- show labelDetails in menu. Disabled by default
	
		  -- The function below will be called before any actual modifications from lspkind
		  -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
		  before = function (entry, vim_item)
			return vim_item
		  end
		})
	},
	sources = {
		{ name = 'copilot' },
		-- { name = 'nvim_lsp' },
		-- { name = 'luasnip' },
		-- { name = 'buffer' },
		-- { name = 'path' },
		-- { name = 'cmdline' },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		documentation = {
			border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
		},
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
})
