# Roblox Namecall Hooks
This quick module allows you to stop Remote Events and Remote Functions from firing

> [!NOTE]
> These hooks are not ment for server siding! These just stop client sided events from sending to the server!

## Loadstring
Place this above all the requests u make to the module (Dont put it in a function either.)
```lua
local ezhooks = loadstring(game:HttpGet("https://raw.githubusercontent.com/HyptoHax/Hooks/main/hooks.lua"),true)();
```

## Using
### Normal:
```lua
ezhooks:namecallHook("EventName", "FireType")
```

### Toggeling:
```lua
ezhooks:toggleHook("EventName", "FireType", Value)
```

## Variables:
**EventName:** Name of the event you want to control.

**FireType:** Type of firing in the event: "FireServer" for RemoteEvents and "InvokeServer" for RemoteFunctions.

**Value:** A boolean value (true or false) to enable or disable the event hook. (U can just use the value ur ui lib uses to toggle)

> [!NOTE]
> For RemoteEvents use "FireServer", For RemoteFunctions use "InvokeServer"!
