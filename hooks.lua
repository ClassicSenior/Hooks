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

local function namecallHook(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    local hookKey = self.Name .. ":" .. method
    if not checkcaller() and activeHooks[hookKey] then
        return -- Suppress the FireServer call if the hook is active
    end
    return self[method](self, ...)
end

function ezhooks:toggleHook(eventName, fireType, value)
    local hookKey = eventName .. ":" .. fireType
    local remoteEvent = game:GetService("ReplicatedStorage"):FindFirstChild(eventName)
    if not remoteEvent or not remoteEvent:IsA("RemoteEvent") then
        return -- RemoteEvent not found or incorrect type, do not proceed
    end

    local toggleValue = (type(value) == "string") and (value:lower() == "true")

    if toggleValue then
        if activeHooks[hookKey] then
            return -- Hook is already active, no need to activate again
        end
        activeHooks[hookKey] = hookfunction(remoteEvent[fireType], namecallHook)
    else
        if not activeHooks[hookKey] then
            return -- Hook is already inactive, no need to deactivate again
        end
        activeHooks[hookKey]:Disconnect()
        activeHooks[hookKey] = nil
    end
end

return Hooks
