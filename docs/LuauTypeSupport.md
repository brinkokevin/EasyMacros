---
sidebar_position: 3
---

# Luau Type Support

[MacroTypes](https://github.com/brinkokevin/EasyMacros/blob/main/MacroTypes.lua) is an optional module that provides Luau type checking for the macros API. To always keep it up to date, it is recommended to use one of the methods below to add it to your project.

## Setup

### Method 1 - Plugin

Pressing the `Create Template` button will insert `MacroTypes` into ServerStorage. If a MacroTypes module is already detected anywhere in your project, the plugin will update it with the latest version.

### Method 2 - Wally

To add `MacroTypes` to your project using wally, add the following to your `wally.toml`:

`MacroTypes = "brinkokevin/easymacros@^0"`

## Usage

To use `MacroTypes` in your macro module, require it and assign the `MacroTypes.api` type to the `api` parameter in the render function.

```lua
local MacroTypes = require(game.ServerStorage.MacroTypes)

return {
    title = "My Macro",
    layoutOrder = 1,
    render = function(api: MacroTypes.api)
        api.label("Hello World")
    end
}
```

:::info
Requiring `MacroTypes` from a macro module will return the full api. If you prefer you can use it instead of the `api` parameter in the render function.

```lua
local api = require(game.ServerStorage.MacroTypes)

return {
    title = "My Macro",
    layoutOrder = 1,
    render = function()
        api.label("Hello World")
    end
}
```

:::

