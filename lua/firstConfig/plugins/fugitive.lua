return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })

		-- Merge conflicts: open the 3-way split (OURS | working | THEIRS),
		-- then pull the hunk you want from either side.
		vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit!<CR>", { desc = "Git 3-way diff split" })
		vim.keymap.set("n", "<leader>gh", "<cmd>diffget //2<CR>", { desc = "Conflict: take OURS (left)" })
		vim.keymap.set("n", "<leader>gl", "<cmd>diffget //3<CR>", { desc = "Conflict: take THEIRS (right)" })
	end,
}
