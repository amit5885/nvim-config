return {
	{
		"Exafunction/codeium.vim",
		config = function()
			-- Disable default keymaps
			vim.g.codeium_disable_bindings = 1
			-- Use Tab for Codeium completion
			vim.keymap.set("i", "<Tab>", function()
				if vim.fn["codeium#Accept"]() ~= "" then
					return vim.fn["codeium#Accept"]()
				else
					return vim.fn["copilot#Accept"]("<Tab>")
				end
			end, { expr = true })
			-- Other keybindings
			vim.keymap.set("i", "<c-;>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true })
			vim.keymap.set("i", "<c-,>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true })
			vim.keymap.set("i", "<c-x>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true })
			-- Optional: Set filetypes to disable Codeium
			vim.g.codeium_filetypes = {
				TelescopePrompt = false,
				DressingInput = false,
			}
			-- Optional: Change the indicator color (replace RRGGBB with desired hex color)
			vim.cmd("hi CodeiumSuggestion guifg=#RRGGBB ctermfg=8")
			-- Optional: Add a command to toggle Codeium
			vim.api.nvim_create_user_command("CodeiumToggle", function()
				if vim.g.codeium_enabled == false then
					vim.g.codeium_enabled = true
					print("Codeium: Enabled")
				else
					vim.g.codeium_enabled = false
					print("Codeium: Disabled")
				end
			end, {})
			-- Optional: Status line integration
			function _G.GetCodeiumStatus()
				return vim.fn["codeium#GetStatusString"]()
			end
			vim.opt.statusline:append(" %{%v:lua.GetCodeiumStatus()%}")
		end,
	},
}
