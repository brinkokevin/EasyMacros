--[=[
	@class EasyMacros

	API for creating Macros with Easy Macros plugin.
]=]

-- Widgets

--[=[
	@within EasyMacros
	@function label
	@tag widgets
	@param text string -- The text to display on the label

	Displays text

	```lua
	api.label("Hello, World!")
	```
]=]

--[=[
	@within EasyMacros
	@function heading
	@tag widgets
	@param text string -- The text to display on the label
	@param options {font: Enum.Font | Font}?

	Displays text but bigger!

	Optionally, you can change the font.

	```lua
	-- Heading with default font
	api.heading("Hello, World!")

	-- Heading with custom font
	api.heading("Hello, World!", {
		font = Enum.Font.SourceSansBold
	})
	```
]=]

--[=[
	@within EasyMacros
	@function error
	@tag widgets
	@param text string -- The error message to display.

	Displays an error message

	```lua
	api.error("Invalid username!")
	```
]=]

--[=[
	@within EasyMacros
	@function button
	@tag widgets
	@param label string -- The label for the button
	@return ButtonHandle

	A text button.

	Returns a table with the following functions:

	- `clicked`, a function you can call to check if the button was clicked this frame

	```lua
	local button = api.button("Hello, World!")
	if button:clicked() then
		print("Button was clicked!")
	end
	```
]=]

