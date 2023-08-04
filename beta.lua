local ezhooks = {}
local activeHooks = {}

function ezhooks:namecallHook(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    local hookKey = self.Name .. ":" .. method
    if not checkcaller() and activeHooks[hookKey] then
        return -- Suppress the FireServer call if the hook is active
    end
    return self[method](self, ...)
end

function ezhooks:toggleHook(eventName, fireType, value)
  if value == true then
      local method = getnamecallmethod()
      local args = {...}
      local hookKey = self.Name .. ":" .. method
      if not checkcaller() and activeHooks[hookKey] then
          return -- Suppress the FireServer call if the hook is active
      end
      return self[method](self, ...)
  elseif value == false then
    return
end

return Hooks
