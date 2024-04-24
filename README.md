# EasyMacros

Documentation and Examples for EasyMacros roblox plugin

## Getting Started with Easy Macros

Welcome to Easy Macros! This documentation will guide you through the process of creating your own custom macros.

## Creating a Macro

To create a macro, start by creating a new ModuleScript in the ServerStorage folder. Give your script a name that ends with ".macro", for example, "MyMacro.macro".

## The Macro Template

Here is a basic template for creating a macro

```lua
return {
    title = "My Macro",
    layoutOrder = 1,
    render = function(api)
        -- Your macro code here
    end
}
```

## The `render` Function

The `render` function is the heart of your macro. It's called every frame, and it's where you define the UI components of your macro. The `render` function takes an `api` object as an argument, which provides functions for creating UI components.

## Reactive Programming

Easy Macros uses a modified version of Plasma, a reactive programming library. This means that the `render` function is called every frame, and it's up to you to manage the state of your macro. While understanding Plasma is not required, it can be helpful for more advanced use cases.
[Plasma](https://eryn.io/plasma/docs/intro)

## API Documentation

================

### Label

Displays text

* `text` (string): The text to display on the label.

Example

```lua
api.label("Hello, World!")
```

### Heading

Displays text but bigger!

* `text` (string): The text to display on the heading.
* `options` (table, optional):
  * `font` (Enum.Font, optional): Specifies the font style used for the heading text.

Example

```lua
-- Heading with default font
api.heading("Hello, World!")

-- Heading with custom font
api.heading("Hello, World!", {
    font = Enum.Font.SourceSansBold
})
```

### Error

Displays an error message

* `text` (string): The error message to display.

Example

```lua
api.error("Failed to execute macro!")
```

### Button

Creates a button

* `text` (string): Text displayed on the button.

Returns a table with the following functions:

* `clicked`: A function to check if the button was clicked this frame.

Example

```lua
local button = api.button("Hello, World!")
if button:clicked() then
    print("Button was clicked!")
end
```

### Checkbox

Creates a checkbox

* `text` (string): Label displayed next to the checkbox.
* `options` (table, optional):
  * `checked` (boolean, optional): Controlled state of the checkbox.
  * `disabled` (boolean, optional): Disables the checkbox.

Returns a table with the following functions:

* `getValue`: A function to check if the checkbox is checked.
* `clicked`: A function to check if the checkbox was clicked this frame.

Example

```lua
local isChecked = false
local function render(api)
    -- Uncontrolled checkbox
    local checkbox = api.checkbox("Uncontrolled checkbox")
    if checkbox:clicked() then
        print("Checkbox was clicked, current state: " .. tostring(checkbox:getValue()))
    end

    -- Controlled checkbox
    local controlledCheckbox = api.checkbox("Controlled checkbox", {
        checked = isChecked
    })
    if controlledCheckbox:clicked() then
        isChecked = not isChecked
        print("Controlled checkbox was clicked, current state: " .. tostring(isChecked))
    end

    -- Disabled checkbox
    api.checkbox("Disabled checkbox", {
        checked = isChecked,
        disabled = true
    })
end
```

### NumberInput

Creates a number input field.

* `text` (string): Text displayed on the label.
* `options` (table, optional):
  *`default` (number, optional): Initial numeric value.
  *`min` (number, optional): Minimum number constraint.
  *`max` (number, optional): Maximum number constraint.

Returns a table with the following functions:

* `getValue`: A function to get the current numeric value, nil if invalid.
* `valueChanged`: A function to check if the value has changed since the last frame.

Example

```lua
-- Simple Number input
local ageInput = api.numberinput("Age")
if ageInput:valueChanged() then
    print("New age: " .. tostring(ageInput:getValue()))
end

-- Number input with constraints
local numberInput = api.numberinput("Radius", {
    default = 30,
    min = 0,
    max = 100,
})
if numberInput:valueChanged() then
    print("New value: " .. tostring(numberInput:getValue()))
end
```

### StringInput

Creates an input field for text.

* `text` (string): Text displayed on the label.
* `options` (table, optional):
  * `default` (string, optional): Initial value.

Returns a table with the following functions:

* `getValue`: A function to get the current value, nil if invalid.
* `valueChanged`: A function to check if the value has changed since the last frame.

Example

```lua
local numberInput = api.stringinput({
    placeholder = "Attribute Name",
    defaultValue = "Button",
})
if numberInput.valueChanged() then
    print("New value: " .. tostring(numberInput.value()))
end
```

### Hooks

Advanced features for managing state and lifecycle events. With hooks you can create custom widgets, manage state and run functions post-render.

### useState

Returns a state value and an update function.

`api.useState(initialValue)`

```lua
local function render(api)
    local count, setCount = api.useState(0)

    local button = api.button("Increase count")

    if button:clicked() then
        setCount(count + 1)
    end

    api.label("Count: " .. count)
end
```

### useEffect

Used to run a function when certain variables change. It can also be used to manage connecting and disconnecting events. When no variables are provided, the function will run once when the macro is first rendered. The function can return a cleanup function to run when the macro is removed.

You may add as many dependencies as you like, and the function will only run when any of the dependencies changes.

`api.useEffect(callback, ...dependencies)`

```lua
local function render(api)
    local instanceCount, setInstanceCount = api.useState(0)

    api.label("Workspace instance count: " .. instanceCount)

    -- This function will only run once when the macro is first rendered
    -- It will disconnect the event listeners when the macro is removed
    api.useEffect(function()
        local function updateInstanceCount()
            setInstanceCount(#workspace:GetDescendants())
        end

        local childAdded = workspace.ChildAdded:Connect(updateInstanceCount)
        local childRemoved = workspace.ChildRemoved:Connect(updateInstanceCount)

        return function()
            childAdded:Disconnect()
            childRemoved:Disconnect()
        end
    end)

    -- This function will run every time the instanceCount changes
    api.useEffect(function()
        print("Instance count changed to: " .. instanceCount)
    end, instanceCount)    
end
```
