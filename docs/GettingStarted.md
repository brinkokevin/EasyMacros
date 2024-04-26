---
sidebar_position: 2
---

# Getting Started

## Installing the plugin

To install the plugin, you need to first purchase it on the Roblox Creator Store.

1. Get the [Easy Macros Plugin](https://create.roblox.com/store/asset/17228863039) on the Roblox Creator Store.
2. Open Roblox Studio and install the plugin.

## Using the plugin

"The plugin provides you with two buttons in the Plugins tab of Roblox Studio.

![Plugin Tab](/plugin_tab_buttons.png)

* Open Menu - Toggles the main menu of the plugin.
* Create Template - Creates a new `Template.macro` ModuleScript.

## Creating a new macro

To create a macro, first create a new ModuleScript and name it with the `.macro` suffix, like `MyMacro.macro`. Alternatively, you can use the `Create Template` button in the Plugins tab to make a new macro.

## Macro Template

Here is a basic macro template. Each macro module must return a table with the following fields:

* `title`: The title of the macro
* `layoutOrder`: The order in which the macro appears in the menu
* `render`: The function that defines the UI components of the macro

```lua
return {
    title = "My Macro",
    layoutOrder = 1,
    render = function(api)
        -- Your macro code here
    end
}
```

## Type checking

[MacroTypes](https://github.com/brinkokevin/EasyMacros/blob/main/MacroTypes.lua) is an optional module that provides luau type checking for macros API.

```lua
local MacroTypes = require(game.ServerStorage.MacroTypes)

return {
    title = "My Macro",
    layoutOrder = 1,
    render = function(api: MacroTypes)
        api.label("Hello World")
    end
}
```

### Method 1 - Plugin

Pressing the `Create Template` button will insert `MacroTypes` into ServerStorage. If a MacroTypes module is already detected anywhere in your project, the plugin will update it with the latest version.

### Method 2 - Wally

To add `MacroTypes` to your project using wally, add the following to your `wally.toml`:

`MacroTypes = "brinkokevin/easymacros@^0"`

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
