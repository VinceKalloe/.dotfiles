local plugins = {
	-- Extend Neovim power of 'i'nside and 'a'round
	{
		"echasnovski/mini.ai",
		-- event = "User FilePost",
		version = "*",
		config = function()
			require("mini.ai").setup()
		end,
	},
	-- Nice animations
	-- {
	-- 	"echasnovski/mini.animate",
	-- 	version = "*",
	-- 	-- event = "User FilePost",
	-- 	config = function()
	-- 		require("mini.animate").setup()
	-- 	end,
	-- },
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		opts = function()
			-- don't use animate when scrolling with the mouse
			local mouse_scrolled = false
			for _, scroll in ipairs({ "Up", "Down" }) do
				local key = "<ScrollWheel" .. scroll .. ">"
				vim.keymap.set({ "", "i" }, key, function()
					mouse_scrolled = true
					return key
				end, { expr = true })
			end

			local animate = require("mini.animate")
			return {
				resize = {
					timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
				},
				scroll = {
					timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
					subscroll = animate.gen_subscroll.equal({
						predicate = function(total_scroll)
							if mouse_scrolled then
								mouse_scrolled = false
								return false
							end
							return total_scroll > 1
						end,
					}),
				},
			}
		end,
	},
	-- Overview pane
	{
		"echasnovski/mini.map",
		branch = "stable",
		config = function()
			require("mini.map").setup()
			local map = require("mini.map")

			map.setup({
				integrations = {
					map.gen_integration.builtin_search(),
					map.gen_integration.gitsigns({
						add = "GitSignsAdd",
						change = "GitSignsChange",
						delete = "GitSignsDelete",
					}),
					map.gen_integration.diagnostic({
						error = "DiagnosticFloatingError",
						warn = "DiagnosticFloatingWarn",
						info = "DiagnosticFloatingInfo",
						hint = "DiagnosticFloatingHint",
					}),
				},
				symbols = {
					encode = map.gen_encode_symbols.dot("4x2"),
					scroll_line = "➽",
					scroll_view = "┃",
				},
				window = {
					side = "right", -- Side to stick ('left' or 'right')
					width = 17, -- Total width
					winblend = 25, -- Value of 'winblend' option
					focusable = true, -- Whether window is focusable in normal way (with `wincmd` or mouse)
					show_integration_count = false, -- Whether to show count of multiple integration highlights
				},
			})
		end,
	},
}
return plugins
