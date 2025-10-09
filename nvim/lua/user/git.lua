vim.api.nvim_create_user_command("CopyFileURL", function(opts)
	-- full path of the current file
	local file = vim.fn.expand("%:p:h")
	-- repo root
	local repo_root = vim.fn.systemlist("git -C " .. file .. " rev-parse --show-toplevel")[1]
	-- relative path inside repo
	local rel_path = vim.fn.fnamemodify(vim.fn.expand("%"), ":." .. repo_root)

	-- remote URL (convert SSH → HTTPS)
	local remote = vim.fn.systemlist("git -C " .. repo_root .. " remote get-url origin")[1]
	remote = remote:gsub("git@([^:]+):", "https://%1/"):gsub("%.git$", "")

	-- current branch (fallback to commit hash if detached)
	local branch = vim.fn.systemlist("git -C " .. repo_root .. " rev-parse --abbrev-ref HEAD")[1]
	if branch == "HEAD" then
		branch = vim.fn.systemlist("git -C " .. repo_root .. " rev-parse HEAD")[1]
	end

	-- handle line or range
	local linepart = ""
	if opts.range == 0 then
		-- no range → just current line
		local line = vim.fn.line(".")
		linepart = "#L" .. line
	else
		-- range from visual or :10,20 command
		local start_line = opts.line1
		local end_line = opts.line2
		if start_line == end_line then
			linepart = "#L" .. start_line
		else
			linepart = string.format("#L%d-L%d", start_line, end_line)
		end
	end

	local link = string.format("%s/blob/%s/%s%s", remote, branch, rel_path, linepart)

	-- copy to clipboard
	vim.fn.setreg("+", link)
	print("Copied: " .. link)
end, { range = true })
