-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

------------------- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<tab>", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<S-tab>", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- buffers
keymap.set("n", "<leader>n", "<cmd>bn<cr>", { desc = "Move to next buffer" })
keymap.set("n", "<leader>p", "<cmd>bp<cr>", { desc = "Move to previous buffer" })
-- keymap.set("n", "<leader>d", "<cmd>bd<cr>", { desc = "Delete buffer" })

-- Zen Mode
keymap.set("n", "<leader><leader>", "<cmd>ZenMode<cr>", { desc = "Zen Mode" })

-- File Rename
keymap.set("n", "<leader>cx", function()
	local new_name = vim.fn.input("New filename: ")
	local old_name = vim.fn.expand("%")
	local old_bufnr = vim.fn.bufnr("%")

	-- Write the new file
	vim.cmd("write " .. vim.fn.fnameescape(new_name))

	-- Edit the new file
	vim.cmd("edit " .. vim.fn.fnameescape(new_name))

	-- Delete the old file from the filesystem
	vim.fn.system("rm " .. vim.fn.shellescape(old_name))

	-- Delete the buffer of the old file
	vim.cmd("bdelete " .. old_bufnr)

	print("File copied to " .. new_name .. ", old file deleted, and old buffer removed.")
end, { noremap = true, silent = true, desc = "Rename file" })

-- keymap.set("n", "<leader>r", function()
-- 	-- Autocommand to trigger when rename opens the prompt
-- 	local cmdId
-- 	cmdId = vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
-- 		callback = function()
-- 			local key = vim.api.nvim_replace_termcodes("<C-f>", true, false, true)
-- 			vim.api.nvim_feedkeys(key, "c", false)
-- 			vim.api.nvim_feedkeys("0", "n", false)
-- 			cmdId = nil
-- 			return true
-- 		end,
-- 	})
-- 	vim.lsp.buf.rename()
-- 	vim.defer_fn(function()
-- 		if cmdId then
-- 			vim.api.nvim_del_autocmd(cmdId)
-- 		end
-- 	end, 500)
-- end, { desc = "Rename symbol" })
