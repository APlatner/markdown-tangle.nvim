local M = {}

M.tangle = function(args)
	local filename
	if args then
		filename = args
	else
		filename = vim.api.nvim_buf_get_name(0)
	end
	if string.find(filename, ".md") then
		local file = io.open(filename, "r")
		if not file then
			print("failed to open selected file!")
			return
		end
		local line = file:read()
		local filenames = {}
		local code_file = nil
		while line do
			if string.find(line, "```c") and not code_file then
				local name = filename:sub(0, #filename - 2) .. "c"
				for _, n in ipairs(filenames) do
					if n == name then
						code_file = io.open(name, "a")
					end
				end
				if not code_file then
					code_file = io.open(name, "w")
					filenames[#filenames + 1] = name
				end
			elseif string.find(line, "```lua") and not code_file then
				local name = filename:sub(0, #filename - 2) .. "lua"
				for _, n in ipairs(filenames) do
					if n == name then
						code_file = io.open(name, "a")
					end
				end
				if not code_file then
					code_file = io.open(name, "w")
					filenames[#filenames + 1] = name
				end
			elseif string.find(line, "```") and code_file then
				code_file:close()
				code_file = nil
			elseif code_file then
				code_file:write(line, "\n")
			end
			line = file:read()
		end
		file:close()
	end
end

vim.api.nvim_create_user_command("Tangle", function(opts)
	M.tangle(opts.args)
end, { nargs = "?" })

--[[
M.tangle_exec = function(filename)
	if string.find(filename, ".md") then
		local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
		local in_code_block = nil
		local code = ""
		for _, line in ipairs(lines) do
			if string.find(line, "```lua") and not in_code_block then
				in_code_block = true
			elseif string.find(line, "```") and in_code_block then
				in_code_block = nil
				code = "lua << EOF\n" .. code .. "EOF"
				vim.cmd(code)
				code = ""
			elseif in_code_block then
				code = code .. line .. "\n"
			end
		end
	end
end]]

--[[
use current buffer
create new file

:Tangle {current_buffer}

--]]

return M
