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
    if value then
        if activeHooks[hookKey] then
            return -- Hook is already active, no need to activate again
        end
        activeHooks[hookKey] = hookmetamethod(game:GetService("ReplicatedStorage")[eventName], fireType, namecallHook)
    else
        if not activeHooks[hookKey] then
            return -- Hook is already inactive, no need to deactivate again
        end
        activeHooks[hookKey]:Disconnect()
        activeHooks[hookKey] = nil
    end
end


return ezhooks