--[=[
	@within EasyMacros
	@function checkbox
	@tag widgets
	@param text string -- The label for the checkbox
	@param options {checked: boolean?, disabled: boolean?}?
	@return CheckboxHandle

	Creates a checkbox.

	Returns a table with the following functions:

	* `getValue`: A function to check if the checkbox is checked.
	* `clicked`: A function to check if the checkbox was clicked this frame.

	```lua
	-- We define variable outside of the render function to keep the state between render frames
	-- Optionally, you can use `useState` hook to keep the state between render frames

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
]=]

--[=[
	@within EasyMacros
	@function numberinput
	@tag widgets
	@param label string -- The label for the input
	@param options {default: string?,min: number?, max: number?}?
	@return NumberInputHandle

	Creates an input field for numbers. Optionally, you can provide a default value and min/max constraints.

	Returns a table with the following functions:

	* `getValue`: A function to get the current value, nil if invalid.
	* `valueChanged`: A function to check if the value has changed since the last frame.

	```lua
	-- Simple Number input
	local ageInput = api.numberinput("Age")
	if ageInput:valueChanged() then
		-- Print then new value
		print(ageInput:getValue())
	end

	-- Number input with constraints
	local numberInput = api.numberinput("Radius", {
		default = 30,
		min = 0,
		max = 100,
	})
	if numberInput:valueChanged() then
		-- Print then new value, clamped between 0 and 100
		print(numberInput:getValue())
	end
	```
]=]

--[=[
	@within EasyMacros
	@function stringinput
	@tag widgets
	@param label string -- The label for the input
	@param options {default: string?}?
	@return StringInputHandle

	Creates an input field for text.
	Optionally, you can provide a default value.

	Returns a table with the following functions:

	* `getValue`: A function to get the current value, nil if invalid.
	* `valueChanged`: A function to check if the value has changed since the last frame.


	```lua
	-- String input with no default value
	local stringInput = api.stringinput("String Input")
	if stringInput:valueChanged() then
		-- Print then new value
		print(stringInput:getValue())
	end

	-- String input with default value
	local defaultStringInput = api.stringinput("String Input with default value", {
		default = "Hello, World!",
	})
	if defaultStringInput:valueChanged() then
		-- Print then new value
		print(defaultStringInput:getValue())
	end
	```
]=]

-- Hooks

--[=[
	@within EasyMacros
	@function useState
	@param initialValue T -- The value this hook returns if the set callback has never been called
	@return T -- The previously set value, or the initial value if none has been set
	@return (newValue: T) -> () -- A function which when called stores the value in this hook for the next run
	@tag hooks

	Returns a state value and an update function.

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
]=]

--[=[
	@within EasyMacros
	@function useEffect
	@param callback () -> () | () -> () -> () -- A callback function that optionally returns a cleanup function
	@param ... any -- Dependencies
	@tag hooks

	`useEffect` takes a callback as a parameter which is  then only invoked if passed dependencies are different from the
	last time this function was called. The callback is always invoked the first time this code path is reached.

	If no dependencies are passed, the callback only runs once.

	This function can be used to skip expensive work if none of the dependencies have changed since the last run.
	For example, you might use this to set a bunch of properties in a widget if any of the inputs change.

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
]=]

--[=[
	@within EasyMacros
	@function useInstance
	@param creator (ref: {}) -> (Instance, Instance?) -- A callback which creates the widget and returns it
	@return Instance -- Returns the instance returned by `creator`
	@tag hooks

	`useInstance` takes a callback which should be used to create the initial UI for the widget.
	The callback is only ever invoked on the first time this widget runs and never again.
	The callback should return the instance it created.
	The callback can optionally return a second value, which is the instance where children of this widget should be
	placed. Otherwise, children are placed in the first instance returned.

	`useInstance` returns the `ref` table that is passed to it. You can use this to create references to objects
	you want to update in the widget body.
]=]

--[=[
	@within EasyMacros
	@function useKey
	@param key string
	@tag hooks

	Specify a key by which to store all future state in this scope. This is similar to React's `key` prop.

	This is important to use to prevent state from one source being still being applied when it should actually reset.
]=]

-- Utilities

--[=[
	@within EasyMacros
	@function create
	@param className string -- The class name of the Instance to create
	@param props CreateProps
	@return Instance -- The created instance
	@tag utilities

	A function that creates an Instance tree.

	CreateProps is a table:
	- String keys are interpreted as properties to set
	- `children` key is interpreted as an array of children to parent to the instance
	- Function values are interpreted as event handlers
	- Table keys can be used to get references to instances deep in the tree, the value becomes the key in the table

	This function doesn't do anything special. It just creates an instance.

	```lua
	api.create("Frame", {
		BackgroundTransparency = 1,
		Name = "Checkbox",

		children = {
			api.create("TextButton", {
				BackgroundColor3 = Color3.fromRGB(54, 54, 54),
				Size = UDim2.new(0, 30, 0, 30),
				Activated = function()
					setClicked(true)
				end,

				children = {
					api.create("UICorner", {
						CornerRadius = UDim.new(0, 8),
					}),
				},
			}),
		},
	})
	```

	Getting references to instances deep in a tree:

	```lua
	local ref = {}

	api.create("Frame", {
		api.create("TextButton", {
			[ref] = "button",
			Text = "hi"
		})
	})

	print(ref.button.Text) --> hi
	```

	This pairs well with useInstance hook:

	```lua
	local function label(api, text: string)
		local ref = api.useInstance(function(refs)
			return api.create("TextLabel", {
				[ref] = "button",
			})
		end)

		ref.button.Text = text
	end
	
	```
]=]

--[=[
	@within EasyMacros
	@function widget
	@param fn (...: T) -> () -- The widget function
	@return (...: T) -> () -- A function which can be called to create the widget
	@tag utilities

	This function takes a widget function and returns a function that automatically starts a new scope when the function
	is called.

	Here is what the `label` widget looks like under the hood:

	```lua
	return api.widget(function(text: string)
		local refs = api.useInstance(function(ref)
			api.create("TextLabel", {
				[ref] = "label",
				BackgroundTransparency = 1,
				Font = Enum.Font.SourceSans,
				TextColor3 = theme:GetColor(Enum.StudioStyleGuideColor.MainText),
				TextSize = 20,
				RichText = true,
				TextWrapped = true,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0),
			})

			return ref.label
		end)

		refs.label.Text = tostring(text)
	end)
	```
]=]

--[=[
	@within EasyMacros
	@function scope
	@param fn (...: T) -> ()
	@param ... T -- Additional parameters to `callback`
	@tag utilities

	Begins a new scope.
	The `callback` is invoked immediately.

	Beginning a new scope associates all further API calls with a nested scope inside this one.
]=]
