--[[
This macro demonstrates how to create buttons dynamically. 
Since the macro renders every frame, we can't simply create 
a new component when :clicked() is true; instead, we have to 
update the variables that tell the macro how to render itself.
]]
local MacroTypes = require(game.ServerStorage.MacroTypes)

local buttonCount = 1
local function render(api: MacroTypes.api)
	if buttonCount > 5 then
		api.label("You have a lot of buttons!")
	end

	for _ = 1, buttonCount do
		local myButton = api.button("Add button!")

		if myButton:clicked() then
			buttonCount += 1
		end
	end

	if buttonCount > 1 then
		local removeButton = api.button("Reset buttons!")
		if removeButton:clicked() then
			buttonCount = 1
		end
	end
end

return {
	title = "Example: Many Buttons",
	layoutOrder = 3,
	render = render,
}
