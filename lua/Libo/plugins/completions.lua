return {
	{
		"hrsh7th/cmp-nvim-lsp",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"L3MON4D3/LuaSnip",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	{
		"hrsh7th/nvim-cmp",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			local luasnip = require("luasnip")

			cmp.setup({
				experimental = {
					ghost_text = true,
				},
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						luasnip.lsp_expand(args.body) -- For `luasnip` users.
						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
						-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
        formatting = {
            fields = { "abbr", "menu", "kind" },
            format = function(entry, item)
                -- Define menu shorthand for different completion sources.
                local menu_icon = {
                    nvim_lsp = "NLSP",
                    nvim_lua = "NLUA",
                    luasnip  = "LSNP",
                    buffer   = "BUFF",
                    path     = "PATH",
                }
                -- Set the menu "icon" to the shorthand for each completion source.
                item.menu = menu_icon[entry.source.name]

                -- Set the fixed width of the completion menu to 60 characters.
                -- fixed_width = 20

                -- Set 'fixed_width' to false if not provided.
                fixed_width = fixed_width or false

                -- Get the completion entry text shown in the completion window.
                local content = item.abbr

                -- Set the fixed completion window width.
                if fixed_width then
                    vim.o.pumwidth = fixed_width
                end

                -- Get the width of the current window.
                local win_width = vim.api.nvim_win_get_width(0)

                -- Set the max content width based on either: 'fixed_width'
                -- or a percentage of the window width, in this case 20%.
                -- We subtract 10 from 'fixed_width' to leave room for 'kind' fields.
                local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.2)

                -- Truncate the completion entry text if it's longer than the
                -- max content width. We subtract 3 from the max content width
                -- to account for the "..." that will be appended to it.
                if #content > max_content_width then
                    item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
                else
                    item.abbr = content .. (" "):rep(max_content_width - #content)
                end
                return item
            end,
        },
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<Tab>"] = cmp.mapping(function(fallback)
                        if luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						elseif cmp.visible() then
							cmp.select_next_item()
							if #cmp.get_entries() == 1 then
								cmp.confirm()
							end
					 	else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						elseif cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { "i", "s" }),
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					-- { name = "vsnip" }, -- For vsnip users.
					{ name = "luasnip" }, -- For luasnip users.
					-- { name = 'ultisnips' }, -- For ultisnips users.
					-- { name = 'snippy' }, -- For snippy users.
				}, {
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},
}
