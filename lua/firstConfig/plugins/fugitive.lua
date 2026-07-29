return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })

		-- Merge conflicts: open the 3-way split (OURS | working | THEIRS),
		-- then pull the hunk you want from either side.
		vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit!<CR>", { desc = "Git 3-way diff split" })
		vim.keymap.set("n", "<leader>gh", "<cmd>diffget //2<CR>", { desc = "Conflict: take OURS (left)" })
		vim.keymap.set("n", "<leader>gl", "<cmd>diffget //3<CR>", { desc = "Conflict: take THEIRS (right)" })

		-- List every conflicted file in the quickfix window.
		-- Jump between them with <C-k>/<C-j> (already mapped to :cnext/:cprev).
		vim.keymap.set("n", "<leader>gc", function()
			local root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
			if vim.v.shell_error ~= 0 or not root or root == "" then
				vim.notify("Not inside a git repo", vim.log.levels.ERROR)
				return
			end
			local files = vim.fn.systemlist(
				"git -C " .. vim.fn.shellescape(root) .. " diff --name-only --diff-filter=U"
			)
			if #files == 0 then
				vim.notify("No merge conflicts 🎉", vim.log.levels.INFO)
				return
			end
			local items = {}
			for _, f in ipairs(files) do
				table.insert(items, { filename = root .. "/" .. f, lnum = 1, text = "conflict" })
			end
			vim.fn.setqflist({}, "r", { title = "Merge conflicts", items = items })
			vim.cmd("copen")
		end, { desc = "Git conflicts -> quickfix" })
	end,
}
