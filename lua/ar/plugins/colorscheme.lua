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
				variant = "main", -- "main", "moon", "dawn"
				dark_variant = "main", -- "main", "moon", "dawn"
				disable_background = true, -- Set to true for transparent background
				-- You can add custom highlights if needed:
				-- on_highlights = function(hl, c)
				--   hl.Keyword = { fg = "#ff00ff" }
				--   hl.Function = { fg = "#00ffff" }
				-- end,
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
