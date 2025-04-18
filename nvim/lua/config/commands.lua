-- Prompt to save when trying to quit with unsaved changes
vim.api.nvim_create_user_command("Q", function(opts)
	-- Check `!` option
	if opts.bang then
		vim.cmd("quitall!") -- Quit without saving
		return
	end
	-- Get all modified buffers
	local buffers = {}
	local names = {}
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if not vim.api.nvim_buf_is_loaded(buf) then goto continue end
		if not vim.api.nvim_buf_get_option(buf, "modified") then goto continue end
		table.insert(buffers, buf)
		local name = vim.api.nvim_buf_get_name(buf)
		-- Fallback if buffer has no name
		if name == "" then name = "[No Name]" end
		table.insert(names, name)
		::continue::
	end
	-- Exit if no unsaved buffers
	if #names == 0 then
		vim.cmd("q")
		return
	end
	local prompt = "You have unsaved changes:\n  " .. table.concat(names, "\n  ") .. "\nDo you want to save?"
	local answer = vim.fn.confirm(prompt, "&Yes\n&No\n&Cancel", 3)
	if answer == 1 or answer == 121 then
		-- Handle unnamed buffers
		local unnamed_count = 0
		for i=1,#names do
			local suffix = ""
			if unnamed_count > 0 then
				suffix = "-" .. unnamed_count
			end
			if names[i] == "[No Name]" then
				local new_name = "unnamed" .. suffix .. ".txt"
				vim.api.nvim_buf_set_name(buffers[i], new_name)
				unnamed_count = unnamed_count + 1
				vim.api.nvim_buf_call(buffers[i], function() vim.cmd("write") end)
			end
		end
		vim.cmd("bufdo wq") -- Save before quitting
	end
	if answer == 2 or answer == 110 then
		vim.cmd("quitall!") -- Quit without saving
	end
end, {bang = true})
