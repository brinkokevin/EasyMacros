--[[
For full documentation check out the devforum post and easy macros docs page:
https://devforum.roblox.com/t/easy-macros/2944568
https://brinkokevin.github.io/EasyMacros/

## Getting Started with Easy Macros

Welcome to Easy Macros! This documentation will guide you through 
the process of creating your own custom macros.

## Creating a Macro

To set up a macro, first create a new ModuleScript and name it with 
the ".macro" suffix, like "MyMacro.macro". Alternatively, you can 
use the "Create Template" button in the Plugins tab to make a new macro.

## The Macro Template

Here is a basic template for creating a macro

return {
    title = "My Macro",
    layoutOrder = 1,
    render = function(api)
        -- Your macro code here
    end
}

## API Documentation

### Label

Displays text
* `text` (string): The text to display on the label.

Example:

api.label("Hello, World!")	

### Heading

Displays text but bigger!

* `text` (string): The text to display on the heading.
* `options` (table, optional):
  * `font` (Enum.Font, optional): Specifies the font style used for the heading text.

Example:

	-- Heading with default font
	api.heading("Hello, World!")

	-- Heading with custom font
	api.heading("Hello, World!", {
		font = Enum.Font.SourceSansBold,
	})

### Error

Displays an error message

* `text` (string): The error message to display.

Example:

	api.error("Failed to execute macro!")
	
### Button

Creates a button

* `text` (string): Text displayed on the button.

Returns a table with the following functions:
* `clicked`: A function to check if the button was clicked this frame.

Example:

	local button = api.button("Hello, World!")
	if button:clicked() then
		print("Button was clicked!")
	end
	
### Checkbox

Creates a checkbox

* `text` (string): Label displayed next to the checkbox.
* `options` (table, optional):
  * `checked` (boolean, optional): Controlled state of the checkbox.
  * `disabled` (boolean, optional): Disables the checkbox.

Returns a table with the following functions:
* `getValue`: A function to check if the checkbox is checked.
* `clicked`: A function to check if the checkbox was clicked this frame.

Example:

	local isChecked, setIsChecked = api.useState(false)
	-- Uncontrolled checkbox
	local checkbox = api.checkbox("Uncontrolled checkbox")
	if checkbox:clicked() then
		print("Checkbox was clicked, current state: " .. tostring(checkbox:getValue()))
	end

	-- Controlled checkbox
	local controlledCheckbox = api.checkbox("Controlled checkbox", {
		checked = isChecked,
	})
	if controlledCheckbox:clicked() then
		setIsChecked(not isChecked)
	end

	-- Disabled checkbox
	api.checkbox("Disabled checkbox", {
		checked = isChecked,
		disabled = true,
	})
	
### NumberInput

Creates a number input field.

* `text` (string): Text displayed on the label.
* `options` (table, optional):
  * `default` (number, optional): Initial numeric value.
  * `min` (number, optional): Minimum number constraint.
  * `max` (number, optional): Maximum number constraint.

Returns a table with the following functions:
* `getValue`: A function to get the current numeric value, nil if invalid.
* `valueChanged`: A function to check if the value has changed since the last frame.

Example:

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

### StringInput

Creates an input field for text.

* `text` (string): Text displayed on the label.
* `options` (table, optional):
  * `default` (string, optional): Initial value.

Returns a table with the following functions:
* `getValue`: A function to get the current value, nil if invalid.
* `valueChanged`: A function to check if the value has changed since the last frame.

Example:

	-- String input with no default value
	local stringInput = api.stringinput("String Input")
	if stringInput:valueChanged() then
		print("New string: " .. tostring(stringInput:getValue()))
	end

	-- String input with default value
	local defaultStringInput = api.stringinput("String Input with default value", {
		default = "Hello, World!",
	})
	if defaultStringInput:valueChanged() then
		print("New string: " .. tostring(defaultStringInput:getValue()))
	end

]]
