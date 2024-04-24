local MacroTypes = require(game.ServerStorage.MacroTypes)

local function render(api: MacroTypes.api)
	local button = api.button("Click Me!")
	if button:clicked() then
		print("Button was clicked!")
		-- Insert your code here
	end
end

return {
	title = "Template",
	layoutOrder = 0,
	render = render,
}
