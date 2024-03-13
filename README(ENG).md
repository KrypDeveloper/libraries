# LSU (Lua Scripting Utility) Library Documentation

## Introduction
This library was developed to facilitate game development in Roblox, providing a series of useful functions for manipulating characters, positions, GUIs, and much more.

## Basic Usage
To use this library, follow the steps below:

1. Load the library into your Roblox script:
```lua
local LSU = loadstring(game:HttpGet("https://raw.githubusercontent.com/KrypDeveloper/MAXIMUS-LIBRARY/main/Maximus.lua"))()
```

2. Use the provided functions as needed.

## Available Functions

### LSU.TeleportPlayer(x, y, z)
Teleports the player to the specified coordinates.
- Parameters:
  - `x`: X Coordinate
  - `y`: Y Coordinate
  - `z`: Z Coordinate

### LSU.getpos()
Gets the current position of the player.
- Returns:
  - A vector containing the XYZ coordinates of the player's current position.

### LSU.getid()
Gets the ID of the current place.
- Returns:
  - The ID of the current place.

### LSU.TweenTp(x, y, z, speed)
Smoothly teleports the player to the specified coordinates using a transition animation.
- Parameters:
  - `x`: X Coordinate
  - `y`: Y Coordinate
  - `z`: Z Coordinate
  - `speed`: Transition animation speed

### LSU.TeleportPlace(id)
Teleports the player to a different place.
- Parameters:
  - `id`: ID of the place to teleport the player.

### LSU.KillPlayer()
Instantly kills the player.

### LSU.Load(link)
Loads and executes an external script.
- Parameters:
  - `link`: URL of the external script to be loaded.

### LSU.IY()
Loads and executes Infinite Yield, a powerful administration tool.

### LSU.RemoveGui()
Removes all GUIs from the player.

### LSU.SetSpeed(speed)
Sets the player's walking speed.
- Parameters:
  - `speed`: Desired walking speed.

### LSU.Anchor(state)
Sets whether the player is anchored (fixed in place) or not.
- Parameters:
  - `state`: `true` to anchor the player, `false` to unanchor.

## Example Usage
```lua
local LSU = loadstring(game:HttpGet("https://raw.githubusercontent.com/KrypDeveloper/MAXIMUS-LIBRARY/main/Maximus.lua"))()

-- Teleports the player to coordinates (10, 20, 30)
LSU.TeleportPlayer(10, 20, 30)

-- Gets the current position of the player
local currentPosition = LSU.getpos()
print("Player's current position:", currentPosition)

-- Loads and executes an external script
LSU.Load("https://example.com/myscript.lua")
```
