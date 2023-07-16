local t = vim.fn.getbufinfo()
-- for a, b in ipairs(t) do
--   print(b.bufnr .. " " .. b.name .. " ")
--   if (b.signs == nil) then print("") else print(b.signs) end
-- end
local result = vim.lsp.buf.definition(7)
print(result)
