require 'kickstart'

-- ************ NOTE ************************
-- USEFUL THINGS TO REMEMBER ON THIS MIGRATION
--
-- -- "gc" to comment visual regions/lines
-- { 'numToStr/Comment.nvim', opts = {} },
--
--

local keymap_set = vim.keymap.set

vim.opt.incsearch = false

vim.g.UltiSnipsExpandTrigger = '<tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
vim.g.UltiSnipsSnippetDirectories = { '~/ultisnips' }

vim.cmd [[colorscheme PaperColor]]

keymap_set('n', '<F8>', '<cmd>mksession! vimsesh<cr> <cmd>wqa<cr>')
keymap_set('n', '<leader>t', '<cmd>tabe<cr>')
