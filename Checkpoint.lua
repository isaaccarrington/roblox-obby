-- give every checkpoint a unique value
-- this value represents progress, so every checkpoint you reach should have a higher value than the last
local CHECKPOINT_VALUE = 1

local Players = game:GetService("Players")
local checkpointArea = script.Parent
checkpointArea.Anchored = true
checkpointArea.CanCollide = true
local COOLDOWN_TIME = 5

local function onPartTouch(otherPart)
	local partParent = otherPart.Parent
	local player = Players:GetPlayerFromCharacter(partParent)
	local leaderstats = player and player:FindFirstChild("leaderstats")
	local progressStat = leaderstats and leaderstats:FindFirstChild("Checkpoint")
	if progressStat then
		if not checkpointArea:GetAttribute("CoolingDown") then
			checkpointArea:SetAttribute("CoolingDown", true)
			if CHECKPOINT_VALUE > progressStat.Value then
				progressStat.Value = CHECKPOINT_VALUE
			end
			task.wait(COOLDOWN_TIME)
			checkpointArea:SetAttribute("CoolingDown", false)
		end
	end
end

checkpointArea.Touched:Connect(onPartTouch)