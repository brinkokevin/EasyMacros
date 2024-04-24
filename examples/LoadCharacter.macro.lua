-- This is an example macro that loads a character into the workspace
-- Here you can see how to use string inputs, checkboxes, and buttons
-- It also demonstrates how to use the ChangeHistoryService to record changes
-- ChangeHistoryService allows you to later undo/redo the changes made by the macro
local MacroTypes = require(game.ServerStorage.MacroTypes)

local ChangeHistoryService = game:GetService("ChangeHistoryService")
local Camera = workspace.CurrentCamera

local function onButtonClicked(username: string, isR6: boolean)
	-- Start recording the changes we make to the workspace
	local id = ChangeHistoryService:TryBeginRecording("LoadCharacter")

	local userId = game.Players:GetUserIdFromNameAsync(username)
	local humanoidDescription = game.Players:GetHumanoidDescriptionFromUserId(userId)
	local rigType = isR6 and Enum.HumanoidRigType.R6 or Enum.HumanoidRigType.R15
	local model = game.Players:CreateHumanoidModelFromDescription(humanoidDescription, rigType)
	model.Name = username
	model.Parent = workspace

	model:PivotTo(CFrame.new((Camera.CFrame * CFrame.new(0, 0, -25)).Position))

	if id then
		ChangeHistoryService:FinishRecording(id, Enum.FinishRecordingOperation.Commit)
	end
end

local function render(api: MacroTypes.api)
	local usernameInput = api.stringinput("Username", {
		default = "brinkokevin",
	})
	local r6Checkbox = api.checkbox("Create R6 character")
	local insertButton = api.button("Insert Character")

	if insertButton:clicked() then
		local username = usernameInput:getValue()
		local isR6 = r6Checkbox:getValue()
		-- We use task.spawn to avoid yielding the render function,
		-- since loading the character can take a second
		task.spawn(onButtonClicked, username or "brinkokevin", isR6)
	end
end

return {
	title = "Example: Load Character",
	layoutOrder = 2,
	render = render,
}
