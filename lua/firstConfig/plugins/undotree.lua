return {
  "mbbill/undotree",
  config = function()
    -- Optional: Add a keybinding to toggle undotree
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
  end,
}
