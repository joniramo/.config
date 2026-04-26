vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.spec.name == "LuaSnip" and ev.data.kind == "install" then
			vim.fn.system({ "make", "-C", ev.data.spec.path, "install_jsregexp" })
		end
	end,
})

vim.pack.add({
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/folke/lazydev.nvim" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.x") },
})

require("lazydev").setup({
	library = {
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		{ path = vim.fn.stdpath("config") },
	},
})

require("blink.cmp").setup({
	keymap = {
		preset = "default",
	},
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = {
		documentation = { auto_show = false, auto_show_delay_ms = 500 },
	},
	fuzzy = { implementation = "lua" },
	signature = { enabled = true },
	snippets = { preset = "luasnip" },
	sources = {
		default = { "lsp", "path", "snippets", "lazydev" },
		providers = {
			lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
		},
	},
})
