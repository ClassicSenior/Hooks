local ezhooks = {}
local activeHooks = {}

function ezhooks:namecallHook(namecallname, callmethodd)
    local eventbypass
    eventbypass = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        if not checkcaller() and self.Name == namecallname and method == callmethodd then
            return wait(9e9);
        end
        return eventbypass(self, ...)
    end)
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
        activeHooks[hookKey] = hookmetamethod(remoteEvent, fireType, namecallHook)
    else
        if not activeHooks[hookKey] then
            return -- Hook is already inactive, no need to deactivate again
        end
        activeHooks[hookKey]:Disconnect()
        activeHooks[hookKey] = nil
    end
end

return ezhooks
