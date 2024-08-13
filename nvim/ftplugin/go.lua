local keymap_set = vim.keymap.set

keymap_set("n", "<leader>gf", "<cmd>GoFillStruct<cr>")
keymap_set("n", "<leader>gie", "<cmd>GoIfErr<cr>")

local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

lspconfig.gopls.setup({
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
		},
	},
})
