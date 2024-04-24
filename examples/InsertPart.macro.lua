--[[
This is an example macro that inserts a part into 
the workspace. Here, you can see how to use buttons and 
ChangeHistoryService to record changes. The service allows 
you to later undo or redo the changes made by the macro.
]]
local MacroTypes = require(game.ServerStorage.MacroTypes)

local ChangeHistoryService = game:GetService("ChangeHistoryService")
local Camera = workspace.CurrentCamera

local function render(api: MacroTypes.api)
	local spawnPart = api.button("Spawn Random Part")
	if spawnPart:clicked() then
		-- Lets start recording the changes we make to the workspace
		-- This allows us to later undo / redo the changes we make
		local recordingId = ChangeHistoryService:TryBeginRecording("SpawnRandomPart")

		local part = Instance.new("Part")
		part.Size = Vector3.new(1, 1, 1)
		part.Anchored = true
		part.TopSurface = Enum.SurfaceType.SmoothNoOutlines
		part.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
		part.CFrame = CFrame.new((Camera.CFrame * CFrame.new(0, 0, -25)).Position)
		part.Parent = workspace

		if recordingId then
			-- This will be recorded in the undo history
			ChangeHistoryService:FinishRecording(recordingId, Enum.FinishRecordingOperation.Commit)
		end
	end
end

return {
	title = "Example: Insert Part",
	layoutOrder = 1,
	render = render,
}
