return {
	{
		"rose-pine/neovim",
		priority = 1000,
		config = function()
			vim.cmd("highlight clear")
			-- Enable true colors
			vim.opt.termguicolors = true

			-- Configure Rose Pine theme
			require("rose-pine").setup({

				-- Rose Pine options can be set here
				variant = "auto", -- "main", "moon", "dawn"
				dark_variant = "main", -- "main", "moon", "dawn"

				dim_inactive_windows = false,
				extend_background_behind_borders = true,
				-- You can add custom highlights if needed:
				-- on_highlights = function(hl, c)
				--   hl.Keyword = { fg = "#ff00ff" }
				--   hl.Function = { fg = "#00ffff" }
				-- end,

				transparent = true,
				styles = {
					bold = true,
					italic = true,
					sidebars = "transparent",
					floats = "transparent",
					transparency = true,
				},

				groups = {
					border = "muted",
					link = "iris",
					panel = "surface",

					error = "love",
					hint = "iris",
					info = "foam",
					note = "pine",
					todo = "rose",
					warn = "gold",

					git_add = "foam",
					git_change = "rose",
					git_delete = "love",
					git_dirty = "rose",
					git_ignore = "muted",
					git_merge = "iris",
					git_rename = "pine",
					git_stage = "iris",
					git_text = "rose",
					git_untracked = "subtle",

					h1 = "iris",
					h2 = "foam",
					h3 = "rose",
					h4 = "gold",
					h5 = "pine",
					h6 = "foam",
				},
			})

			-- Load colorscheme
			vim.cmd("colorscheme rose-pine")

			-- -- Set all line numbers to yellow
			vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffff00", bold = true })
			vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffff00", bold = true })

			-- Function to ensure highlights are applied
			local function apply_custom_highlights()
				vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
			end
			-- Apply custom highlights
			apply_custom_highlights()
			-- Reapply highlights on ColorScheme and BufEnter events
			vim.api.nvim_create_autocmd({ "ColorScheme", "BufEnter" }, {
				pattern = "*",
				callback = apply_custom_highlights,
			})
		end,
	},
}
