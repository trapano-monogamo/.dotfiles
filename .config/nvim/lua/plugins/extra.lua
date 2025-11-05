return {
	{
		"lervag/vimtex",
		{
			"Julian/lean.nvim",
			dependencies = {
				"neovim/nvim-lspconfig",
				"nvim-lua/plenary.nvim",
				"hrsh7th/nvim-cmp",  -- optional: autocompletion
			},
			opts = {
				-- lsp = {
				-- 	on_attach = function(_, bufnr)
				-- 		-- keymaps etc
				-- 	end
				-- },
				mappings = true,
			}
		},

		lazy = false,     -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
		end
	}
}
