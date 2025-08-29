return {
	{
		"samharju/synthweave.nvim",
		priority = 1000,
		config = function()
			vim.opt.termguicolors = true

			-- Configure synthweave theme
			require("synthweave").setup({
				variant = "auto",
				dark_variant = "main",
				dim_inactive_windows = false,
				extend_background_behind_borders = true,
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
			vim.cmd("colorscheme synthweave")

			-- Function to ensure highlights are applied
			local function apply_custom_highlights()
				-- Keep transparency
				vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })

				-- Ensure Tree-sitter highlights are not overridden
				-- Force some basic syntax highlighting if Tree-sitter fails
				if vim.fn.exists("syntax_on") == 0 then
					vim.cmd("syntax enable")
				end
			end

			-- Apply custom highlights immediately
			apply_custom_highlights()

			-- Reapply highlights on ColorScheme event only
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "*",
				callback = apply_custom_highlights,
			})
		end,
	},
}
