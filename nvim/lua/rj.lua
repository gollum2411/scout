-- ************ NOTE ************************
-- USEFUL THINGS TO REMEMBER ON THIS MIGRATION
--
-- -- "gc" to comment visual regions/lines
-- { 'numToStr/Comment.nvim', opts = {} },
--
--
--
require("rj_plugins")

local keymap_set = vim.keymap.set

vim.opt.incsearch = false

vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-l>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
vim.g.UltiSnipsSnippetDirectories = { "~/ultisnips" }

vim.g.completion_enable_snippet = "UltiSnips"

keymap_set("n", "<F8>", "<cmd>mksession! vimsesh<cr> <cmd>wqa<cr>")
keymap_set("n", "<c-f>", "<cmd>Telescope find_files<cr>")

keymap_set("n", "<leader>e", "<cmd>Explore<cr>")
keymap_set("n", "<leader>t", "<cmd>tabe<cr>")
keymap_set("n", "<leader>rg", "<cmd>Telescope live_grep<cr>")

local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimports()
	end,
	group = format_sync_grp,
})
