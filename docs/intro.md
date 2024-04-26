---
sidebar_position: 1
---

# Introduction

Welcome to the Easy Macros plugin for Roblox Studio.

Congratulations on taking the first step towards a more efficient and streamlined workflow! Easy Macros is a powerful plugin designed to enhance your development process by allowing you to create "macros"—specialized mini-plugins tailored to your project's specific needs.

## How does Easy Macros improve your workflow?

Easy Macros provides a simple and intuitive API for creating UI components quickly. It's designed to be easy to use and understand, allowing you to focus on the functionality of your macros.

## Simple Macro Example

This macro demonstrates how to create a simple button that anchors all parts in the selected model. This example showcases the basic structure of a macro and how to use the Easy Macros API to create UI elements.

```lua
-- Loop through all descendants of the part and anchor them
local function anchorPartsInModel(part)
    for _, descendant in part:GetDescendants() do
        if descendant:IsA("BasePart") then
            descendant.Anchored = true
        end
    end
end

-- Function to create a UI button that anchors a selected part and its descendants
local function render(api)
    -- Create a button and check if it has been clicked
    if api.button("Anchor Selection"):clicked() then
        anchorPartsInModel(game.Selection:Get()[1])
    end
end

-- Return the macro details to be used by the plugin
return {
    title = "My Simple Macro",  -- Title of the macro
    layoutOrder = 1,            -- Order of the macro in the UI
    render = render,            -- The function to render UI elements
}
```

![Macro Example](/AnchorDemo.webp)

More examples are available later in the documentation, showcasing various UI widgets like labels, input boxes, check boxes and buttons.
