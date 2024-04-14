# Roblox Obby Demo

Minimal code for a Roblox obby.

## Set up the leaderboard

- Create a new Baseplate game
- Go to the Workspace, find `Baseplate` and delete it
- Create a `Script` under `ServerScriptService` and rename it `Leaderboard`
- Paste in the code from `Leaderboard.lua`
- Run the game and jump off hte edge a few times. You will respawn on top of `SpawnLocation`

## Set up the checkpoints

- Add a new part next to the `SpawnLocation` and rename it Checkpoint1
- Add a `Script` and paste in the code from `Checkpoint.lua`
- Run the game again. When you jump onto `Checkpoint1` you will respawn there
- Add more parts and name them in the sequence they are reached e.g `Checkpoint1`, `Checkpoint2` ...

In every Checkpoint change the value of `local CHECKPOINT_VALUE = 1` to correspond to the checkpoint
number. For example, `Checkpoint24` will have `local CHECKPOINT_VALUE = 24`.

You will also need to update `Leaderboard` for every checkpoint by adding more `elseif` statements
to checkout which checkpoint you have reached. 
You will duplicate:
```lua
elseif progressStat.Value ==1 then
    local checkpoint = game.Workspace.Checkpoint1
    local checkpointCFrame = checkpoint.CFrame
    checkpointCFrame = checkpointCFrame + Vector3.new(0, 10, 0)
    character:PivotTo(checkpointCFrame)
    print("Character moved to checkpoint 1")
```
and update `progressStat.Value ==1`, `game.Workspace.Checkpoint1`, and `print("Character moved to checkpoint 1")`
and replace the number 1 with the number of the checkpoint you are adding.

Place the checkpoints throughout the game and when a player reaches the checkpoint they will respawn
there if they die.
