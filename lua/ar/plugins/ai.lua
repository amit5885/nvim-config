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
	-- {
	-- 	"supermaven-inc/supermaven-nvim",
	-- 	config = function()
	-- 		require("supermaven-nvim").setup({
	-- 			keymaps = {
	-- 				accept_suggestion = "<Tab>",
	-- 				clear_suggestion = "<C-x>",
	-- 				accept_word = "<C-j>",
	-- 			},
	-- 			ignore_filetypes = {
	-- 				TelescopePrompt = true,
	-- 				DressingInput = true,
	-- 			},
	-- 			color = {
	-- 				suggestion_color = "#888888", -- similar to your codeium color
	-- 				cterm = 8,
	-- 			},
	-- 			log_level = "info", -- set to "off" to disable logging completely
	-- 			disable_inline_completion = false,
	-- 			disable_keymaps = false,
	-- 		})

	-- 		-- Cycle through suggestions (similar to Codeium's cycle functionality)
	-- 		vim.keymap.set("i", "<c-;>", function()
	-- 			vim.cmd("SupermavenUseSuggestion 1") -- next suggestion
	-- 		end, { expr = false, desc = "Next Supermaven suggestion" })

	-- 		vim.keymap.set("i", "<c-,>", function()
	-- 			vim.cmd("SupermavenUseSuggestion -1") -- previous suggestion
	-- 		end, { expr = false, desc = "Previous Supermaven suggestion" })

	-- 		-- Optional: Set filetypes to disable Supermaven (similar to Codeium)
	-- 		-- Already handled in ignore_filetypes above

	-- 		-- Optional: Add a command to toggle Supermaven
	-- 		vim.api.nvim_create_user_command("SupermavenToggle", function()
	-- 			local api = require("supermaven-nvim.api")
	-- 			if api.is_running() then
	-- 				vim.cmd("SupermavenStop")
	-- 				print("Supermaven: Disabled")
	-- 			else
	-- 				vim.cmd("SupermavenStart")
	-- 				print("Supermaven: Enabled")
	-- 			end
	-- 		end, { desc = "Toggle Supermaven" })

	-- 		-- Optional: Status line integration
	-- 		function _G.GetSupermavenStatus()
	-- 			local api = require("supermaven-nvim.api")
	-- 			if api.is_running() then
	-- 				return "SM"
	-- 			else
	-- 				return ""
	-- 			end
	-- 		end
	-- 		vim.opt.statusline:append(" %{%v:lua.GetSupermavenStatus()%}")
	-- 	end,
	-- },
	{
		"NickvanDyke/opencode.nvim",
		dependencies = { "folke/snacks.nvim" },
		opts = {
			auto_fallback_to_embedded = false,
		},
		keys = {
			{
				"<leader>oa",
				function()
					require("opencode").ask()
				end,
				desc = "Ask opencode",
				mode = "n",
			},
			{
				"<leader>oa",
				function()
					require("opencode").ask("@selection: ")
				end,
				desc = "Ask opencode about selection",
				mode = "v",
			},
			{
				"<leader>op",
				function()
					require("opencode").select_prompt()
				end,
				desc = "Select prompt",
				mode = { "n", "v" },
			},
		},
	},
}
