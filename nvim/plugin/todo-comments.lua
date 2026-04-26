--[[

  FIX  = { color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
  TODO = { color = "info" },
  HACK = { color = "warning" },
  WARN = { color = "warning", alt = { "WARNING", "XXX" } },
  PERF = { alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
  NOTE = { color = "hint", alt = { "INFO" } },
  TEST = { color = "test", alt = { "TESTING", "PASSED", "FAILED" } },

--]]

vim.pack.add({ "https://github.com/folke/todo-comments.nvim" })

require("todo-comments").setup({ signs = false })
