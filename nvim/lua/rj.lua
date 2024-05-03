-- ************ NOTE ************************
-- USEFUL THINGS TO REMEMBER ON THIS MIGRATION
--
-- -- "gc" to comment visual regions/lines
-- { 'numToStr/Comment.nvim', opts = {} },
--
--

local keymap_set = vim.keymap.set

vim.opt.incsearch = false

vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-l>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
-- vim.g.UltiSnipsSnippetDirectories = { "~/ultisnips" }

vim.g.completion_enable_snippet = "UltiSnips"

vim.cmd([[colorscheme PaperColor]])

keymap_set("n", "<F8>", "<cmd>mksession! vimsesh<cr> <cmd>wqa<cr>")
keymap_set("n", "<c-f>", "<cmd>Telescope find_files<cr>")

keymap_set("n", "<leader>e", "<cmd>Explore<cr>")
keymap_set("n", "<leader>t", "<cmd>tabe<cr>")
keymap_set("n", "<leader>rg", "<cmd>Telescope live_grep<cr>")

