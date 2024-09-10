return {
	{
		"chrisgrieser/cmp-nerdfont",
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		config = function() end,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()
			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						--vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
						-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
					end,
				},
				window = {
					completion = cmp.config.window.bordered({
						winhighlight = "Normal:CmpMenu,FloatBorder:CmpMenu,CursorLine:MatchParen,Search:MsgArea",
					}),
					documentation = cmp.config.window.bordered(),
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						local icons = {
							Class = " ",
							Constructor = "󰝡 ",
							Function = "󰊕 ",
							Keyword = " ",
							Method = "󰊕 ",
							Module = " ",
							Snippet = "󰌨 ",
							Text = "󰦨 ",
							Variable = "󰫧 ",
						}
						vim_item.menu = "(" .. vim_item.kind .. ") : "

						vim_item.kind = icons[vim_item.kind] or " "

						return vim_item
					end,
				},

				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Enter>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					-- { name = "vsnip" }, -- For vsnip users.
					{ name = "luasnip" }, -- For luasnip users.
					-- { name = 'ultisnips' }, -- For ultisnips users.
					-- { name = 'snippy' }, -- For snippy users.
					{ name = "buffer" },
					{ name = "look" },
					{ name = "nerdfont" },
				}),
			})
		end,
	},
}
