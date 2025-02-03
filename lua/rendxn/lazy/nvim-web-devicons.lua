return {
	"nvim-tree/nvim-web-devicons",
	config = function()
		require("nvim-web-devicons").setup({
			override = {
				go = {
					icon = "",
					color = "#00ADD8",
					name = "Go",
				},
				["go.mod"] = {
					icon = "",
					color = "#ec407a",
					name = "GoMod",
				},
				["go.work"] = {
					icon = "",
					color = "#ec407a",
					name = "GoWork",
				},
				["go.sum"] = {
					icon = "",
					color = "#ec407a",
					name = "GoSum",
				},
			},
		})
	end,
}
