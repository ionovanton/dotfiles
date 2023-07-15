local M = {}

M.debug_log = function(msg)
  if (custom_debug == true) then
    print("[debug_log]: " .. msg)
  end
end

M.wrap = function(func, ...)
  local args = {...}
  M.debug_log(func)
  return function()
    func(unpack(args))
  end
end

return M
