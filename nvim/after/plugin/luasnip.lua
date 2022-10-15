local ls = require 'luasnip'
local types = require 'luasnip.util.types'
local map = vim.keymap.set

local s, i, t, c, d = ls.s, ls.insert_node, ls.text_node, ls.choice_node, ls.dynamic_node
local vs = ls.parser.parse_snippet
local fmt = require("luasnip.extras.fmt").fmt

--config
ls.config.set_config {
	history=true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
	ext_optsA= {
		[types.choiceNode] = {
			active = {
				virt_text = {{"<-", "E"}},
			}
		}
	}
}

--mappings
map({'i', 's'}, '<c-j>', function ()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, {silent=true})

map({'i', 's'}, '<c-k>', function ()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, {silent=true})

map({'i', 's'}, '<c-l>', function ()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent=true})

--snippets
ls.add_snippets('typescript',{vs("cl", "console.log($1)")})
ls.add_snippets('javascript',{vs("cl", "console.log($1)")})
