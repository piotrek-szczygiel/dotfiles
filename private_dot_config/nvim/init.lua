vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.winborder = "rounded"
vim.o.clipboard = "unnamedplus"

vim.keymap.set("n", "<leader>r", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")

vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y<CR>')
vim.keymap.set({ "n", "v", "x" }, "<leader>d", '"+d<CR>')

vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup {
	settings = {
		Lua = {
			format = {
				defaultConfig = {
					quote_style = "double"
				}
			},
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
					"require"
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
vim.cmd("set completeopt+=noselect")

vim.diagnostic.config({
	virtual_text = true,
	signs = false,
	underline = true,
	update_in_insert = false,
})

require "mini.pick".setup()
require "nvim-treesitter.configs".setup({
	ensure_installed = {},
	highlight = { enable = true }
})
require "mason".setup()

require "catppuccin".setup({
	background = {
		light = "latte",
		dark = "mocha"
	}
})
vim.cmd.colorscheme "catppuccin"

vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
vim.keymap.set("n", "<leader>e", ":Oil<CR>")
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.lsp.enable({ "lua_ls" })
