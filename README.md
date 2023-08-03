# Roblox Namecall Hooks
This quick module allows you to stop Remote Events and Remote Functions from firing

> [!NOTE]
> These hooks are not ment for server siding! These just stop client sided events from sending to the server!

### Loadstring
Place this above all the requests u make to the module (Dont put it in a function either.)
```lua
local hooks = loadstring(game:HttpGet("https://raw.githubusercontent.com/HyptoHax/Hooks/main/hooks.lua"))()
```

### Using
Quick explenation on how to use it.

_For example_ we have a function named "lowerstamina" in a Remote Event (Keep track of the "Event"),
Because its a Remote Event we would call it "FireServer", If its an Remote Function we would call it like "InvokeServer".

We wanna make an infinite stamina for a game and to do that we would stop the "lowerstamina" event from firing!

So this is what we do.
```lua
hooks:namecall("lowerstamina", "FireServer")
```
This fires our module stopping the "FireServer" on "LowerStamina" from firing!
We have two properties on the module, One is the remote's name and the other one is the event.
If we would use an Remote Function it then we would use
```lua
hooks:namecall("lowerstamina", "InvokeServer")
```

> [!NOTE]
> For RemoteEvents use "FireServer", For RemoteFunctions use "InvokeServer"!
