local Players = game:GetService("Players")
local startPosition = Vector3.new(0,10,0)
local startCFrame = CFrame.new(startPosition)

local function leaderboardSetup(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local progress = Instance.new("IntValue")
	progress.Name = "Checkpoint"
	progress.Value = 0
	progress.Parent = leaderstats
	local function onCharacterAdded(character)
		print("Player added")
		local leaderstats = player and player:FindFirstChild("leaderstats")
		local progressStat = leaderstats and leaderstats:FindFirstChild("Checkpoint")
		print(progressStat.Value)
		
		if progressStat.Value ==0 then
			character:PivotTo(startCFrame)
		elseif progressStat.Value ==1 then
			local checkpoint = game.Workspace.Checkpoint1
			local checkpointCFrame = checkpoint.CFrame
			checkpointCFrame = checkpointCFrame + Vector3.new(0, 10, 0)
			character:PivotTo(checkpointCFrame)
			print("Character moved to checkpoint 1")
		elseif progressStat.Value ==2 then
			local checkpoint = game.Workspace.Checkpoint2
			local checkpointCFrame = checkpoint.CFrame
			checkpointCFrame = checkpointCFrame + Vector3.new(0, 10, 0)
			character:PivotTo(checkpointCFrame)
			print("Character moved to checkpoint 2")
		end
	end

	player.CharacterAdded:Connect(onCharacterAdded)

	print(player.Name, "has joined!")
end

-- Connect the "leaderboardSetup()" function to the "PlayerAdded" event
Players.PlayerAdded:Connect(leaderboardSetup)