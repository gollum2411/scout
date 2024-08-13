-- ************ NOTE ************************
-- USEFUL THINGS TO REMEMBER ON THIS MIGRATION
--
-- -- "gc" to comment visual regions/lines
-- { 'numToStr/Comment.nvim', opts = {} },
--
--
--
require("rj_plugins")

-- vim.cmd([[colorscheme PaperColor]])

vim.g.tokyonight_colors = { border = "orange" }

local keymap_set = vim.keymap.set

vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-l>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
vim.g.UltiSnipsSnippetDirectories = { "~/ultisnips" }

vim.g.completion_enable_snippet = "UltiSnips"

vim.opt.incsearch = false
vim.opt.wildmode = "list:longest"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.switchbuf = "useopen,usetab,newtab"
vim.opt.cursorline = true

vim.cmd([[hi StatusLine guibg=orange]])
vim.cmd([[hi StatusLineNC guibg=orange]])
vim.cmd([[hi WinSeparator guibg=orange]])
vim.cmd([[hi TabLineSel guibg=97]])
vim.cmd([[set laststatus=2]])

keymap_set("n", "<F8>", "<cmd>mksession! vimsesh<cr> <cmd>wqa<cr>")
keymap_set("n", "<c-f>", "<cmd>Telescope find_files<cr>")

keymap_set("n", "<leader>e", "<cmd>Explore<cr>")
keymap_set("n", "<leader>t", "<cmd>tabe<cr>")
-- keymap_set("n", "<leader>rg", "<cmd>Telescope live_grep<cr>")
keymap_set("n", "<leader>u", "<cmd> UltiSnipsEdit <cr>")
keymap_set("n", "<leader>rg", ":Rg <C-r><C-w><cr>")
keymap_set("n", "<leader>grn", ":GoRename <cr>")

local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimports()
	end,
	group = format_sync_grp,
})
