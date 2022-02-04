local cmp = require'cmp'

local icons = {
		Text = "   (Text) ",
		Method = "   (Method)",
		Function = "   (Function)",
		Constructor = "   (Constructor)",
		Field = " ﴲ  (Field)",
		Variable = "   (Variable)",
		Class = "   (Class)",
		Interface = " ﰮ  (Interface)",
		Module = "   (Module)",
		Property = " 襁 (Property)",
		Unit = "   (Unit)",
		Value = "   (Value)",
		Enum = " 練 (Enum)",
		Keyword = "   (Keyword)",
		Snippet = "   (Snippet)",
		Color = "   (Color)",
		File = "   (File)",
		Reference = "   (Reference)",
		Folder = "   (Folder)",
		EnumMember = "   (EnumMember)",
		Constant = " ﲀ  (Constant)",
		Struct = " ﳤ  (Struct)",
		Event = "   (Event)",
		Operator = "   (Operator)",
		TypeParameter = "   (TypeParameter)"
	}

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	completion = {
		throttle_time = 80;
		source_timeout = 200;
		resolve_timeout = 800;
		incomplete_delay = 400;
		max_abbr_width = 100;
		max_kind_width = 100;
		max_menu_width = 100;
	},
	sources = {
		{name = 'nvim_lsp'},
		{name = 'buffer'},
		{name = 'path'},
		{name = 'vsnip' },
	},
	mapping = {
		['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	},
	formatting = {
		format = function(_, vim_item)
			vim_item.kind = icons[vim_item.kind]
			return vim_item
		end
	}
})
