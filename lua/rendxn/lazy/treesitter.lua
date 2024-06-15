return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"vimdoc",
				"javascript",
				"typescript",
				"lua",
				"jsdoc",
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
			auto_install = false,

			indent = {
				enable = true,
			},

			highlight = {
				enable = true,

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = { "markdown" },
			},

			textobjects = {
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]m"] = { query = "@function.outer", desc = "Next function start" },
						["]]"] = { query = "@class.outer", desc = "Next class start" },
						--
						-- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
						["]o"] = { query = "@loop.*", desc = "Next loop" },
						-- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
						--
						-- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
						-- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
						["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
						["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
						["]p"] = { query = "@parameter.inner", desc = "Next parameter" },
					},
					goto_next_end = {
						["]M"] = { query = "@function.outer", desc = "Next function end" },
						["]["] = { query = "@class.outer", desc = "Next class end" },
					},
					goto_previous_start = {
						["[m"] = { query = "@function.outer", desc = "Previous function" },
						["[["] = { query = "@class.outer", desc = "Previous class" },
						["[p"] = { query = "@parametey.inner", desc = "Previous parameter" },
						["[z"] = { query = "@fold", query_group = "folds", desc = "Previous fold" },
						["]o"] = { query = "@loop.*", desc = "Previous loop" },
					},
					goto_previous_end = {
						["[M"] = { query = "@function.outer", "Previous function end" },
						["[]"] = { query = "@class.outer", desc = "Previous class end" },
					},
					-- Below will go to either the start or the end, whichever is closer.
					-- Use if you want more granular movements
					-- Make it even more gradual by adding multiple queries and regex.
					goto_next = {
						["]d"] = { query = "@conditional.outer", desc = "Next conditional" },
					},
					goto_previous = {
						["[d"] = { query = "@conditional.outer", desc = "Previous conditional" },
					},
				},
			},
		})
	end,
}
