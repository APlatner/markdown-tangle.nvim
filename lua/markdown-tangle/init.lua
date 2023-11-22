local M = {}

M.tangle = function(filename)
	if string.find(filename, ".md") then
		local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
		local file = nil
		local filenames = {}
		for _, line in ipairs(lines) do
			if string.find(line, "```c") and not file then
				local name = filename:sub(0, #filename - 3) .. ".c"
				for _, n in ipairs(filenames) do
					if n == name then
						file = io.open(name, "a")
					end
				end
				if not file then
					file = io.open(name, "w")
					filenames[#filenames + 1] = name
				end
			elseif string.find(line, "```lua") and not file then
				local name = filename:sub(0, #filename - 3) .. ".lua"
				for _, n in ipairs(filenames) do
					if n == name then
						file = io.open(name, "a")
					end
				end
				if not file then
					file = io.open(name, "w")
					filenames[#filenames + 1] = name
				end
			elseif string.find(line, "```") and file then
				file:close()
				file = nil
			elseif file then
				file:write(line, "\n")
			end
		end
	end
end

vim.api.nvim_create_user_command("Tangle", "lua require('markdown-tangle').tangle(vim.fn.expand('%'))", {})

--[[
use current buffer
create new file

:Tangle {current_buffer}

--]]

return M
