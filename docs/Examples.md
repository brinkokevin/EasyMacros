---
sidebar_position: 4
---

# Examples

## All Widgets

This macro demonstrates all the widgets available. If you would like to see more widgets added, feel free to open an issue or dm me on discord `@brinkokevin`.

```lua
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
```

![All Widgets](/WidgetsView.png)

## Load Character

Load Character is a simple macro that loads a character into the workspace. It's a good example of how to use the `api` object to create StringInput, Checkbox and a Button component.

```lua
-- MacroTypes provides the API types to luau, if you don't care about types you don't have to use it
local MacroTypes = require(game.ServerStorage.MacroTypes)

-- ChangeHistoryService is used to record changes in studio, this allows us to undo the changes we make
local ChangeHistoryService = game:GetService("ChangeHistoryService")
local Camera = workspace.CurrentCamera

-- Insert Character is a helper function for our macro, it's not related to Easy Macros
local function insertCharacter(username: string, isR6: boolean)
    -- Start recording the changes we make to the workspace
    local id = ChangeHistoryService:TryBeginRecording("LoadCharacter")

    -- Get the userId of the player
    local userId = game.Players:GetUserIdFromNameAsync(username)
    -- Get the humanoid description of the player
    local humanoidDescription = game.Players:GetHumanoidDescriptionFromUserId(userId)
    -- Create a model from the humanoid description
    local rigType = isR6 and Enum.HumanoidRigType.R6 or Enum.HumanoidRigType.R15
    local model = game.Players:CreateHumanoidModelFromDescription(humanoidDescription, rigType)
    model:PivotTo(CFrame.new((Camera.CFrame * CFrame.new(0, 0, -25)).Position))
    model.Name = username
    model.Parent = workspace

    -- Finish recording the changes we made
    if id then
        ChangeHistoryService:FinishRecording(id, Enum.FinishRecordingOperation.Commit)
    end
end

-- Render function is called every frame, it's where you define the UI components of your macro
local function render(api: MacroTypes.api)
    -- Render the UI components
    local usernameInput = api.stringinput("Username", {
        default = "brinkokevin",
    })
    local r6Checkbox = api.checkbox("Create R6 character")
    local insertButton = api.button("Insert Character")

    -- clicked is a function that returns true if the button was clicked
    -- Once clicked is read, it resets to false until the button is clicked again
    if insertButton:clicked() then
        -- Get the values of the UI components
        local username = usernameInput:getValue()
        local isR6 = r6Checkbox:getValue()
        -- We use task.spawn to avoid yielding the render function,
        -- since loading the character can take a moment
        -- and we are not allowed to yield inside the render function
        task.spawn(insertCharacter, username or "brinkokevin", isR6)
    end
end

return {
    -- The title of the macro
    title = "Example: Load Character",
    -- The order in which the macro appears in the menu
    layoutOrder = 2,
    -- The function that defines the UI components of the macro
    render = render,
}
```

![Load Character](/LoadCharacterView.png)

## More Examples Coming Soon

If you have a macro you'd like to share, feel free to submit a pull request to add it to the documentation!
If you are not familiar with github, you can also dm me on discord `@brinkokevin`
