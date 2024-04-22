# EasyMacros
Documentation and Examples for EasyMacros roblox plugin


**Getting Started with Easy Macros**

Welcome to Easy Macros! This documentation will guide you through the process of creating your own custom macros.

**Creating a Macro**

To create a macro, start by creating a new ModuleScript in the ServerStorage folder. Give your script a name that ends with ".macro", for example, "MyMacro.macro".

**The Macro Template**

Here is a basic template for creating a macro:
```lua
return {
    title = "My Macro",
    layoutOrder = 1,
    render = function(api)
        -- Your macro code here
    end
}
```
**The `render` Function**

The `render` function is the heart of your macro. It's called every frame, and it's where you define the UI components of your macro. The `render` function takes an `api` object as an argument, which provides functions for creating UI components.

**Reactive Programming**

Easy Macros uses a modified version of Plasma, a reactive programming library. This means that the `render` function is called every frame, and it's up to you to manage the state of your macro.

**API Documentation**

### `label`

Displays a label with configurable text properties.

### Config Parameters

* `text` (string): The text to display on the label.
* `font` (Enum.Font, optional): Specifies the font style.
* `size` (number, optional): Defines the font size.
* `color` (Color3, optional): Sets the text color.

### Example Usage
```lua
api.label({
    text = "Hello, World!",
    font = Enum.Font.SourceSansBold,
    size = 18,
    color = Color3.fromRGB(0, 0, 255)
})
```
### `button`

Creates a button with configurable properties and behavior.

### Config Parameters

* `text` (string): Text displayed on the button.
* `font` (Enum.Font, optional): Specifies the font style used for the button text.
* `color` (Color3, optional): Defines the color of the button text.

### Returns

* `clicked`: Returns a boolean indicating whether the button was clicked since the last check.

### Example Usage
```lua
local button = api.button({
    text = "Click Me!",
    font = Enum.Font.SourceSans,
    color = Color3.fromRGB(255, 255, 255)
})

if button.clicked() then
    print("Button was clicked!")
end
```
### `checkbox`

Creates a checkbox with a label and configurable properties.

### Config Parameters

* `text` (string): Label displayed next to the checkbox.
* `checked` (boolean, optional): Initial checked state of the checkbox.

### Returns

* `checked`: Returns the current checked state of the checkbox.
* `clicked`: Returns a boolean indicating whether the checkbox was clicked since the last check.

### Example Usage
```lua
local checkbox = api.checkbox({
    text = "Accept Terms",
    checked = false
})

if checkbox.clicked() then
    print("Checkbox was clicked, current state: " .. tostring(checkbox.checked()))
end
```
### `numberinput`

Creates an input field for numbers with configurable properties.

### Config Parameters

* `placeholder` (string): Hint text shown in the input field.
* `defaultValue` (number, optional): Initial numeric value.
* `min` (number, optional): Minimum allowable value.
* `max` (number, optional): Maximum allowable value.

### Returns

* `value`: Returns the current numeric value in the input field, or `nil` if invalid.
* `valueChanged`: Returns a boolean indicating whether the numeric value has changed since the last check.

### Example Usage
```lua
local numberInput = api.numberinput({
    placeholder = "Enter radius",
    defaultValue = 30,
    min = 0,
    max = 100
})

if numberInput.valueChanged() then
    print("New value: " .. tostring(numberInput.value()))
end
```
### `stringinput`

Creates an input field for text with configurable properties.

### Config Parameters

* `placeholder` (string): Hint text shown in the input field before entering a value.
* `defaultValue` (string, optional): Initial text value.

### Returns

* `value`: Returns the current text value in the input field.
* `valueChanged`: Returns a boolean indicating whether the text value has changed since the last check.

### Example Usage
```lua
local stringInput = api.stringinput({
    placeholder = "Attribute Name",
    defaultValue = "Button"
})

if stringInput.valueChanged() then
    print("New value: " .. tostring(stringInput.value()))
end
```
**Hooks**

Hooks are advanced features that help manage state and lifecycle events in programming. They allow for cleaner, more modular code but are best suited for experienced programmers familiar with state management and application side effects.

**Best Practices**

* Keep your macro code organized and easy to read.
* Use meaningful variable names and comments to explain your code.
* Test your macro thoroughly to ensure it works as expected.
