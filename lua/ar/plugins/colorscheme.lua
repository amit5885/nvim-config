return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			vim.cmd("highlight clear")
			-- Enable true colors
			vim.opt.termguicolors = true

			-- Configure Tokyonight theme
			require("tokyonight").setup({
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
				on_highlights = function(hl, c)
					hl.Keyword = { fg = "#00ffff" }
					hl.Statement = { fg = "#ffff00" }
					hl.Function = { fg = "#00ffff" }
					hl.String = { fg = "#ff00ff" }
					hl.Comment = { fg = "#00ff00" }
					hl.Operator = { fg = "#ffff00" }
					hl.Type = { fg = "#0065ff" } -- int, string => blue
					hl.Constant = { fg = "#ff00ff" } -- true, false, nill
					hl.Number = { fg = "#ff00ff" }
					hl.Special = { fg = "#ffff00" }
				end,
			})

			-- Load colorscheme
			vim.cmd("colorscheme tokyonight")

			-- Set all line numbers to yellow
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
