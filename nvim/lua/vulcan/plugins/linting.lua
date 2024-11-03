return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- require('lint').linters.your_linter_name = {
		--   cmd = 'linter_cmd',
		--   stdin = true, -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
		--   append_fname = true, -- Automatically append the file name to `args` if `stdin = false` (default: true)
		--   args = {}, -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
		--   stream = nil, -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
		--   ignore_exitcode = false, -- set this to true if the linter exits with a code != 0 and that's considered normal.
		--   env = nil, -- custom environment table to use with the external process. Note that this replaces the *entire* environment, it is not additive.
		--   parser = your_parse_function
		-- }

		lint.linters_by_ft = {
			python = { "pylint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
