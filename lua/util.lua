local M = {}

function M.root_pattern(...)
	local patterns = vim.tbl_flatten { ... }
	local function matcher(path)
	  for _, pattern in ipairs(patterns) do
      for _, p in ipairs(vim.fn.glob(M.path.join(M.path.escape_wildcards(path), pattern), true, true)) do
        if M.path.exists(p) then
        return path
        end
      end
	  end
	end
	return function(startpath)
	  startpath = M.strip_archive_subpath(startpath)
	  return M.search_ancestors(startpath, matcher)
	end
end

return M