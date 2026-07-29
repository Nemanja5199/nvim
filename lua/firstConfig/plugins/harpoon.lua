return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		-- Pin the current file to the list
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Harpoon add file" })

		-- Clear the whole list
		vim.keymap.set("n", "<leader>A", function()
			harpoon:list():clear()
		end, { desc = "Harpoon clear list" })

		-- Toggle the quick menu (see/reorder/delete pinned files)
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon menu" })

		-- Jump straight to slots 1-4 (Alt+number; <leader>1-4 is taken by tabs)
		for i = 1, 4 do
			vim.keymap.set("n", "<A-" .. i .. ">", function()
				harpoon:list():select(i)
			end, { desc = "Harpoon file " .. i })
		end

		-- Cycle through the list
		vim.keymap.set("n", "<A-[>", function()
			harpoon:list():prev()
		end, { desc = "Harpoon prev" })
		vim.keymap.set("n", "<A-]>", function()
			harpoon:list():next()
		end, { desc = "Harpoon next" })
	end,
}
