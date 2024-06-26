return {
 "rebelot/kanagawa.nvim",
  lazy = false,
  name = "kanagawa",
  priority = 2000,
  config = function()
    local kanagawa = require('kanagawa')

    kanagawa.setup({
      transparent = true,

      overrides = function(colors)
          local theme = colors.theme
          return {
              NormalFloat = { bg = "none" },
              FloatBorder = { bg = "none" },
              FloatTitle = { bg = "none" },

              -- Save an hlgroup with dark background and dimmed foreground
              -- so that you can use it where your still want darker windows.
              -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
              NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

              -- Popular plugins that open floats will link to NormalFloat by default;
              -- set their background accordingly if you wish to keep them dark and borderless
              LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
              MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

              -- telescope style
              TelescopeTitle = { fg = theme.ui.special, bold = true },
              TelescopePromptNormal = { bg = theme.ui.bg_p1 },
              TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
              TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
              TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
              TelescopePreviewNormal = { bg = theme.ui.bg_dim },
              TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
          }
      end,
    })


    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "kanagawa",
      callback = function()
          if vim.o.background == "light" then
              vim.fn.system("kitty +kitten themes Kanagawa_light")
          elseif vim.o.background == "dark" then
              vim.fn.system("kitty +kitten themes Kanagawa_dragon")
          else
              vim.fn.system("kitty +kitten themes Kanagawa")
          end
      end,
    })

    vim.cmd.colorscheme "kanagawa-wave"
  end
}
