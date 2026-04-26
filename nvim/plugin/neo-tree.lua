-- Neo-tree is a Neovim plugin to browse the file system
--  INFO: https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add({
	{ src = "https://github.com/MunifTanjim/nui.nvim" }, -- UI component library for Neovim
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = vim.version.range("3.x") },
})

vim.keymap.set("n", "<leader>e", ":Neotree<CR>", { desc = "Open Neotree" })
