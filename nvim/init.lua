--[[ INIT.LUA ✨

  You can use `:help lua-guide` as a reference for how Neovim integrates Lua.
  HTML version: https://neovim.io/doc/user/lua-guide.html

  Useful commands:
  - `:Tutor`, a tutorial for Neovim
  - `:help`, help documentation, "The Friendly Manual"
  - `:checkhealth`, diagnoses Neovim configuration for any errors

--]]

-- Set English language as default (otherwise Neovim will use OS language)
vim.api.nvim_exec2("language en_US", { output = false })

-- Set <space> as the leader key
--   See `:help mapleader`
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

--[[ SETTING OPTIONS 🔧

  Below you can set options for Neovim
    See `:help vim.opt`:
    and `:help option-list`

--]]

-- Make line numbers default
vim.opt.number = true

-- Make relative line numbers default
vim.opt.relativenumber = true

-- Enable mouse mode, 'a' for all modes
vim.opt.mouse = "a"

-- Don't show the mode name in the bottom line, as it's already in the Neovim status line
vim.opt.showmode = false

-- Sync clipboard between your OS and Neovim.
--   See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
--   This means if your text needs to be wrapped to a new line it will adhere to the same indentation.
vim.opt.breakindent = true

-- Save undo history per file (or buffer)
vim.opt.undofile = true

-- Case-insensitive searching unless you use \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Always draw the signcolumn by default
--   Sign column is the leftmost column reserved for signs, such as changed rows in Git etc.
vim.opt.signcolumn = "yes"

-- Decrease update time
--   This the time in milliseconds it takes for Neovim to run various autocmd events after typing
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
--   This displays which-key popup sooner after pressing <leader>
vim.opt.timeoutlen = 300

-- Configure how new window splits should be opened
vim.opt.splitright = true -- Vertical splits open to the right by default
vim.opt.splitbelow = true -- Horizontal splits open below by default

-- Sets how Neovim will display certain whitespace characters in the editor
--   See `:help 'list'`
--   and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions (:s) live as you type
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- If performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
--   See `:help 'confirm'`
vim.opt.confirm = true

-- Tabs over spaces, bitch
vim.opt.tabstop = 4 -- number of spaces a tab counts for
vim.opt.shiftwidth = 2 -- number of spaces for each indentation level

--[[ KEYMAPS ⌨️

  Set any global keymaps below. Some keymaps are also found inside plugins/ files
    See `:help vim.keymap.set()`

--]]

-- Clear highlights on search when pressing <Esc> in normal mode
--   See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Move between buffers (open windows or files)
vim.keymap.set("n", "<C-p>", ":bp <CR>", { desc = "Move to previous file in buffer" })
vim.keymap.set("n", "<C-n>", ":bn <CR>", { desc = "Move to next file in buffer" })

-- Exit terminal mode in the builtin terminal (:term) more easily than the default <C-\><C-n>
--   NOTE: This won't work in all terminal emulators or tmux. In that case you can try another mapping.
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!"<CR>')

-- Keybinds to make split navigation easier
--   See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

--[[ AUTOCOMMANDS ⚙️

  Some autocommands are found in plugin files.
    See `:help lua-guide-autocommands`

--]]

-- Highlight when yanking (copying) text
--   See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("yank-highlight", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

--[[ PLUGINS 🧩

    Most of the plugins are automatically sourced from the plugins/ folder.
    Plugins that do not have separate configuration are listed here.

--]]

vim.pack.add({
	-- Use "gc" to comment visual regions/lines
	"https://github.com/numtostr/comment.nvim",
	-- Allow use of Nerd Font icons (glyphs) with Neovim plugins
	"https://github.com/nvim-tree/nvim-web-devicons",
	-- Helper functions for Neovim
	"https://github.com/nvim-lua/plenary.nvim",
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
