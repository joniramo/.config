-- Nvim-treesitter is a parser enabling accurate syntax highlighting

-- Run :TSUpdate whenever nvim-treesitter is updated
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.spec.name == "nvim-treesitter" and ev.data.kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

-- Configuring nvim-treesitter. See `:help nvim-treesitter`
---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.config").setup({
	ensure_installed = {
		"bash",
		"c",
		"diff",
		"html",
		"lua",
		"luadoc",
		"markdown",
		"markdown_inline",
		"query",
		"vim",
		"vimdoc",
	},
	-- Autoinstall languages that are not installed
	auto_install = true,
	highlight = {
		enable = true,
		-- Some languages depend on Vim's regex highlighting system (such as Ruby) for indent rules.
		--   If you are experiencing weird indenting issues, add the language to
		--   the list of additional_vim_regex_highlighting and disabled languages for indent.
		additional_vim_regex_highlighting = { "ruby" },
	},
	indent = { enable = true, disable = { "ruby" } },
})

-- There are additional nvim-treesitter modules that you can use to interact
-- with nvim-treesitter. You should go explore a few and see what interests you:
--
--   - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
--   - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
--   - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
