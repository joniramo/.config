vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })

require("lualine").setup({
	options = {
		disabled_filetypes = { "neo-tree" },
	},
	sections = {
		lualine_x = { "encoding", "filetype" },
	},
})
