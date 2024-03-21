Status = function()
	local diagnostics = table.concat({
		"E:" .. #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }),
		"W:" .. #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN }),
		"I:" .. #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO }),
		"H:" .. #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HELP }),
	}, " ")

	local file_info = table.concat({
		vim.bo.fileencoding,
		vim.bo.fileformat,
		vim.bo.filetype,
	}, " ")

	return table.concat({
		" %t%m%r%h%w",
		diagnostics,
		"%=",
		file_info,
		"%v:%l ",
	}, " | ")
end

vim.o.statusline = "%!luaeval('Status()')"
