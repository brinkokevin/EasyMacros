-- This macro demonstrates all the components available.
local MacroTypes = require(game.ServerStorage.MacroTypes)

local isChecked = false
local function render(api: MacroTypes.api)
	-- Simple label
	api.label("Hello, World!")

	-- Simple heading
	api.heading("Hello, World!")

	-- Heading with custom font
	api.heading("Hello, World!", {
		font = Font.fromName("Bangers", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
	})
	api.heading("Hello, World!", {
		font = Enum.Font.ArimoBold,
	})

	-- Error message
	api.error("Failed to execute macro!")

	-- Button
	local button = api.button("Hello, World!")
	if button:clicked() then
		print("Button was clicked!")
	end

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
		isChecked = not isChecked
		print("Controlled checkbox was clicked, current state: " .. tostring(isChecked))
	end

	-- Disabled checkbox
	api.checkbox("Disabled checkbox", {
		checked = isChecked,
		disabled = true,
	})

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
end

return {
	title = "Example: All Widgets",
	layoutOrder = 5,
	render = render,
}
