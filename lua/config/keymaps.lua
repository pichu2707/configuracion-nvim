vim.keymap.set("n", "gb", ":bn<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gB", ":bp<CR>", { noremap = true, silent = true })
-- Tmux navigation handled by tmux.nvim plugin
-- Terminal manejado por toggleterm.nvim plugin
vim.keymap.set("n", "<leader>ac", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude" })
vim.keymap.set("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>", { desc = "Send to Claude" })

-- Split windows
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>", { noremap = true, silent = true, desc = "Split vertical" })
vim.keymap.set("n", "<leader>wh", ":split<CR>", { noremap = true, silent = true, desc = "Split horizontal" })
vim.keymap.set("n", "<leader>wq", ":q<CR>", { noremap = true, silent = true, desc = "Close window" })

-- Navigate windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Move to right window" })

-- Run file based on filetype
local function run_current_file()
	local ft = vim.bo.filetype
	local file = vim.fn.expand("%")

	if ft == "python" then
		vim.cmd("!python3 " .. file)
	elseif ft == "javascript" then
		vim.cmd("!node " .. file)
	elseif ft == "typescript" then
		vim.cmd("!ts-node " .. file)
	elseif ft == "sql" then
		vim.ui.input({ prompt = "Database file: " }, function(db)
			if db then
				vim.cmd("!sqlite3 " .. db .. " < " .. file)
			end
		end)
	elseif ft == "lua" then
		vim.cmd("!lua " .. file)
	elseif ft == "sh" or ft == "bash" then
		vim.cmd("!bash " .. file)
	else
		print("No run command configured for filetype: " .. ft)
	end
end

vim.keymap.set("n", "<leader>x", run_current_file, { desc = "Execute current file" })

-- Quick run with toggleterm (keeps terminal open)
local function run_in_toggleterm()
	local ft = vim.bo.filetype
	local file = vim.fn.expand("%:p")
	local cmd = ""

	if ft == "python" then
		cmd = 'python3 "' .. file .. '"'
	elseif ft == "javascript" then
		cmd = 'node "' .. file .. '"'
	elseif ft == "typescript" then
		cmd = 'ts-node "' .. file .. '"'
	elseif ft == "lua" then
		cmd = 'lua "' .. file .. '"'
	elseif ft == "sh" or ft == "bash" then
		cmd = 'bash "' .. file .. '"'
	else
		print("No run command configured for filetype: " .. ft)
		return
	end

	-- Usa la API de toggleterm para ejecutar el comando
	local Terminal = require("toggleterm.terminal").Terminal
	local run_term = Terminal:new({
		cmd = cmd,
		direction = "float",
		close_on_exit = false,
		on_open = function(term)
			vim.cmd("startinsert!")
		end,
	})
	run_term:toggle()
end

vim.keymap.set("n", "<leader>xx", run_in_toggleterm, { desc = "Execute file in terminal" })
vim.keymap.set("n", "<leader>ip", function()
	local src = vim.fn.expand("<cfile>")
	if src == "" then
		return
	end

	local base = vim.fn.expand("%:p:h")
	local path = src
	if not src:match("^https?://") and not src:match("^/") then
		path = base .. "/" .. src
	end

	local ok, img = pcall(require, "snacks.image")
	if ok and vim.fn.filereadable(path) == 1 then
		pcall(img.open, path)
	else
		vim.fn.jobstart({ "xdg-open", path }, { detach = true })
	end
end, { desc = "Preview image under cursor" })

-- LSP Diagnostics keymaps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show error details" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "List all diagnostics" })

-- Vite dev server in split terminal
vim.keymap.set("n", "<leader>vd", function()
	local Terminal = require("toggleterm.terminal").Terminal
	local vite_dev = Terminal:new({
		cmd = "npm run dev",
		direction = "horizontal",
		close_on_exit = false,
		auto_scroll = true,
	})
	vite_dev:toggle()
end, { desc = "Start Vite dev server (split)" })
