local M = {}

M.debug_log = function(msg)
  if (custom_debug == true) then
    print("[debug_log]: " .. msg)
  end
end

M.wrap = function(func, ...)
  local args = {...}
  M.debug_log("wrap")
  return function()
    func(unpack(args))
  end
end

M.go_to_main_window = function()
  local main_win_id = 1000
  vim.api.nvim_set_current_win(main_win_id)
end

M.is_in_table = function(x, input)
  for _, i in pairs(input) do
    if i == x then
      return true
    end
  end
  return false
end

return M
