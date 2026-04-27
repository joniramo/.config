-- Mason.nvim is a package manager for LSPs and tooling.
--  INFO: https://github.com/mason-org/mason.nvim

vim.pack.add({
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/williamboman/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/j-hui/fidget.nvim" },
})

require("mason").setup()

local capabilities = require("blink.cmp").get_lsp_capabilities()

local servers = {
	lua_ls = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
			},
		},
	},
}

-- This ensures which linters will be installed by default
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
	"stylua",
	"markdownlint",
	"jsonlint",
	"stylelint",
	"eslint",
})
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

require("mason-lspconfig").setup({
	ensure_installed = {}, -- Explicitly set to empty, installs are managed via mason-tool-installer
	automatic_installation = false,
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}
			-- This handles overriding only values explicitly passed by the server configuration above.
			-- Useful when disabling certain features of an LSP (for example, turning off formatting for ts_ls)
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			require("lspconfig")[server_name].setup(server)
		end,
	},
})
