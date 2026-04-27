vim.pack.add({
	"https://github.com/esmuellert/codediff.nvim",
	"https://github.com/neogitorg/neogit",
})

vim.keymap.set("n", "<leader>g", ":Neogit<CR>", { desc = "Open Neogit" })
