---
sidebar_position: 5
---

# Custom Widgets

While Easy Macros focuses on simplicity and ease of use, it also provides a way to create custom widgets for more advanced use cases.

To create a custom widget, we need to use the `create`, `widget`, and `useInstance` functions from the `api` object.

Here is an example of how you can create a custom button widget:

```lua
-- ServerStorage/ColorButton.lua
local api = require(game.ServerStorage.MacroTypes)

local theme = settings().Studio.Theme

return api.widget(function(text: string, color: Color3)
    local clicked, setClicked = api.useState(false)

    local refs = api.useInstance(function(ref)
        api.create("TextButton", {
            [ref] = "button",
            BackgroundColor3 = theme:GetColor(Enum.StudioStyleGuideColor.Button),
            TextColor3 = theme:GetColor(Enum.StudioStyleGuideColor.ButtonText),
            Size = UDim2.new(1, 0, 0, 30),

            Activated = function()
                setClicked(true)
            end,
        })

        return ref.button
    end)

    refs.button.Text = tostring(text)
    refs.button.BackgroundColor3 = color

    local handle = {
        clicked = function()
            if clicked then
                setClicked(false)
                return true
            end

            return false
        end,
    }

    return handle
end)
```

Using the custom widget is the same as built-in widgets.

```lua
local api = require(game.ServerStorage.MacroTypes)
local colorButton = require(game.ServerStorage.ColorButton)

local function render()
    local button = colorButton("Red button", Color3.fromRGB(255, 0, 0))
end
```
