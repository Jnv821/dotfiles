return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		---requires = {
		-- 'williamboman/mason.nvim',
		--'neovim/nvim-lspconfig'
		--},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					--"csharp_ls",
					"clangd",
					--"cssls",
					--"html",
					--"java_language_server",
					"eslint",
					"jsonls",
					"markdown_oxide",
					--"ast_grep",
					"rust_analyzer",
					--"pylsp",
					--"ruby_lsp",
					--"intelephense",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
			lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
			lspconfig.clangd.setup({
        capabilities = capabilities
      })
			lspconfig.eslint.setup({
        capabilities = capabilities
      })
			lspconfig.tsserver.setup({
        capabilities = capabilities
      })
      lspconfig.emmet_language_server.setup({
        capabilities = capabilities
      })
      lspconfig.jsonls.setup({
        capabilities = capabilities
      })
      lspconfig.cssls.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n" }, "ca", vim.lsp.buf.code_action, {})
		end,
	},
}
