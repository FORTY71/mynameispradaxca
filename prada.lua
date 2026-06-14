-- Forsaken Plus Made by Naiko Exploits --
-- FULL PINK EDITION STANDALONE UI --

if workspace.DistributedGameTime < 3 then
	task.wait(3 - workspace.DistributedGameTime)
end

if game.CoreGui:FindFirstChild("ForsakenPinkUI") then
    return warn("Script already running")
elseif game.GameId == 6331902150 or game.GameId == 7464167604 or workspace:GetAttribute("ServerType") then
	Instance.new("BoolValue", game.CoreGui).Name = "ForsakenPinkUI"
else
	return warn("Incorrect game")
end

game:GetService("Players").LocalPlayer.Idled:Connect(function()
	game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

-- General Variables --

local Version = "1.4"
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local LocalCharacter = LocalPlayer.Character
local LocalHumanoid = LocalCharacter and (LocalCharacter:FindFirstChildOfClass("Humanoid") or LocalCharacter:WaitForChild("Humanoid",2)) or nil
local LocalHead = LocalCharacter and (LocalCharacter:FindFirstChild("Head") or LocalCharacter:WaitForChild("Head",2)) or nil
local LocalRoot = LocalCharacter and ((LocalHumanoid and LocalHumanoid.RootPart) or LocalCharacter:FindFirstChild("HumanoidRootPart") or LocalCharacter:WaitForChild("HumanoidRootPart",2)) or nil
local SpeedMultipliers = LocalCharacter and (LocalCharacter:FindFirstChild("SpeedMultipliers")) or nil
local CoreGui = game:GetService("CoreGui")
local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui", 20)
local PlayerData = LocalPlayer:FindFirstChild("PlayerData") or LocalPlayer:WaitForChild("PlayerData", 20)
local PlusFolderSettings = Instance.new("Folder")
local KillersFolder = workspace:WaitForChild("Players"):WaitForChild("Killers")
local SurvivorsFolder = workspace:WaitForChild("Players"):WaitForChild("Survivors")
local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TextChatService = game:GetService("TextChatService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local Lighting = game:GetService("Lighting")
local Debris = game:GetService("Debris")
local Network = ReplicatedStorage:FindFirstChild("Modules") and (ReplicatedStorage:FindFirstChild("Modules"):FindFirstChild("Network",true) and ReplicatedStorage:FindFirstChild("Modules"):FindFirstChild("Network",true):FindFirstChild("Network")) or ReplicatedStorage:FindFirstChild("Modules"):FindFirstChild("Network",true) or nil
local InGame = workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("Ingame")
local GameMap = InGame and InGame:FindFirstChild("Map") or nil
local RoundEvent = Instance.new("BindableEvent")
local BindableShouldStop = Instance.new("BindableEvent")
local UIScale = Instance.new("UIScale")
local IsUnderground,IsFixingGenerator,WarnedAboutFilesCompatability = false,false,false
local PlaySound,MainModule,HandlePrivacySettings,Check,ModulesOptions,RichTextGradientColor,IsHitboxNotNear,IsPoisonOnPosition,GoUnder,HandleAllowJumping,HandleNoliNPC,ChangeTrackWithOverride,LastTrack,NoliConfig,TableValueFind,ColoredPrint,Handle007n7NPC,GetValue
local ColorPresets = {["White"] = Color3.fromRGB(255,255,255),["Teal"] = Color3.fromRGB(3,252,157),["Green"] = Color3.fromRGB(0,255,0),["Purple"] = Color3.fromRGB(128,0,128),["Red"] = Color3.fromRGB(255,0,0),["Blue"] = Color3.fromRGB(0,0,255),["Cyan"] = Color3.fromRGB(0,255,255),["Gold"] = Color3.fromRGB(255,215,0),["Orange"] = Color3.fromRGB(255,165,0)}
local IgnoreKeybinds = {"W", "A", "S", "D"}
local GameVersionForScript = "2026-06-12"
local OverriddenAnimations = {}
local Worked,CurrentGameVersion = pcall(function() return MarketplaceService:GetProductInfoAsync(game.PlaceId,Enum.InfoType.Asset)["Updated"] end) ; CurrentGameVersion = Worked and CurrentGameVersion or GameVersionForScript
local AllAnimations = {}
local FeatureLoadout; FeatureLoadout = {
    ["ExploitFunctions"] = {
          ["TabAttributes"] = {
            ["DisplayTitle"] = "Loading...",
            ["LayoutOrder"] = 666
        },
        ["hookmetamethod"] = {
            ["DisplayDescription"] = " ",
            ["DisplayTitle"] = "hookmetamethod",
            ["LayoutOrder"] = 666,
            ["Savable"] = false,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = true,
            ["ExtraData"] = {
                ["Requirement"] = true,
            },
            ["ScriptFunction"] = function(self, State) end
        },
        ["getgc"] = {
            ["DisplayDescription"] = " ",
            ["DisplayTitle"] = "getgc",
            ["LayoutOrder"] = 666,
            ["Savable"] = false,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = true,
            ["ExtraData"] = {
                ["Requirement"] = true,
            },
            ["ScriptFunction"] = function(self, State) end
        },
        ["require"] = {
            ["DisplayDescription"] = " ",
            ["DisplayTitle"] = "require",
            ["LayoutOrder"] = 666,
            ["Savable"] = false,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = true,
            ["ExtraData"] = {
                ["Requirement"] = true,
            },
            ["ScriptFunction"] = function(self, State) end
        },
        ["files"] = {
            ["DisplayDescription"] = " ",
            ["DisplayTitle"] = "files",
            ["LayoutOrder"] = 666,
            ["Savable"] = false,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = true,
            ["ExtraData"] = {
                ["Requirement"] = true,
            },
            ["ScriptFunction"] = function(self, State) end
        },
        ["OfficialGame"] = {
            ["DisplayDescription"] = " ",
            ["DisplayTitle"] = "Official Game",
            ["LayoutOrder"] = 666,
            ["Savable"] = false,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = game.GameId == 6331902150 or game.GameId == 7464167604,
            ["ExtraData"] = {
                ["Requirement"] = true,
            },
            ["ScriptFunction"] = function(self, State) end
        },
        ["PrivateServer"] = {
            ["DisplayDescription"] = " ",
            ["DisplayTitle"] = "Private Server",
            ["LayoutOrder"] = 666,
            ["Savable"] = false,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = workspace:GetAttribute("ServerType") == "VIP",
            ["ExtraData"] = {
                ["Requirement"] = true,
            },
            ["ScriptFunction"] = function(self, State) end
        },
        ["PrivateServerOwner"] = {
            ["DisplayDescription"] = " ",
            ["DisplayTitle"] = "Private Server",
            ["LayoutOrder"] = 666,
            ["Savable"] = false,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = workspace:GetAttribute("ServerOwnerID") == LocalPlayer.UserId,
            ["ExtraData"] = {
                ["Requirement"] = true,
            },
            ["ScriptFunction"] = function(self, State) end
        },
        ["NServer"] = {
            ["DisplayDescription"] = " ",
            ["DisplayTitle"] = "N Server",
            ["LayoutOrder"] = 666,
            ["Savable"] = false,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = game.PlaceId == 83645629621104,
            ["ExtraData"] = {
                ["Requirement"] = true,
            },
            ["ScriptFunction"] = function(self, State) end
        },
        ["Computer"] = {
            ["DisplayDescription"] = " ",
            ["DisplayTitle"] = "Computer",
            ["LayoutOrder"] = 666,
            ["Savable"] = false,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = UserInputService.KeyboardEnabled,
            ["ExtraData"] = {
                ["Requirement"] = true,
            },
            ["ScriptFunction"] = function(self, State) end
        },
    },

    ["Automation"] = {
        ["TabAttributes"] = {
            ["DisplayTitle"] = "Automation",
            ["LayoutOrder"] = 1
        },
        ["AutoGeneratorPuzzle"] = {
            ["DisplayDescription"] = "Auto-Completes Generator Puzzles",
            ["DisplayTitle"] = "Auto Generator(s)",
            ["LayoutOrder"] = 1,
            ["Savable"] = true,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {},
            ["ScriptFunction"] = function(self, Value) end
        },
        ["AutoPickup"] = {
            ["DisplayDescription"] = "Auto-Picks up Items near you",
            ["DisplayTitle"] = "Auto Pickup",
            ["LayoutOrder"] = 2,
            ["Savable"] = true,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {},
            ["ScriptFunction"] = function(self, Value) end
        },
    },

    ["Features"] = {
        ["TabAttributes"] = {
            ["DisplayTitle"] = "Features",
            ["LayoutOrder"] = 2
        },
        ["Invincible"] = {
            ["DisplayDescription"] = "Makes you invisible & god mode (you can still use abilities)",
            ["DisplayTitle"] = "Invincible",
            ["LayoutOrder"] = 1,
            ["Savable"] = false,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {
                ["Requirement"] = "hookmetamethod|require|OfficialGame"
            },
            ["ScriptFunction"] = function(self, Value)
                if workspace:GetAttribute("Invincible") == nil then
                    workspace:SetAttribute("Invincible", Value)
                    self.Instance.Value = Value
                    if Value then
                        FeatureLoadout["Features"]["DisableToxicTrails"].Instance.Value = true
                        FeatureLoadout["Features"]["DisableFootprints"].Instance.Value = true
                    end
                    task.delay(1.5, function()
                        workspace:SetAttribute("Invincible",nil)
                    end)
                    GoUnder(Value)
                else
                    self.Instance.Value = workspace:GetAttribute("Invincible")
                end
            end
        },
        ["DisableKillerWalls"] = {
            ["DisplayDescription"] = "Disables All Killer Walls (Red Walls)",
            ["DisplayTitle"] = "Disable Killer Walls",
            ["LayoutOrder"] = 2,
            ["Savable"] = false,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {
                ["Requirement"] = true
            },
            ["ScriptFunction"] = function(self, Value)
                local VertexColor = Value and Vector3.new(0,255,0) or Vector3.new(255,0,0)
                local Color = Value and Color3.new(0,1,0) or Color3.new(1,0,0)
                local KillerDoorsFolder = GameMap and (GameMap:FindFirstChild("KillerDoors",true) or GameMap:FindFirstChild("Killer Doors",true))
                local KillerCollisions = GameMap and GameMap:FindFirstChild("KillerOnly",true)
                if KillerDoorsFolder then
                    for i,v in KillerDoorsFolder:GetChildren() do
                        v.Color = Color
                        if v:GetAttribute("OriginalCanCollide") == nil then
                            v:SetAttribute("OriginalCanCollide", v.CanCollide)
                        end
                        v.CanCollide = v:GetAttribute("OriginalCanCollide") ~= false and not Value or false
                        if KillerCollisions then
                            local Params = OverlapParams.new()
                            Params.FilterType = Enum.RaycastFilterType.Include
                            Params.CollisionGroup = "Killers"
                            Params.FilterDescendantsInstances = {KillerCollisions}
                            local Hitbox = workspace:GetPartBoundsInRadius(v.Position, 10, Params)
                            for i,v in Hitbox do
                                v.CanCollide = not Value
                            end
                        end
                        if v:FindFirstChildOfClass("SpecialMesh") then
                            v:FindFirstChildOfClass("SpecialMesh").VertexColor = VertexColor
                        end
                    end
                end
            end
        },
        ["DisableToxicTrails"] = {
            ["DisplayDescription"] = "Disables damaging trails for john doe",
            ["DisplayTitle"] = "Disable John Doe's Trails",
            ["LayoutOrder"] = 3,
            ["Savable"] = true,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {},
            ["ScriptFunction"] = function(self, Value)
                for i,v in InGame:GetChildren() do
                    if v:IsA("Folder") and (v.Name):find("JohnDoeTrail") then
                        for i,v2 in v:GetChildren() do
                            if v2:IsA("BasePart") then
                                v2.CanTouch = not Value
                            end
                        end
                    end
                end
            end
        },
        ["DisableFootprints"] = {
            ["DisplayDescription"] = "Disables footprints made by john doe",
            ["DisplayTitle"] = "Disable John Doe's Footprints",
            ["LayoutOrder"] = 4,
            ["Savable"] = true,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {},
            ["ScriptFunction"] = function(self, Value)
                for i,v in InGame:GetChildren() do
                    if v:IsA("Folder") and (v.Name):find("Shadows") then
                        for i,v2 in v:GetChildren() do
                            if v2:IsA("BasePart") then
                                v2.CanTouch = not Value
                            end
                        end
                        if not v:GetAttribute("Checked") then
                            v:SetAttribute("Checked", true)
                            v.ChildAdded:Connect(function(GrandChild)
                                if GrandChild:IsA("BasePart") then
                                    GrandChild.CanTouch = not FeatureLoadout["Features"]["DisableFootprints"]["Instance"].Value
                                end
                            end)
                        end
                    end
                end
            end
        },
        ["SmallerSpikeCollisions"] = {
            ["DisplayDescription"] = "Makes spike collisions smaller for john doe's ability",
            ["DisplayTitle"] = "Smaller Spike Collisions",
            ["LayoutOrder"] = 5,
            ["Savable"] = true,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {},
            ["ScriptFunction"] = function(self, Value)
                for i,v in InGame:GetChildren() do
                    if v.Name == "SpikeCollision" then
                        v.Size = Value and Vector3.new(10,3.25,3.25) or Vector3.new(11, 5, 5)
                        v.Shape = Value and Enum.PartType.Cylinder or Enum.PartType.Block
                    end
                end
            end
        },
        ["EnableJumping"] = {
            ["DisplayDescription"] = "Enables Jumping for when its disabled",
            ["DisplayTitle"] = "Enable Jumping",
            ["LayoutOrder"] = 7,
            ["Savable"] = false,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {},
            ["ScriptFunction"] = function(self, Value)
                HandleAllowJumping(Value)
            end
        },
        ["StaminaPreset"] = {
            ["DisplayDescription"] = "Select a Stamina Preset",
            ["DisplayTitle"] = "Stamina Preset",
            ["LayoutOrder"] = 8,
            ["Savable"] = true,
            ["InstanceType"] = "StringValue",
            ["DefaultInstanceValue"] = "Original",
            ["ExtraData"] = {
                ["Requirement"] = "require",
                ["Options"] = "Original|Realistic|Semi-Realistic|Infinite"
            },
            ["ScriptFunction"] = function(self, Value) end
        },
        ["AntiSlowness"] = {
            ["DisplayDescription"] = "Removes all types of Slowness Effects",
            ["DisplayTitle"] = "Anti Slowness",
            ["LayoutOrder"] = 9,
            ["Savable"] = true,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {},
            ["ScriptFunction"] = function(self, Value)
                if not Value or not SpeedMultipliers then
                    return
                end
                for i,Child in SpeedMultipliers:GetChildren() do
                    Check(Child)
                end
            end
        },
        ["AnimationChanger"] = {
            ["DisplayDescription"] = "Select a character to override the animations",
            ["DisplayTitle"] = "Animation Changer",
            ["LayoutOrder"] = 10,
            ["Savable"] = false,
            ["InstanceType"] = "StringValue",
            ["DefaultInstanceValue"] = "Original",
            ["ExtraData"] = {
                ["Requirement"] = "require",
                ["Options"] = "Original|Jason|Slasher|c00lkidd|John Doe|Noli|1x1x1x1|Nosferatu|Azure|!Herobrine|!Brimstone"
            },
            ["ScriptFunction"] = function(self, Value)
                if Value == "Original" then
                    BindableShouldStop:Fire()
                else
                    
                    local Animator = LocalHumanoid and LocalHumanoid:FindFirstChildOfClass("Animator")
                    if ChangeTrackWithOverride then
                        for i,v in Animator:GetPlayingAnimationTracks() do
                            ChangeTrackWithOverride(v,Value,true)
                        end
                    end
                end
            end
        },
        ["NoliControl"] = {
            ["DisplayDescription"] = "Allows you to have better control of Void Rush Ability",
            ["DisplayTitle"] = "Better Void Rush",
            ["LayoutOrder"] = 11,
            ["Savable"] = true,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {
                ["Requirement"] = "require"
            },
            ["ScriptFunction"] = function(self, Value)
                if NoliConfig then
                    for _, Entry in {
                        {Name = "InitialTurnDuration", Value = 0.005, Default = 1.5},
                        {Name = "TurnSpeed", Value = 10000, Default = 1},
                        {Name = "InitialTurnMult", Value = 1000, Default = 6.6},
                    } do
                        local Key, _, Parent = TableValueFind(NoliConfig, function(i, v) return type(i) == "string" and i:find(Entry.Name) and not i:find(Entry.Name .. "OG") end)
                        if Key and Parent then
                            if Value then
                                Parent[Entry.Name .. "OG"] = Parent[Key]
                                Parent[Key] = Entry.Value
                            elseif Parent[Entry.Name .. "OG"] ~= nil then
                                Parent[Key] = Parent[Entry.Name .. "OG"] or Entry.Default
                            end
                        end
                    end
                    if LocalCharacter and LocalCharacter.Parent.Name == "Killers" and not workspace:GetAttribute("NotifCD") then
                        StarterGui:SetCore("SendNotification", {
                            Title = "Information",
                            Text = "Changes only apply the time you become the killer",
                            Duration = 5
                        })
                        workspace:SetAttribute("NotifCD", true)
                        task.delay(10, function()
                            workspace:SetAttribute("NotifCD", nil)
                        end)
                    end
                end
            end
        },
        ["ControllableDash"] = {
            ["DisplayDescription"] = "Allows you to control where the dash goes just like Void Rush Ability",
            ["DisplayTitle"] = "Make Coolkidd's Dash Controllable",
            ["LayoutOrder"] = 12,
            ["Savable"] = true,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {},
            ["ScriptFunction"] = function(self, Value) end
        }
    },

    ["Visuals"] = {
        ["TabAttributes"] = {
            ["DisplayTitle"] = "Visuals",
            ["LayoutOrder"] = 3
        },
        ["DisableNoliNPC"] = {
            ["DisplayDescription"] = "Disables Noli's Distracting NPC",
            ["DisplayTitle"] = "Disable Noli's NPC",
            ["LayoutOrder"] = 1,
            ["Savable"] = true,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {},
            ["ScriptFunction"] = function(self, Value)
                HandleNoliNPC(Value)
            end
        },
        ["Disable007n7NPC"] = {
            ["DisplayDescription"] = "Disables 007n7's Distracting NPC",
            ["DisplayTitle"] = "Disable 007n7's NPC",
            ["LayoutOrder"] = 1,
            ["Savable"] = true,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {},
            ["ScriptFunction"] = function(self, Value)
                Handle007n7NPC(Value)
            end
        },
        ["ESP"] = {
            ["DisplayDescription"] = "Track things in the game through walls",
            ["DisplayTitle"] = "ESP",
            ["LayoutOrder"] = 2,
            ["Savable"] = true,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {},
            ["ScriptFunction"] = function(self, Value) end
        },
        ["KillersESP"] = {
            ["DisplayDescription"] = "Enables ESP for the killer(s)",
            ["DisplayTitle"] = "Killer(s) (ESP)",
            ["LayoutOrder"] = 3,
            ["Savable"] = true,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {
                ["Requirement"] = "ESP",
            },
            ["ScriptFunction"] = function(self, Value) end
        },
        ["KillersColor"] = {
            ["DisplayDescription"] = "Select a Color for Killer(s) (ESP)",
            ["DisplayTitle"] = "Killer(s) Color",
            ["LayoutOrder"] = 4,
            ["Savable"] = true,
            ["InstanceType"] = "StringValue",
            ["DefaultInstanceValue"] = "Red",
            ["ExtraData"] = {
                ["Requirement"] = "ESP|KillersESP",
                ["Options"] = "Red|Orange|Purple|Gold",
            },
            ["ScriptFunction"] = function(self, Value)
                local Name = "Killer(s)"
                local H, S, V = ColorPresets[Value]:ToHSV()
                local Color = ColorPresets[Value]
                local DarkerColor = Color3.fromHSV(H, S, V * 0.7)
                for i,v in FeatureLoadout["Visuals"] do
                    if v["DisplayTitle"]:find(Name,1,true) then
                        local ColoredName = RichTextGradientColor(Name,{Color,DarkerColor})
                        local FormattedName = Name:gsub("([%(%)])", "%%%1")
                        local ColoredText = v["DisplayTitle"]:gsub(FormattedName, ColoredName, 1)
                        if v["Instance"] then
                            v["Instance"]:SetAttribute("DisplayTitle",ColoredText)
                        else
                            v["DisplayTitle"] = ColoredText
                        end
                    end
                end
            end
        },
        ["SurvivorsESP"] = {
            ["DisplayDescription"] = "Enables ESP for the survivor(s)",
            ["DisplayTitle"] = "Survivor(s) (ESP)",
            ["LayoutOrder"] = 6,
            ["Savable"] = true,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {
                ["Requirement"] = "ESP",
            },
            ["ScriptFunction"] = function(self, Value) end
        },
        ["SurvivorsColor"] = {
            ["DisplayDescription"] = "Select a Color for Survivor(s) (ESP)",
            ["DisplayTitle"] = "Survivor(s) Color",
            ["LayoutOrder"] = 7,
            ["Savable"] = true,
            ["InstanceType"] = "StringValue",
            ["DefaultInstanceValue"] = "Green",
            ["ExtraData"] = {
                ["Requirement"] = "ESP|SurvivorsESP",
                ["Options"] = "Green|Orange|Purple|Gold",
            },
            ["ScriptFunction"] = function(self, Value)
                local Name = "Survivor(s)"
                local H, S, V = ColorPresets[Value]:ToHSV()
                local Color = ColorPresets[Value]
                local DarkerColor = Color3.fromHSV(H, S, V * 0.7)
                for i,v in FeatureLoadout["Visuals"] do
                    if v["DisplayTitle"]:find(Name,1,true) then
                        local ColoredName = RichTextGradientColor(Name,{Color,DarkerColor})
                        local FormattedName = Name:gsub("([%(%)])", "%%%1")
                        local ColoredText = v["DisplayTitle"]:gsub(FormattedName, ColoredName, 1)
                        if v["Instance"] then
                            v["Instance"]:SetAttribute("DisplayTitle",ColoredText)
                        else
                            v["DisplayTitle"] = ColoredText
                        end
                    end
                end
            end
        },
        ["GeneratorsESP"] = {
            ["DisplayDescription"] = "Enables ESP for the Generator(s)",
            ["DisplayTitle"] = "Generator(s) (ESP)",
            ["LayoutOrder"] = 9,
            ["Savable"] = true,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {
                ["Requirement"] = "ESP",
            },
            ["ScriptFunction"] = function(self, Value) end
        },
        ["GeneratorsColor"] = {
            ["DisplayDescription"] = "Select a Color for Generator(s) (ESP)",
            ["DisplayTitle"] = "Generator(s) Color",
            ["LayoutOrder"] = 10,
            ["Savable"] = true,
            ["InstanceType"] = "StringValue",
            ["DefaultInstanceValue"] = "Cyan",
            ["ExtraData"] = {
                ["Requirement"] = "ESP|GeneratorsESP",
                ["Options"] = "Cyan|Blue|Green|Orange|Purple|Gold",
            },
            ["ScriptFunction"] = function(self, Value)
                local Name = "Generator(s)"
                local H, S, V = ColorPresets[Value]:ToHSV()
                local Color = ColorPresets[Value]
                local DarkerColor = Color3.fromHSV(H, S, V * 0.7)
                for i,v in FeatureLoadout["Visuals"] do
                    if v["DisplayTitle"]:find(Name,1,true) then
                        local ColoredName = RichTextGradientColor(Name,{Color,DarkerColor})
                        local FormattedName = Name:gsub("([%(%)])", "%%%1")
                        local ColoredText = v["DisplayTitle"]:gsub(FormattedName, ColoredName, 1)
                        if v["Instance"] then
                            v["Instance"]:SetAttribute("DisplayTitle",ColoredText)
                        else
                            v["DisplayTitle"] = ColoredText
                        end
                    end
                end
            end
        },
        ["GeneratorsCheck"] = {
            ["DisplayDescription"] = "Hides Generator(s) That are Completed (ESP)",
            ["DisplayTitle"] = "Hide Completed Generator(s)",
            ["LayoutOrder"] = 11,
            ["Savable"] = true,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = true,
            ["ExtraData"] = {
                ["Requirement"] = "ESP|GeneratorsESP",
            },
            ["ScriptFunction"] = function(self, Value) end
        },
        ["ItemsESP"] = {
            ["DisplayDescription"] = "Enables ESP for the Item(s)",
            ["DisplayTitle"] = "Item(s) (ESP)",
            ["LayoutOrder"] = 12,
            ["Savable"] = true,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {
                ["Requirement"] = "ESP",
            },
            ["ScriptFunction"] = function(self, Value) end
        },
        ["ItemsColor"] = {
            ["DisplayDescription"] = "Select a Color for Item(s) (ESP)",
            ["DisplayTitle"] = "Item(s) Color",
            ["LayoutOrder"] = 13,
            ["Savable"] = true,
            ["InstanceType"] = "StringValue",
            ["DefaultInstanceValue"] = "Gold",
            ["ExtraData"] = {
                ["Requirement"] = "ESP|ItemsESP",
                ["Options"] = "Gold|Cyan|Purple|White",
            },
            ["ScriptFunction"] = function(self, Value)
                local Name = "Item(s)"
                local H, S, V = ColorPresets[Value]:ToHSV()
                local Color = ColorPresets[Value]
                local DarkerColor = Color3.fromHSV(H, S, V * 0.7)
                for i,v in FeatureLoadout["Visuals"] do
                    if v["DisplayTitle"]:find(Name,1,true) then
                        local ColoredName = RichTextGradientColor(Name,{Color,DarkerColor})
                        local FormattedName = Name:gsub("([%(%)])", "%%%1")
                        local ColoredText = v["DisplayTitle"]:gsub(FormattedName, ColoredName, 1)
                        if v["Instance"] then
                            v["Instance"]:SetAttribute("DisplayTitle",ColoredText)
                        else
                            v["DisplayTitle"] = ColoredText
                        end
                    end
                end
            end
        },
        ["ESPName"] = {
            ["DisplayDescription"] = "Menampilkan nama Killer & Survivor",
            ["DisplayTitle"] = "Name ESP",
            ["LayoutOrder"] = 14,
            ["Savable"] = true,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {
                ["Requirement"] = "ESP",
            },
            ["ScriptFunction"] = function(self, Value) end
        },
        ["ESPBox"] = {
            ["DisplayDescription"] = "Menampilkan Box 3D pada Killer & Survivor",
            ["DisplayTitle"] = "3D Box ESP",
            ["LayoutOrder"] = 15,
            ["Savable"] = true,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {
                ["Requirement"] = "ESP",
            },
            ["ScriptFunction"] = function(self, Value) end
        },
        ["ESPTracer"] = {
            ["DisplayDescription"] = "Menarik garis (Tracer) ke Killer & Survivor",
            ["DisplayTitle"] = "Tracer (Line) ESP",
            ["LayoutOrder"] = 16,
            ["Savable"] = true,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {
                ["Requirement"] = "ESP",
            },
            ["ScriptFunction"] = function(self, Value) end
        },
    },

    ["Miscellaneous"] = {
        ["TabAttributes"] = {
            ["DisplayTitle"] = "Miscellaneous",
            ["LayoutOrder"] = 4
        },
        ["ExtendedFOV"] = {
            ["DisplayDescription"] = "A extended version of the FOV inside the normal settings",
            ["DisplayTitle"] = "Extended FOV",
            ["LayoutOrder"] = 1,
            ["Savable"] = true,
            ["InstanceType"] = "NumberValue",
            ["DefaultInstanceValue"] = PlayerData.Settings.Game.FieldOfView.Value,
            ["ExtraData"] = {
                ["MaxValue"] = 120,
                ["MinValue"] = 10,
                ["Step"] = 5,
            },
            ["ScriptFunction"] = function(self, Value)
                PlayerData.Settings.Game.FieldOfView.Value = Value
            end
        },
        ["ExtendedZoom"] = {
            ["DisplayDescription"] = "Extends the Maximum Zoom Distance for the camera",
            ["DisplayTitle"] = "Extended Zoom Distance",
            ["LayoutOrder"] = 2,
            ["Savable"] = true,
            ["InstanceType"] = "NumberValue",
            ["DefaultInstanceValue"] = 10,
            ["ExtraData"] = {
                ["MaxValue"] = 100,
                ["MinValue"] = 0,
                ["Step"] = 5,
            },
            ["ScriptFunction"] = function(self, Value)
                LocalPlayer.CameraMaxZoomDistance = game:GetService("StarterPlayer").CameraMaxZoomDistance + (Value * 0.25)
            end
        },
        ["ShowChat"] = {
            ["DisplayDescription"] = "Shows the Full Chat while in the Round",
            ["DisplayTitle"] = "Show Chat",
            ["LayoutOrder"] = 3,
            ["Savable"] = true,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {
                ["Requirement"] = not game:GetService("Chat"):CanUserChatAsync(LocalPlayer.UserId) and true or nil
            },
            ["ScriptFunction"] = function(self, Value)
                if TextChatService:FindFirstChildOfClass("ChatWindowConfiguration") then
                    TextChatService:FindFirstChildOfClass("ChatWindowConfiguration").Enabled = Value
                end
            end
        },
        ["ShowPrivacy"] = {
            ["DisplayDescription"] = "Shows everyones privacy info",
            ["DisplayTitle"] = "Shows Privacy Info",
            ["LayoutOrder"] = 4,
            ["Savable"] = true,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {},
            ["ScriptFunction"] = function(self, Value)
                for i,v in Players:GetPlayers() do
                    if v ~= LocalPlayer then
                        HandlePrivacySettings(v)
                    end
                end
            end
        },
        ["HideInjury"] = {
            ["DisplayDescription"] = "Hides the injured screen and effects used when you are low health",
            ["DisplayTitle"] = "Hide Injured UI/Effects",
            ["LayoutOrder"] = 5,
            ["Savable"] = true,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = true,
            ["ExtraData"] = {},
            ["ScriptFunction"] = function(self, Value)
                for i,v in PlayerGui:FindFirstChild("TemporaryUI"):QueryDescendants("#redFlash,#injuredVignette") do
                    v.Visible = not Value
                end
                if game:GetService("Lighting"):FindFirstChild("HealthDesaturation") then
                    game:GetService("Lighting"):FindFirstChild("HealthDesaturation").Enabled = not Value
                end
            end
        },
        ["DeleteRagdolls"] = {
            ["DisplayDescription"] = "Deletes ALL Ragdolls regardless the type of ragdoll for performance",
            ["DisplayTitle"] = "Delete All Ragdolls",
            ["LayoutOrder"] = 6,
            ["Savable"] = true,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {
                ["Requirement"] = "PrivateServer"
            },
            ["ScriptFunction"] = function(self, Value)
                if workspace:FindFirstChild("Ragdolls") and Value then
                    workspace:FindFirstChild("Ragdolls"):ClearAllChildren()
                end
            end
        },
        ["PlayerSelectCrash"] = {
            ["DisplayDescription"] = "Select a player to crash",
            ["DisplayTitle"] = "Player to crash",
            ["LayoutOrder"] = 8,
            ["Savable"] = false,
            ["InstanceType"] = "StringValue",
            ["DefaultInstanceValue"] = "None",
            ["ExtraData"] = {
                ["Requirement"] = "PrivateServerOwner",
                ["Options"] = "None",
            },
            ["ScriptFunction"] = function(self, Value) end
        },
        ["CrashTheTarget"] = {
            ["DisplayDescription"] = "Crashes the selected target (Host Exclusive)",
            ["DisplayTitle"] = "Crash Target",
            ["LayoutOrder"] = 9,
            ["Savable"] = false,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {
                ["Requirement"] = "PlayerSelectCrash~None|PrivateServerOwner",
            },
            ["ScriptFunction"] = function(self, Value)
                if Value then
                    self.Instance.Value = false
                    local PlayerName = FeatureLoadout["Miscellaneous"]["PlayerSelectCrash"]["Instance"].Value
                    if PlayerName == "Everyone" or PlayerName == "Both" then
                        for i,Player in Players:GetPlayers() do
                            if Player ~= LocalPlayer then
                                local Name = Player.Name
                                task.spawn(function()
                                    repeat
                                        Network:WaitForChild("RemoteEvent"):FireServer("ExecuteCommand", {"GiveStatus", Name, "Nausea", math.huge, 1})
                                        task.wait(1.5)
                                    until not Players:FindFirstChild(Name)
                                end)
                            end
                        end
                    else
                        task.spawn(function()
                            repeat
                                Network:WaitForChild("RemoteEvent"):FireServer("ExecuteCommand", {"GiveStatus", PlayerName, "Nausea", math.huge, 1})
                                task.wait(1.5)
                            until not Players:FindFirstChild(PlayerName)
                        end)
                    end
                end
            end
        },
        ["SkyGlitch"] = {
            ["DisplayDescription"] = "Gives sky glitching effect to everyone (Host Exclusive)",
            ["DisplayTitle"] = "Sky Glitch",
            ["LayoutOrder"] = 10,
            ["Savable"] = false,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {
                ["Requirement"] = "PrivateServerOwner"
            },
            ["ScriptFunction"] = function(self, Value)
                if Value and not workspace:GetAttribute("EffectActive") then
                    workspace:SetAttribute("EffectActive",true)
                    self.Instance.Value = false
                    Network:WaitForChild("RemoteEvent"):FireServer("ExecuteCommand", {"GiveStatus", "All", "Nausea", -1e11, 10})
                    task.delay(10, function()
                        workspace:SetAttribute("EffectActive",nil)
                        self.Instance.Value = false
                    end)
                elseif workspace:GetAttribute("EffectActive") then
                    self.Instance.Value = true
                end
            end
        },
        ["InstaKill"] = {
            ["DisplayDescription"] = "Allows you to instantly kill anyone (Host Exclusive)",
            ["DisplayTitle"] = "Instant Kill",
            ["LayoutOrder"] = 11,
            ["Savable"] = false,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {
                ["Requirement"] = "PrivateServerOwner"
            },
            ["ScriptFunction"] = function(self, Value)
                 if workspace:GetAttribute("InstaKill") == nil then
                    workspace:SetAttribute("InstaKill", Value)
                    self.Instance.Value = Value
                    task.delay(1.5, function()
                        workspace:SetAttribute("InstaKill",nil)
                    end)
                    if Value then
                        repeat
                            Network:WaitForChild("RemoteEvent"):FireServer("ExecuteCommand", {"GiveStatus", game.Players.LocalPlayer.Name, "Strength", 99999, 1})
                            task.wait(0.5)
                        until not self.Instance.Value
                    end
                else
                    self.Instance.Value = workspace:GetAttribute("InstaKill")
                end
            end
        },
        ["OfficialJoin"] = {
            ["DisplayDescription"] = "Makes you join the official forsaken game",
            ["DisplayTitle"] = "Join the official version",
            ["LayoutOrder"] = 14,
            ["Savable"] = false,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {
                ["Requirement"] = "OfficialGame~true"
            },
            ["ScriptFunction"] = function(self, Value)
                if Value and not workspace:GetAttribute("LoadingTeleport") then
                    workspace:SetAttribute("LoadingTeleport",true)
                    local A = workspace:FindFirstChild("Sounds") and workspace.Sounds:ClearAllChildren()
                    local B = workspace:FindFirstChild("Themes") and workspace.Themes:ClearAllChildren()
                    PlaySound("deadJOutIaw_Nova",{["TimePosition"] = 0.4})
                    local OtherValue,OtherInstance = GetValue("Rejoin")
                    OtherInstance:SetAttribute("Requirement",true)
                    task.wait(0.5)
                    game:GetService("ExperienceService"):LaunchExperience({placeId = 83645629621104})
                elseif workspace:GetAttribute("LoadingTeleport") then
                    self.Instance.Value = true
                end
            end
        },
        ["Rejoin"] = {
            ["DisplayDescription"] = "Makes you rejoin the exact same server",
            ["DisplayTitle"] = "Rejoin",
            ["LayoutOrder"] = 15,
            ["Savable"] = false,
            ["InstanceType"] = "BoolValue",
            ["DefaultInstanceValue"] = false,
            ["ExtraData"] = {},
            ["ScriptFunction"] = function(self, Value)
                if Value and not workspace:GetAttribute("LoadingTeleport") then
                    workspace:SetAttribute("LoadingTeleport",true)
                    local A = workspace:FindFirstChild("Sounds") and workspace.Sounds:ClearAllChildren()
                    local B = workspace:FindFirstChild("Themes") and workspace.Themes:ClearAllChildren()
                    PlaySound("deadJOutIaw_Nova",{["TimePosition"] = 0.4})
                    local OtherValue,OtherInstance = GetValue("OfficialJoin")
                    OtherInstance:SetAttribute("Requirement",true)
                    task.wait(0.25)
                    if workspace:GetAttribute("ServerType") == "VIP" then
                        game:GetService("TeleportService"):Teleport(game.PlaceId)
                    else
                        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId)
                    end
                elseif workspace:GetAttribute("LoadingTeleport") then
                    self.Instance.Value = true
                end
            end
        },
    }
}

-- UI Creation Base Database --

PlusFolderSettings.Name = "Plus"
PlusFolderSettings.Parent = PlayerData

-- Functions --

function ColoredPrint(Text, Icon, Color)
    task.spawn(function()
        local UniqueID = string.sub(game:GetService("HttpService"):GenerateGUID(false), 1, 7)
        print("[Forsaken Plus]: " .. tostring(Text) .. " | " .. UniqueID)
    end)
end

function PlaySound(SoundName,Settings,KeepPlaying)
    local Sound = typeof(SoundName) == "string" and game:GetService("ReplicatedStorage").Assets.Sounds:FindFirstChild(SoundName,true) or (typeof(SoundName) == "Instance" and SoundName) or nil
    if Sound then
        task.spawn(function()
            Sound = Sound:Clone()
            Sound.Parent = workspace:FindFirstChild("Sounds") or workspace
            if type(Settings) == "table" then
                for i,v in Settings do
                    Sound[i] = v
                end
            end
            if KeepPlaying then
                Sound.Playing = true
            else
                Sound:Play()
            end
            Debris:AddItem(Sound, Sound.TimeLength + 1)
            return Sound
        end)
    else
        warn("Failed to play sound: ".. tostring(SoundName))
    end
end

function GetValue(FeatureName)
    local FeatureInstance = PlusFolderSettings:FindFirstChild(FeatureName,true)
    if FeatureInstance then
        return FeatureInstance.Value,FeatureInstance
    end
    return nil
end

local function GetFunction(...)
    for i,v in table.pack(...) do
        if v and typeof(v) == "function" then
            return v
        end
    end
    return nil
end

function RichTextGradientColor(Text:string,Colors)
	return Text -- Cleaned up rich text to avoid UI breaking in executor
end

local function CheckDistance(Highlight, TargetRoot, Settings)
    if workspace.CurrentCamera and TargetRoot then
        local Distance = (workspace.CurrentCamera.CFrame.Position - TargetRoot.Position).Magnitude
        if Distance>1200 then
            Distance = 0
        end
        if Distance >= Settings["MinDistance"] then
            local TransparencyAmount = math.clamp(1 - math.clamp((Distance - Settings["MinDistance"]) / (Settings["MaxDistance"] - Settings["MinDistance"]), 0, 1), 0.45, 1)
            local Tween = TweenService:Create(Highlight, TweenInfo.new(0.1), {FillTransparency = TransparencyAmount + 0.05, OutlineTransparency = TransparencyAmount <= 0.95 and TransparencyAmount - 0.05 or TransparencyAmount})
            Tween.Parent = Highlight
            Tween:Play()
            Debris:AddItem(Tween, 0.1)
        else
            local Tween = TweenService:Create(Highlight, TweenInfo.new(0.1), {FillTransparency = 1, OutlineTransparency = 1})
            Tween.Parent = Highlight
            Tween:Play()
            Debris:AddItem(Tween, 0.1)
        end
    end
end

local function CreateDynamicHighlight(Enabled,ItemInstance,TargetRoot,Settings)
    Settings = type(Settings) == "table" and Settings or {["MaxDistance"] = 100,["MinDistance"] = 10,["Color"] = Color3.new(1,1,1)}
    local Highlight = ItemInstance:QueryDescendants("Highlight[$Dynamic]")
    if Enabled and GetValue("ESP") then
        if not Highlight[1] then
            Highlight = Instance.new("Highlight")
            Highlight.Name = HttpService:GenerateGUID(false)
            local H, S, V = Settings.Color:ToHSV()
            Highlight.FillColor = Color3.fromHSV(H, S, V * 0.8)
            Highlight.OutlineColor = Color3.fromHSV(H, S, V * 1.1)
            Highlight:SetAttribute("Dynamic",true)
            Highlight.Parent = ItemInstance
            Highlight.Adornee = ItemInstance
            Highlight.FillTransparency = 1
            Highlight.OutlineTransparency = 1
            CheckDistance(Highlight, TargetRoot, Settings)
        else
            Highlight = Highlight[1]
            local H, S, V = Settings.Color:ToHSV()
            Highlight.FillColor = Color3.fromHSV(H, S, V * 0.8)
            Highlight.OutlineColor = Color3.fromHSV(H, S, V * 1.1)
            CheckDistance(Highlight, TargetRoot, Settings)
        end
    elseif Highlight[1] then
        Highlight[1]:Destroy()
    end
end

local function UpdateCustomESP(Character, Enabled, Settings)
    local Root = Character:FindFirstChild("HumanoidRootPart")
    if not Root then return end

    local espFolder = Character:FindFirstChild("CustomESPFolder")
    if not Enabled then
        if espFolder then espFolder:Destroy() end
        return
    end

    if not espFolder then
        espFolder = Instance.new("Folder")
        espFolder.Name = "CustomESPFolder"
        espFolder.Parent = Character
    end

    -- LOGIKA NAME ESP
    local nameESP = espFolder:FindFirstChild("NameESP")
    if GetValue("ESPName") then
        if not nameESP then
            nameESP = Instance.new("BillboardGui")
            nameESP.Name = "NameESP"
            nameESP.Size = UDim2.new(0, 200, 0, 50)
            nameESP.StudsOffset = Vector3.new(0, 3.5, 0)
            nameESP.AlwaysOnTop = true
            nameESP.Parent = espFolder
            nameESP.Adornee = Root

            local text = Instance.new("TextLabel")
            text.Name = "TextLabel"
            text.Size = UDim2.new(1, 0, 1, 0)
            text.BackgroundTransparency = 1
            text.Text = Character.Name
            text.Font = Enum.Font.GothamBold
            text.TextSize = 13
            text.TextStrokeTransparency = 0.2
            text.Parent = nameESP
        end
        nameESP.TextLabel.TextColor3 = Settings.Color
    else
        if nameESP then nameESP:Destroy() end
    end

    -- LOGIKA 3D BOX ESP
    local boxESP = espFolder:FindFirstChild("BoxESP")
    if GetValue("ESPBox") then
        if not boxESP then
            boxESP = Instance.new("BoxHandleAdornment")
            boxESP.Name = "BoxESP"
            boxESP.Size = Vector3.new(4, 5.5, 2)
            boxESP.AlwaysOnTop = true
            boxESP.ZIndex = 5
            boxESP.Transparency = 0.6
            boxESP.Parent = espFolder
            boxESP.Adornee = Root
        end
        boxESP.Color3 = Settings.Color
    else
        if boxESP then boxESP:Destroy() end
    end

    -- LOGIKA TRACER (LINE) ESP
    local tracerESP = espFolder:FindFirstChild("TracerESP")
    local localRoot = LocalCharacter and LocalCharacter:FindFirstChild("HumanoidRootPart")
    if GetValue("ESPTracer") and localRoot then
        if not tracerESP then
            tracerESP = Instance.new("Beam")
            tracerESP.Name = "TracerESP"
            tracerESP.FaceCamera = true
            tracerESP.Width0 = 0.05
            tracerESP.Width1 = 0.05
            tracerESP.Transparency = NumberSequence.new(0.2)
            tracerESP.Parent = espFolder
            
            local att0 = localRoot:FindFirstChild("TracerAtt") or Instance.new("Attachment", localRoot)
            att0.Name = "TracerAtt"
            
            local att1 = Root:FindFirstChild("TracerAtt") or Instance.new("Attachment", Root)
            att1.Name = "TracerAtt"

            tracerESP.Attachment0 = att0
            tracerESP.Attachment1 = att1
        end
        tracerESP.Color = ColorSequence.new(Settings.Color)
    else
        if tracerESP then tracerESP:Destroy() end
    end
end

local function UpdatePlayerCrashDrop()
    local OriginString = "None"
    for i,v in Players:GetPlayers() do
        if v ~= LocalPlayer then
            OriginString = OriginString .. "|" .. v.Name
        end
    end
    if #Players:GetPlayers() == 3 then
        OriginString = OriginString .. "|Both"
    elseif #Players:GetPlayers() > 3 then
        OriginString = OriginString .. "|Everyone"
    end
    FeatureLoadout["Miscellaneous"]["PlayerSelectCrash"]["Instance"]:SetAttribute("Options", OriginString)
end

function HandlePrivacySettings(Player)
    if Player then
        local PlayerData = Player:FindFirstChild("PlayerData")
        if PlayerData then
           local PrivacySettings = PlayerData:FindFirstChild("Privacy",true)
            if PrivacySettings then
                for i,v in PrivacySettings:GetChildren() do
                    if not v:GetAttribute("OriginalValue") and v:IsA("BoolValue") then
                        v:SetAttribute("OriginalValue", v.Value)
                        v:GetPropertyChangedSignal("Value"):Connect(function()
                            if FeatureLoadout["Miscellaneous"]["ShowPrivacy"]["Instance"] and FeatureLoadout["Miscellaneous"]["ShowPrivacy"]["Instance"].Value then
                                v.Value = false
                            else
                                v.Value = v:GetAttribute("OriginalValue")
                            end
                        end)
                        if FeatureLoadout["Miscellaneous"]["ShowPrivacy"]["Instance"] and FeatureLoadout["Miscellaneous"]["ShowPrivacy"]["Instance"].Value then
                            v.Value = false
                        else
                            v.Value = v:GetAttribute("OriginalValue")
                        end
                    elseif v:IsA("BoolValue") then
                        if FeatureLoadout["Miscellaneous"]["ShowPrivacy"]["Instance"] and FeatureLoadout["Miscellaneous"]["ShowPrivacy"]["Instance"].Value then
                            v.Value = false
                        else
                            v.Value = v:GetAttribute("OriginalValue")
                        end
                    end
                end
            end
        end
    end
end

function HandleAllowJumping(Value)
    if LocalHumanoid and not LocalHumanoid:GetAttribute("JumpingConnection") then
        if Value then
            if not LocalHumanoid:GetAttribute("JumpingConnection") then
                LocalHumanoid:SetAttribute("JumpingConnection",LocalHumanoid.JumpPower)
            else
                return
            end
            local Connection;Connection = LocalHumanoid.StateChanged:Connect(function(old,new)
                if LocalCharacter.Parent ~= "Spectator" and new == Enum.HumanoidStateType.Jumping or new == Enum.HumanoidStateType.Freefall and LocalHumanoid.JumpPower > 0 and ((FeatureLoadout["Features"]["EnableJumping"]["Instance"] and FeatureLoadout["Features"]["EnableJumping"]["Instance"].Value) or false) then
                    if not(FeatureLoadout["Features"]["EnableJumping"]["Instance"].Value) then
                        Connection:Disconnect()
                        LocalHumanoid.JumpPower = LocalHumanoid:GetAttribute("JumpingConnection") or 0
                        LocalHumanoid:SetAttribute("JumpingConnection",nil)
                        return
                    end
                    task.spawn(function()
                        task.wait(0.067)
                        LocalHumanoid.JumpPower = 0
                    end)
                    task.wait(1.5)
                    if FeatureLoadout["Features"]["EnableJumping"]["Instance"].Value then
                        LocalHumanoid.JumpPower = 47
                    else
                        Connection:Disconnect()
                        LocalHumanoid.JumpPower = LocalHumanoid:GetAttribute("JumpingConnection") or 0
                        LocalHumanoid:SetAttribute("JumpingConnection",nil)
                    end
                end
            end)
        end
        LocalHumanoid.JumpPower = Value and 47 or 0
    end
end

function HandleNoliNPC(Value)
    if Value then
        for i,v in workspace.Players.Killers:GetChildren() do
            if v.Name:lower() == "noli" and not Players:GetPlayerFromCharacter(v) then
                v.Parent = Lighting
                v:PivotTo(v:GetPivot() * CFrame.new(0,-100,0))
            end
        end
        if workspace:FindFirstChild("Themes") then
            for i,v in pairs(workspace.Themes:GetChildren()) do
                if v.Name:find("FakeLayer") and v:IsA("Sound") then
                    v:Destroy()
                end
            end
        end
    else
        for i,v in Lighting:GetChildren() do
            if v.Name:lower() == "noli" then
                v.Parent = InGame
                v:PivotTo(v:GetPivot() * CFrame.new(0,100,0))
            end
        end
    end
end

function Handle007n7NPC(Value)
    if Value then
        for i,v in InGame:GetChildren() do
            if v.Name:lower() == "007n7" and not Players:GetPlayerFromCharacter(v) then
                v.Parent = Lighting
                if v:FindFirstChild("HumanoidRootPart") then
                    v:FindFirstChild("HumanoidRootPart").ChildAdded:Connect(function(Child)
                        if Child:IsA("Sound") and GetValue("Disable007n7NPC") then
                            Child:Destroy()
                        end
                    end)
                end
            end
        end
    else
        for i,v in Lighting:GetChildren() do
            if v.Name:lower() == "007n7" then
                v.Parent = InGame
            end
        end
    end
end

function IsHitboxNotNear(HitboxPart,Position)
    if HitboxPart and Position and LocalRoot then
        local Params = OverlapParams.new()
        Params.FilterType = Enum.RaycastFilterType.Include
        Params.FilterDescendantsInstances = {HitboxPart}
        Params.MaxParts = 1
        local Result = workspace:GetPartBoundsInRadius(Position, 3, Params)
        return #Result == 0
    else
        ColoredPrint("HitboxPart/Position/HumanoidRootPart is nil while trying to check if near", "info", Color3.new(1,0.25,0))
        return false
    end
end

function IsPoisonOnPosition(Position)
    if GameMap and GameMap:FindFirstChild("ToxicWater") then
        local Params = OverlapParams.new()
        Params.FilterType = Enum.RaycastFilterType.Include
        Params.FilterDescendantsInstances = {GameMap.ToxicWater}
        Params.MaxParts = 1
        local Result = workspace:GetPartBoundsInRadius(Position, 6.7, Params)
        return #Result > 0
    else
        ColoredPrint("No gamemap/poison found", "info", Color3.new(1,0.25,0))
        return false
    end
end

function GoUnder(Value)
    local Offset = 15
    if Value == nil then
        IsUnderground = false
        Value = GetValue("Invincible")
    end
    if Value and not IsUnderground then
        IsUnderground = false
        repeat task.wait() until (LocalRoot and LocalHead and LocalHumanoid)
        task.wait(0.25)
        local OldCFrame = LocalRoot.CFrame
        LocalRoot.Velocity = Vector3.new(0,0,0)
        LocalRoot.CFrame = OldCFrame * CFrame.new(0, -Offset, 0)
        LocalHumanoid.CameraOffset = Vector3.new(0, 12e12 ,0)
        local Tries = 0
        local TimerStop = workspace.DistributedGameTime + 3.5
        repeat
            Tries += 1
            task.wait(0.01)
            LocalRoot.CFrame = OldCFrame * CFrame.new(0, -Offset, 0)
            LocalHead.Anchored = true
            repeat task.wait(0.02) until IsHitboxNotNear(LocalCharacter:FindFirstChild("QueryHitbox"),OldCFrame.Position) or not LocalRoot or not LocalCharacter or TimerStop < workspace.DistributedGameTime
            IsUnderground = true
            task.wait(0.02)
            LocalHead.Anchored = false
            LocalRoot.CFrame = OldCFrame
        until IsHitboxNotNear(LocalCharacter:FindFirstChild("QueryHitbox"),OldCFrame.Position) or Tries >= 3
        if Tries >= 3 then
            IsUnderground = false
            workspace:SetAttribute("Invincible",nil)
            FeatureLoadout["Features"]["Invincible"]["Instance"].Value = false
            task.wait(0.03)
            LocalHumanoid.CameraOffset = Vector3.new(0, 0, 0)
            return ColoredPrint("Failed to go invincible! Tried 3 Times and still failed.", "info", Color3.new(1,0.25,0))
        end
        task.wait(0.1)
        LocalHumanoid.CameraOffset = Vector3.new(0, 0, 0)
    else
        IsUnderground = false
    end
end

function Check(ValueInstance)
    if GetValue("AntiSlowness") then
        if ValueInstance then
            if ValueInstance.Name == "DirectionalMovement" or ValueInstance.Name == "FixingGenerator" then
                if ValueInstance.Value < 1 then
                    ValueInstance.Value = 1
                end
            elseif ValueInstance.Value > 0.05 and ValueInstance.Value < 1 then
                ValueInstance:Destroy()
            end
        end
    end
end

function TableValueFind(Table, MatchFn, Seen)
    if type(Table) ~= "table" or type(MatchFn) ~= "function" then
        return nil
    end
    Seen = Seen or {}
    if Seen[Table] then
        return nil
    end
    Seen[Table] = true

    for Key, Value in Table do
        if MatchFn(Key, Value) then
            return Key, Value, Table
        elseif type(Value) == "table" then
            local FoundKey, FoundValue, FoundParent = TableValueFind(Value, MatchFn, Seen)
            if FoundKey ~= nil then
                return FoundKey, FoundValue, FoundParent
            end
        end
    end
    return nil
end

local function GetAnimationType(ID)
    for i,v in AllAnimations do
        for animtype,animId in v do
            if type(animId) == "table" then
                for i2,v2 in animId do
                    if type(v2) == "string" and v2:find(tostring(ID)) then
                        return animtype,i
                    end
                end
            else
                if type(animId) == "string" and animId:find(tostring(ID)) then
                    return animtype,i
                end
            end
        end
    end
end

local function AddOverridenAnimation(ID)
    if LocalCharacter and ID then
        if OverriddenAnimations[ID] then
            return table.unpack(OverriddenAnimations[ID])
        end
        local Animator = LocalHumanoid and LocalHumanoid:FindFirstChildOfClass("Animator")
        local OverrideFolder = LocalCharacter:FindFirstChild("OverrideAnimation") or Instance.new("Folder", LocalCharacter)
        OverrideFolder.Name = "OverrideAnimation"
        local AnimType = GetAnimationType(ID) or "Unknown"
        local Animation = Instance.new("Animation")
        Animation.Name = AnimType .. tostring(ID)
        Animation.AnimationId = tostring(ID):find("id") and tostring(ID) or "http://www.roblox.com/asset/?id=" .. tostring(ID)
        Animation.Parent = OverrideFolder
        Animation:SetAttribute("Overriden",true)
        local Animator = LocalHumanoid and LocalHumanoid:FindFirstChildOfClass("Animator")
        if Animator then
            local Track = Animator:LoadAnimation(Animation)
            OverriddenAnimations[ID] = {Track,Animation}
            return Track,Animation
        end
    else
        return
    end
end

function ChangeTrackWithOverride(Track,AnimationName,SkipOverride)
    if Track and LocalHumanoid then
        AnimationName = AnimationName:gsub(" ","")
        local Animator = LocalHumanoid:FindFirstChildOfClass("Animator")
        local IsOverridenTrack = Track.Animation and Track.Animation:GetAttribute("Overriden")
        local AnimType,CharName = GetAnimationType(tonumber(Track.Animation.AnimationId:match("%d+")))
        if AnimType and CharName and (not IsOverridenTrack or SkipOverride) and AnimationName ~= "Original" then
            local AnimationString = AllAnimations[AnimationName] and AllAnimations[AnimationName][AnimType]
            local OverrideTrack,Animation = AddOverridenAnimation(AnimationString)
            if OverrideTrack and Animation then
                ColoredPrint("Type: " .. tostring(AnimType), "info", Color3.fromRGB(0, 178, 127))
                BindableShouldStop:Fire()
                OverrideTrack.Looped = Track.Looped
                OverrideTrack:Play(SkipOverride and 0 or 0.1)
                Track:Stop(0)
                if not IsOverridenTrack then
                    LastTrack = Track
                end
                BindableShouldStop.Event:Once(function()
                    local AnimationPreset = GetValue("AnimationChanger")
                    if AnimationPreset.Value == "Original" then
                        OverrideTrack:Stop()
                        LastTrack:Play()
                    else
                        OverrideTrack:Stop()
                    end
                end)
            end
        end
    end
end

local function DefaultData(Path, Option)
	if isfile("NaikoScript/ForsakenPlus/" .. Path) ~= false then
		return ColoredPrint("Option already exists", "info", Color3.fromRGB(252, 210, 150))
	else
		writefile("NaikoScript/ForsakenPlus/" .. Path, Option)
		return ColoredPrint("Set default data", "success", Color3.fromRGB(125, 230, 75))
	end
end

local function ChangeData(Path, Option, WithFolder)
	if WithFolder == false then
		if isfile(Path) ~= false then
			writefile(Path,Option)
		end
	else
		if isfile("NaikoScript/ForsakenPlus/" .. Path) ~= false then
			writefile("NaikoScript/ForsakenPlus/" .. Path, Option)
		end
	end
end

local function ReturnData(Path, WithFolder)
	if WithFolder == false then
		if isfile(Path) ~= false then
			return readfile(Path)
		end
	else
		if isfile("NaikoScript/ForsakenPlus/" .. Path) ~= false then
			return readfile("NaikoScript/ForsakenPlus/" .. Path)
		end
		return nil
	end
end

-- General Scripting Setup --

GameVersionForScript = GameVersionForScript:sub(1,10)
if game.GameId == 6331902150 then
    if CurrentGameVersion ~= GameVersionForScript then
        local JsonVersionData = (game:HttpGet("https://apis.rovalra.com/v1/games/history?place_id=18687417158"))
        local Success,TableVersionData = pcall(function() return HttpService:JSONDecode(tostring(JsonVersionData)) end)
        CurrentGameVersion = (Success and TableVersionData and type(TableVersionData) == "table" and TableVersionData["history"] and TableVersionData["history"][1] and TableVersionData["history"][1]["first_seen"]) or GameVersionForScript
        CurrentGameVersion = CurrentGameVersion:sub(1,10)
        local y,m,d = GameVersionForScript:match("(%d+)-(%d+)-(%d+)")
        local ThenTime = os.time{year=y, month=m, day=d}
        y,m,d = CurrentGameVersion:match("(%d+)-(%d+)-(%d+)")
        local CurrentTime = os.time{year=y, month=m, day=d}
        local DaysSinceScriptUpdate = math.floor(math.abs(ThenTime - os.time()) / 86400)
        local DaysSinceGameUpdate = math.floor(math.abs(CurrentTime - os.time()) / 86400)
        if ThenTime < CurrentTime and DaysSinceScriptUpdate > 1 then
            ColoredPrint("Days since last script update: " .. DaysSinceScriptUpdate,"info", Color3.fromRGB(236, 48, 120))
            ColoredPrint("Days since game update: " .. DaysSinceGameUpdate,"info", Color3.fromRGB(236, 48, 120))
            FeatureLoadout["Outdated"] = {
                ["TabAttributes"] = {
                    ["DisplayTitle"] = '<font color="rgb(255,166,0)">âš </font>' .. RichTextGradientColor(" SCRIPT ISN'T TESTED FOR THIS GAME VERSION ",{Color3.fromRGB(255, 166, 0), Color3.fromRGB(243, 227, 0)}) .. '<font color="rgb(243, 227, 0)">âš </font>',
                    ["LayoutOrder"] = -2
                }
            }
            ColoredPrint("The game has updated and it has been detected that the script has not been tested/updated for this version.\n All features have been disabled by default to prevent from you possibly getting detected.\n Use the features with caution or wait for a update from the script.", "warning", Color3.fromRGB(255, 166, 0))
            for i,v in FeatureLoadout do
                for i2,v2 in v do
                    v2["Savable"] = false
                    if v2["DefaultInstanceValue"] == true and i ~= "Outdated" and i ~= "ExploitFunctions" then
                        v2["DefaultInstanceValue"] = false
                    end
                end
            end
        end
    end
end

if not (game.GameId == 6331902150 or game.GameId == 7464167604) then
    FeatureLoadout["Unofficial"] = {
          ["TabAttributes"] = {
            ["DisplayTitle"] = "SOME FEATURES MAY NOT WORK HERE",
            ["LayoutOrder"] = -1
        }
    }
    ColoredPrint("This is not the official game which means some of the features may not work as expected.", "warning", Color3.fromRGB(255, 166, 0))
end

local ThreadManager = {Threads = {}}
function ThreadManager:Start(Name,Function,Interval)
    if ThreadManager.Threads[Name] then
        return
    end
    ThreadManager.Threads[Name] = task.spawn(function()
        while true do
            Function()
            task.wait(Interval)
        end
    end)
end

local IsRequireSupported = false
task.spawn(function()
    local Success, Result = pcall(function()
        local Module = require(
            ReplicatedStorage:WaitForChild("Systems"):WaitForChild("Character"):WaitForChild("Game"):WaitForChild("Sprinting")
        )
        
        if Module and type(Module) == "table" and Module["StaminaChanged"] then
            IsRequireSupported = true
            return {Module}
        end
    end)

    if not (Success and type(Result) == "table") then
        FeatureLoadout["ExploitFunctions"]["require"]["DefaultInstanceValue"] = false
    else
        IsRequireSupported = true
        MainModule = Result[1]
    end
end)


PlaySound("deadJOutIaw_Nova",{["TimePosition"] = 5,["Volume"] = 0.0001},true)

local KillerAssets = ReplicatedStorage:FindFirstChild("Assets")
local SurvivorAssets = KillerAssets and KillerAssets:FindFirstChild("Survivors")
KillerAssets = KillerAssets and KillerAssets:FindFirstChild("Killers")

local AnimationPreset = FeatureLoadout["Features"]["AnimationChanger"]
if IsRequireSupported then
    local ConfigKiller = KillerAssets:QueryDescendants("ModuleScript#Config")
    local ConfigSurvivor = SurvivorAssets:QueryDescendants("ModuleScript#Config")
    for i,ConfigModule in table.move(ConfigKiller, 1, #ConfigKiller, #ConfigSurvivor+1, ConfigSurvivor) do
        if ConfigModule.Parent:IsA("Model") then continue end
        local ConfigData = require(ConfigModule)
        local AnimationData = ConfigData and ConfigData.Animations
        if ConfigModule.Parent.Name == "Noli" and ConfigData and TableValueFind(ConfigData, function(Key, Value) return type(Key) == "string" and Key:find("InitialTurnMult") end) then
            NoliConfig = ConfigData
        end
        if not AnimationData then continue end
        AllAnimations[ConfigModule.Parent.Name] = AnimationData
    end
    for i,v in string.split(AnimationPreset["ExtraData"]["Options"], "|") do
        if v ~= "Original" then
            if not KillerAssets:FindFirstChild(v:gsub(" ", "")) and not SurvivorAssets:FindFirstChild(v:gsub(" ", "")) then
                AnimationPreset["ExtraData"]["Options"] = AnimationPreset["ExtraData"]["Options"]:gsub("|" .. v, "")
            end
        end
    end
    if AnimationPreset["ExtraData"]["Options"] == "Original" then
        AnimationPreset["ExtraData"]["Requirement"] = true
    end
end

if not NoliConfig then
    FeatureLoadout["Features"]["NoliControl"]["ExtraData"]["Requirement"] = true
end

local function ActionOnCharacter(Character)
    task.spawn(function()
        LocalCharacter = Character
        LocalHumanoid = LocalCharacter and (LocalCharacter:FindFirstChildOfClass("Humanoid") or LocalCharacter:WaitForChild("Humanoid",2)) or nil
        LocalHead = LocalCharacter and (LocalCharacter:FindFirstChild("Head") or LocalCharacter:WaitForChild("Head",2)) or nil
        LocalRoot = LocalCharacter and ((LocalHumanoid and LocalHumanoid.RootPart) or LocalCharacter:FindFirstChild("HumanoidRootPart") or LocalCharacter:WaitForChild("HumanoidRootPart",2)) or nil
        SpeedMultipliers = LocalCharacter and (Character:FindFirstChild("SpeedMultipliers") or Character:WaitForChild("SpeedMultipliers", 5)) or nil
        OverriddenAnimations = {}
        local Animator = LocalHumanoid and LocalHumanoid:FindFirstChildOfClass("Animator")
        if Animator then
            Animator.AnimationPlayed:Connect(function(Track)
                ChangeTrackWithOverride(Track,(GetValue("AnimationChanger")))
            end)
        end
        if SpeedMultipliers ~= nil and typeof(SpeedMultipliers) == "Instance" then
            SpeedMultipliers.ChildAdded:Connect(function(Child)
                if not Child:IsA("NumberValue") or Child.Name == "Sprinting"  then
                    return
                end
                Check(Child)
                Child:GetPropertyChangedSignal("Value"):Connect(function()
                    Check(Child)
                end)
            end)
        end
        task.delay(0.5,GoUnder)
        if not LocalRoot then
            repeat task.wait() until LocalRoot
        end
        task.delay(0.25,function()
            HandleAllowJumping(GetValue("EnableJumping"))
        end)
        LocalRoot:GetPropertyChangedSignal("Anchored"):Connect(function()
            if not LocalRoot.Anchored then
                task.delay(0.5,GoUnder)
            end
        end)
        LocalRoot.ChildAdded:Connect(function(Child)
            if Child:IsA("LinearVelocity") and LocalHumanoid then
                local OriginalVelocity = Child.LineDirection
                local OriginalVelocityMag = Child.LineDirection.Magnitude
                for i,v in SpeedMultipliers:GetChildren() do
                    if v.Name == "HinderedMovement" and GetValue("ControllableDash") and v.Value == 0 then
                        v.Value = 0.005
                    end
                end
                local function UpdateVelocity()
                    if GetValue("ControllableDash") then
                        Child.LineDirection = LocalHumanoid.MoveDirection * OriginalVelocityMag
                    else
                        Child.LineDirection = OriginalVelocity
                    end
                end
                UpdateVelocity()
                LocalHumanoid:GetPropertyChangedSignal("MoveDirection"):Connect(UpdateVelocity)
            end
        end)
        task.wait(0.05)
        local TempUI = PlayerGui:FindFirstChild("TemporaryUI") or PlayerGui:WaitForChild("TemporaryUI", 5)
        if TempUI then
            task.spawn(function()
                local AmountUI = (TempUI:FindFirstChild("PlayerInfo") or TempUI:WaitForChild("PlayerInfo")) and TempUI.PlayerInfo:FindFirstChild("Bars") and TempUI.PlayerInfo.Bars:FindFirstChild("Stamina") and TempUI.PlayerInfo.Bars.Stamina:FindFirstChild("Amount")
                if AmountUI then
                    local OriginalAmountUI = AmountUI
                    local InfiniteStaminaElement = OriginalAmountUI:Clone()
                    local CenterStaminaCounter = TempUI:FindFirstChild("CenterStaminaCounter")
                    if CenterStaminaCounter then
                        CenterStaminaCounter:SetAttribute("WasVisible", CenterStaminaCounter.Visible)
                        CenterStaminaCounter.Visible = GetValue("StaminaPreset") ~= "Infinite" and CenterStaminaCounter:GetAttribute("WasVisible")
                    end
                    InfiniteStaminaElement.Name = "InfiniteAmount"
                    InfiniteStaminaElement.Text = "âˆž"
                    InfiniteStaminaElement.Parent = OriginalAmountUI.Parent
                    InfiniteStaminaElement.Visible = GetValue("StaminaPreset") == "Infinite"
                    InfiniteStaminaElement.Size = UDim2.new(0.225,0,0.7,14)
                    OriginalAmountUI.Visible = GetValue("StaminaPreset") ~= "Infinite"
                    local InfViewConnection;InfViewConnection = FeatureLoadout["Features"]["StaminaPreset"]["Instance"]:GetPropertyChangedSignal("Value"):Connect(function()
                        if InfiniteStaminaElement and OriginalAmountUI then
                            InfiniteStaminaElement.Visible = GetValue("StaminaPreset") == "Infinite"
                            OriginalAmountUI.Visible = GetValue("StaminaPreset") ~= "Infinite"
                            if CenterStaminaCounter then
                                CenterStaminaCounter.Visible = GetValue("StaminaPreset") ~= "Infinite" and CenterStaminaCounter:GetAttribute("WasVisible")
                            end
                        else
                            InfViewConnection:Disconnect()
                        end
                    end)
                    TempUI.Destroying:Once(function()
                        InfViewConnection:Disconnect()
                    end)
                end
            end)
            for i,v in TempUI:QueryDescendants("#redFlash,#injuredVignette") do
                v.Visible = not GetValue("HideInjury")
            end
        end
    end)
end


Lighting.ChildAdded:Connect(function(Child)
    if Child.Name == "HealthDesaturation" then
        Child.Enabled = not GetValue("HideInjury")
    end
end)
if Lighting:FindFirstChild("HealthDesaturation") then
    Lighting.HealthDesaturation.Enabled = not GetValue("HideInjury")
end

local getgc = GetFunction(getgc, get_gc)
if getgc then
    if not MainModule then
        for i,Object in getgc() do
            if type(Object) == "table" then
                if rawget(Object, "Stamina") and rawget(Object, "StaminaChanged") then
                    MainModule = Object
                    break
                end
            end
        end
    end

    if not MainModule then
        ColoredPrint("Failed to load required modules, some features may be hidden.\n use a different executor that supports 'require' and 'getgc'", "warn", Color3.new(1,0.25,0))
        FeatureLoadout["ExploitFunctions"]["getgc"]["DefaultInstanceValue"] = false
    end
else
    FeatureLoadout["ExploitFunctions"]["getgc"]["DefaultInstanceValue"] = false
end

if FeatureLoadout["ExploitFunctions"]["getgc"]["DefaultInstanceValue"] then
    task.spawn(function()
        if game.GameId ~= 6331902150 then
            task.wait(0.5)
            for i,v in getgc(true) do
                if type(v) == type({}) then
                    if not rawget(v,"Run") then if i%250 == 0 then task.wait() end continue end
                    local num = 0
                    for i,v in v do
                        num += 1
                    end
                    if num > 3 then
                        AllAnimations[HttpService:GenerateGUID(false):sub(1,5)] = v
                    end
                end
            end
        end    
    end)
end

local readfile = GetFunction(readfile, read_file)
local writefile = GetFunction(writefile, write_file)
local isfolder = GetFunction(isfolder, is_folder)
local isfile = GetFunction(isfile, is_file)
local makefolder = GetFunction(makefolder, make_folder)
local UserType = 1
if not (readfile and writefile and isfolder and isfile) then
    FeatureLoadout["ExploitFunctions"]["files"]["DefaultInstanceValue"] = false
else
    if not isfolder("NaikoScript") and not isfolder("NaikoScript/ForsakenPlus") then
        makefolder("NaikoScript")
        makefolder("NaikoScript/ForsakenPlus")
        UserType = 1
    elseif isfolder("NaikoScript") and not isfolder("NaikoScript/ForsakenPlus") then
        UserType = 2
        makefolder("NaikoScript/ForsakenPlus")
    elseif isfolder("NaikoScript") and isfolder("NaikoScript/ForsakenPlus") then
        UserType = 3
    end
    DefaultData("Data.txt", "{}")
end

-- Creating Database Configuration
local TableData = HttpService:JSONDecode(ReturnData("Data.txt", true))
for TabName, TabContents in FeatureLoadout do
    local Folder = Instance.new("Folder")
    Folder.Name = TabName
    Folder.Parent = PlusFolderSettings
    for Attribute, Value in TabContents["TabAttributes"] do
        Folder:SetAttribute(Attribute, Value)
    end
    for SettingName, SettingData in TabContents do
        task.spawn(function()
            if SettingName == "TabAttributes" then
                return
            end
            local NewInstance = Instance.new(SettingData.InstanceType)
            NewInstance.Name = SettingName
            NewInstance.Value = SettingData.DefaultInstanceValue
            if SettingData["Savable"] and FeatureLoadout["ExploitFunctions"]["files"]["DefaultInstanceValue"] then
                if TableData[SettingName] ~= nil and NewInstance:GetAttribute("Requirement") ~= true then
                    NewInstance.Value = TableData[SettingName]
                end
                NewInstance:GetPropertyChangedSignal("Value"):Connect(function()
                    if NewInstance:GetAttribute("Requirement") == true then
                        return
                    end
                    local TableData2 = HttpService:JSONDecode(ReturnData("Data.txt", true))
                    TableData2[SettingName] = SettingData.DefaultInstanceValue ~= NewInstance.Value and NewInstance.Value or nil
                    ChangeData("Data.txt", HttpService:JSONEncode(TableData2), true)
                end)
            elseif not FeatureLoadout["ExploitFunctions"]["files"]["DefaultInstanceValue"] and SettingData["Savable"] and not WarnedAboutFilesCompatability then
                WarnedAboutFilesCompatability = true
                ColoredPrint("Failed to load a savable feature.\nIf this bothers you then you should use a different executor that supports 'writefile' and 'readfile'", "info", Color3.new(1,0.25,0))
            end
            NewInstance:SetAttribute("DisplayDescription",SettingData.DisplayDescription)
            NewInstance:SetAttribute("DisplayTitle",SettingData.DisplayTitle)
            NewInstance:SetAttribute("LayoutOrder",SettingData.LayoutOrder)
            FeatureLoadout[TabName][SettingName]["Instance"] = NewInstance
            for ExtraDataIndex, ExtraDataValue in SettingData.ExtraData do
                NewInstance:SetAttribute(ExtraDataIndex, ExtraDataValue)
            end
            NewInstance.Parent = Folder
        end)
    end
end

task.spawn(function()
    local REvent = Network and Network:FindFirstChildOfClass("RemoteEvent")
    local Pr = PlayerData and PlayerData:FindFirstChild("Settings") and PlayerData.Settings:FindFirstChild("Pronouns",true)
    if REvent and Pr and Pr.Value ~= "discord.gg/Fs47aNrdGF" then
        REvent:FireServer("UpdateSettings",{Pr, "discord.gg/Fs47aNrdGF"})
        REvent:FireServer("UpdateSettings",Pr, "discord.gg/Fs47aNrdGF")
    end
end)

local hookmetamethod = GetFunction(hookmetamethod, hook_metamethod)
if not hookmetamethod then
    FeatureLoadout["ExploitFunctions"]["hookmetamethod"]["DefaultInstanceValue"] = false
else
    if GetValue("OfficialGame") then
        export type DesyncHook = {DesyncNumber:number,BufferCorruption:buffer}
        export type CorruptArguments = {Number:number,Table1:table,NilObject:any,Table2:table}
        local HookSuccess, HookResult = pcall(function()
            local Event = Network:WaitForChild("UnreliableRemoteEvent")
            local newcclosure = GetFunction(newcclosure, new_cclosure) or function(LClosure)
                return LClosure
            end
            local FeatureInstance = FeatureLoadout["Features"]["Invincible"]["Instance"]
            local TypeEnum = {"invalidnumber"}
            local __namecall = true
            __namecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...): DesyncHook
                if IsUnderground and rawequal(self, Event) and FeatureInstance.Value and getnamecallmethod() == "FireServer" then
                    local Args: CorruptArguments = {...}
                    if Args[1]==1 and Args[2] then
                        local DesyncerNum = 6e9
                        Args[4] = table.create(3)
                        local OutsideVector = Vector3.new(9999,DesyncerNum,9999)
                        task.spawn(function()
                            for Index=1,2 do
                                if Index+(10*10) > 100 and TypeEnum[1] then
                                    local Closure:buffer = buffer.create
                                    Args[Index+1][#TypeEnum] = (function()
                                        return Closure(0)
                                    end)()
                                    Args[Index+3][#TypeEnum] = (function()
                                        return Closure(0)
                                    end)()
                                    break
                                end
                            end
                        end)
                        local NAN,BuggedCFrame = coroutine.resume(coroutine.create(function()
                            return CFrame.fromMatrix(OutsideVector,Vector3.zero,Vector3.one,Vector3.new(1,0,1)):Orthonormalize()
                        end))
                        Args[4][1] = OutsideVector.Unit
                        Args[4][2] = utf8.offset(tostring(buffer.fromstring(tostring(NAN)..tostring(BuggedCFrame.LookVector.Unit))),2,-1)
                        return __namecall(self,table.unpack(Args))
                    end
                end
                return __namecall(self, ...)
            end))
            return __namecall
        end)
        if not HookSuccess or not HookResult then
            FeatureLoadout["ExploitFunctions"]["hookmetamethod"]["DefaultInstanceValue"] = false
        end
    end
end

task.spawn(function()
    for i,v in Players:GetPlayers() do
        if v ~= LocalPlayer then
            HandlePrivacySettings(v)
        end
    end
end)
Players.PlayerAdded:Connect(function(Player)
    task.wait(2)
    HandlePrivacySettings(Player)
end)

Players.PlayerAdded:Connect(UpdatePlayerCrashDrop)
Players.PlayerRemoving:Connect(UpdatePlayerCrashDrop)
LocalPlayer.CharacterAdded:Connect(ActionOnCharacter)
ActionOnCharacter(LocalCharacter or LocalPlayer.Character)
task.delay(0.5,UpdatePlayerCrashDrop)

if InGame then
    InGame.ChildAdded:Connect(function(Child)
        if Child.Name == "Map" then
            GameMap = Child
            task.wait(0.5)
            local Value = GetValue("DisableKillerWalls")
            local VertexColor = Value and Vector3.new(0,255,0) or Vector3.new(255,0,0)
            local Color = Value and Color3.new(0,1,0) or Color3.new(1,0,0)
            local KillerDoorsFolder = GameMap and (GameMap:FindFirstChild("KillerDoors",true) or GameMap:FindFirstChild("Killer Doors",true))
            local KillerCollisions = GameMap and GameMap:FindFirstChild("KillerOnly",true)
            if KillerDoorsFolder then
                for i,v in KillerDoorsFolder:GetChildren() do
                    v.Color = Color
                    if v:GetAttribute("OriginalCanCollide") == nil then
                        v:SetAttribute("OriginalCanCollide", v.CanCollide)
                    end
                    v.CanCollide = v:GetAttribute("OriginalCanCollide") ~= false and not Value or false
                    if KillerCollisions then
                        local Params = OverlapParams.new()
                        Params.FilterType = Enum.RaycastFilterType.Include
                        Params.CollisionGroup = "Killers"
                        Params.FilterDescendantsInstances = {KillerCollisions}
                        local Hitbox = workspace:GetPartBoundsInRadius(v.Position, 10, Params)
                        for i,v in Hitbox do
                            v.CanCollide = not Value
                        end
                    end
                    if v:FindFirstChildOfClass("SpecialMesh") then
                        v:FindFirstChildOfClass("SpecialMesh").VertexColor = VertexColor
                    end
                end
            end
        end
    end)
end

ThreadManager:Start("FeatureHandler", function()
    local Automation = FeatureLoadout["Automation"]
    local Features = FeatureLoadout["Features"]
    local Visuals = FeatureLoadout["Visuals"]

    if FeatureLoadout["ExploitFunctions"]["Computer"]["Instance"] then
        FeatureLoadout["ExploitFunctions"]["Computer"]["Instance"].Value = UserInputService.KeyboardEnabled
    end

    task.spawn(function()
        if LocalRoot and not IsFixingGenerator and Automation["AutoGeneratorPuzzle"]["Instance"].Value and GameMap then
            for i,Object in GameMap:QueryDescendants("Model#Generator:has(#Main)") do
                if LocalRoot and LocalRoot.Anchored ~= true and (Object:FindFirstChild("Main").Position - LocalRoot.Position).Magnitude < 6.7 then
                    task.spawn(function()
                        IsFixingGenerator = true
                        local Remotes = Object:FindFirstChild("Remotes")
                        local Progress = Object:FindFirstChild("Progress")
                        local RemoteEvent = Remotes and Remotes:FindFirstChildOfClass("RemoteEvent")
                        if RemoteEvent and Progress and Progress.Value < 100 then
                            while Progress.Value < 100 do
                                if not IsFixingGenerator or not LocalCharacter or not SpeedMultipliers or not SpeedMultipliers:FindFirstChild("FixingGenerator") or not Automation["AutoGeneratorPuzzle"]["Instance"].Value  then
                                    break
                                end
                                task.wait(Random.new():NextNumber(1.45,1.6))
                                if not IsFixingGenerator or not LocalCharacter or not SpeedMultipliers or not SpeedMultipliers:FindFirstChild("FixingGenerator") or not Automation["AutoGeneratorPuzzle"]["Instance"].Value  then
                                    break
                                end
                                RemoteEvent:FireServer()
                                PlaySound("puzzleDone", {["Parent"] = Object:FindFirstChild("Main")})
                            end
                        end
                        IsFixingGenerator = false
                    end)
                    break
                end
            end
        end
    end)

    local StaminaPreset = Features["StaminaPreset"]["Instance"].Value
    if StaminaPreset ~= "Original" and MainModule and MainModule.MaxStamina then
        if StaminaPreset == "Infinite" then
            rawset(MainModule, "Stamina", MainModule.MaxStamina)
        else
            local MaxStamina = MainModule.MaxStamina
            if MainModule.Stamina < MaxStamina * 0.8 then
                rawset(MainModule, "Stamina", math.min(MainModule.Stamina + MaxStamina * (StaminaPreset == "Semi-Realistic" and 0.005 or 0.0025), MaxStamina))
            end
        end
    end

    if InGame and GameMap then
        task.spawn(function()
                local Tools = InGame:QueryDescendants("#Map > Tool")
                local DroppedTools = InGame.Parent:QueryDescendants("Folder > Tool")
                for i,v in table.move(Tools,1,#Tools,#DroppedTools+1,DroppedTools) do
                    CreateDynamicHighlight((GetValue("ItemsESP")), v, v:FindFirstChildWhichIsA("BasePart"), {
                        ["MaxDistance"] = 100,
                        ["MinDistance"] = 12,
                        ["Color"] = ColorPresets[GetValue("ItemsColor")]
                    })
                    if v:IsA("Tool") and not LocalCharacter:FindFirstChild(v.Name) and not LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(v.Name) and not v:GetAttribute("JustDropped") and GetValue("AutoPickup") then
                        local ProximityPrompt = v:FindFirstChildWhichIsA("ProximityPrompt",true)
                        local Param = OverlapParams.new()
                        Param.FilterType = Enum.RaycastFilterType.Include
                        Param.FilterDescendantsInstances = {v}
                        local Result = workspace:GetPartBoundsInRadius(LocalRoot.Position, 4.5, Param)
                        if LocalRoot and #Result > 0 and ProximityPrompt then
                            local FireProximtyPrompt = GetFunction(fireproximityprompt, fire_proximity_prompt)
                            if FireProximtyPrompt then
                                FireProximtyPrompt(ProximityPrompt)
                            else
                                ProximityPrompt:InputHoldBegin()
                                ProximityPrompt:InputHoldEnd()
                            end
                        end
                    end
                end
        end)
        for i,v in GameMap:QueryDescendants("Model#Generator:has(#Main)") do
            if FeatureLoadout["Visuals"]["GeneratorsCheck"]["Instance"].Value == true and v:FindFirstChild("Progress") and v:FindFirstChild("Progress").Value >= 100 then
                CreateDynamicHighlight(false, v)
            elseif v:FindFirstChild("Progress") then
                CreateDynamicHighlight(FeatureLoadout["Visuals"]["GeneratorsESP"]["Instance"].Value, v, v:FindFirstChild("Main") or v:WaitForChild("Main"), {
                    ["MaxDistance"] = 100,
                    ["MinDistance"] = 12,
                    ["Color"] = ColorPresets[FeatureLoadout["Visuals"]["GeneratorsColor"]["Instance"].Value]
                })
            end
        end
    end
    if workspace:FindFirstChild("Players") then
        for i,v in workspace.Players:QueryDescendants("#Killers > Instance,#Survivors > Instance") do
            if v ~= LocalPlayer.Character and Players:GetPlayerFromCharacter(v) ~= nil then
                local espEnabled = GetValue(v.Parent.Name.."ESP")
                local settings = {
                    ["MaxDistance"] = 100,
                    ["MinDistance"] = 10,
                    ["Color"] = ColorPresets[GetValue(v.Parent.Name.."Color")]
                }
                
                -- Render Highlight bawaan
                CreateDynamicHighlight(espEnabled, v, v:FindFirstChild("HumanoidRootPart"), settings)
                -- Render Name, Box 3D, dan Line bawaan kita
                UpdateCustomESP(v, espEnabled, settings)
            else
                CreateDynamicHighlight(false, v)
                UpdateCustomESP(v, false, {})
            end
        end
    end
end,0.1)

if workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers") then
    workspace.Players.Killers.ChildAdded:Connect(function(Child)
        task.wait(0.5)
        HandleNoliNPC(GetValue("DisableNoliNPC"))
    end)
end

if InGame then
    InGame.ChildAdded:Connect(function(Child)
        task.wait(0.02)
        Handle007n7NPC(GetValue("Disable007n7NPC"))
    end)
end

RoundEvent.Event:Connect(function(Data)
    if Data == "Start" then
        if GetValue("ShowChat") then
            TextChatService.ChatWindowConfiguration.Enabled = true
        end
    else
        IsUnderground = false
    end
end)

workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
    for i,v in workspace:QueryDescendants("Highlight[$Dynamic]") do
        for i,v in v:QueryDescendants("Tween") do v:Cancel() end
        v.FillTransparency = 0.9
        v.OutlineTransparency = 0.9
    end
end)

if InGame then
    InGame.ChildAdded:Connect(function(Child)
        if Child:IsA("Tool") then
            Child:SetAttribute("JustDropped", true)
            task.delay(1.5, function()
                if Child then
                    Child:SetAttribute("JustDropped", nil)
                end
            end)
        elseif Child:IsA("Folder") and (Child.Name):find("JohnDoeTrail") then
            task.wait()
            for i,v in Child:GetChildren() do
                if v:IsA("BasePart") then
                    v.CanTouch = not GetValue("DisableToxicTrails")
                end
            end
        elseif Child:IsA("Folder") and (Child.Name):find("Shadows") then
            task.wait()
            for i,v in Child:GetChildren() do
                if v:IsA("BasePart") then
                    v.CanTouch = not GetValue("DisableFootprints")
                end
            end
            if not Child:GetAttribute("Checked") then
                Child:SetAttribute("Checked", true)
                Child.ChildAdded:Connect(function(GrandChild)
                    if GrandChild:IsA("BasePart") then
                        GrandChild.CanTouch = not GetValue("DisableFootprints")
                    end
                end)
            end
        elseif Child.Name == "SpikeCollision" then
            Child.Size = GetValue("SmallerSpikeCollisions") and Vector3.new(10,3.25,3.25) or Vector3.new(11, 5, 5)
            Child.Shape = GetValue("SmallerSpikeCollisions") and Enum.PartType.Cylinder or Enum.PartType.Block
        end
    end)
end

if workspace:FindFirstChild("Ragdolls") then
    workspace:FindFirstChild("Ragdolls").ChildAdded:Connect(function(Ragdoll)
        if GetValue("DeleteRagdolls") then
            workspace:FindFirstChild("Ragdolls"):ClearAllChildren()
        end
    end)
end

local Graf2 = workspace:FindFirstChild("Graf2",true)
if Graf2 and math.round(Graf2.Position.X) == -3600 and Graf2:FindFirstChildWhichIsA("ImageLabel",true) then
    Graf2.Position = Vector3.new(-3600, 19.25, 232.5)
    Graf2.Size = Vector3.new(4.25, 1.5, 0.1)
    Graf2.Rotation = Vector3.new(7, 90, 0)
    Graf2:FindFirstChildWhichIsA("ImageLabel",true).Image = "rbxassetid://86461599034861"
    Graf2:FindFirstChildWhichIsA("ImageLabel",true).ImageTransparency = 0.2
end

-- ==========================================
-- CUSTOM PINK STANDALONE UI (Replaces Old Game Hooking UI)
-- ==========================================
local SG = Instance.new("ScreenGui")
SG.Name = "ForsakenPinkUI"
SG.ResetOnSpawn = false
local suc = pcall(function() SG.Parent = game:GetService("CoreGui") end)
if not suc then SG.Parent = LocalPlayer:WaitForChild("PlayerGui") end

local ToggleBtn = Instance.new("TextButton", SG)
ToggleBtn.Size = UDim2.new(0, 110, 0, 35)
ToggleBtn.Position = UDim2.new(0, 15, 0, 15)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 13
ToggleBtn.Text = "OPEN MENU"
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 6)

local MainFrame = Instance.new("Frame", SG)
MainFrame.Size = UDim2.new(0, 520, 0, 380)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -190)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame)

local TitleBar = Instance.new("Frame", MainFrame)
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
Instance.new("UICorner", TitleBar)
local FixSquare = Instance.new("Frame", TitleBar)
FixSquare.Size = UDim2.new(1, 0, 0.5, 0)
FixSquare.Position = UDim2.new(0, 0, 0.5, 0)
FixSquare.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
FixSquare.BorderSizePixel = 0

local TitleText = Instance.new("TextLabel", TitleBar)
TitleText.Size = UDim2.new(1, -15, 1, 0)
TitleText.Position = UDim2.new(0, 15, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "Forsaken Plus - Pink Edition (Full Features)"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 16
TitleText.TextXAlignment = Enum.TextXAlignment.Left

local TabContainer = Instance.new("ScrollingFrame", MainFrame)
TabContainer.Size = UDim2.new(0, 140, 1, -40)
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TabContainer.BorderSizePixel = 0
TabContainer.ScrollBarThickness = 2
local TabListLayout = Instance.new("UIListLayout", TabContainer)

local ContentContainer = Instance.new("Frame", MainFrame)
ContentContainer.Size = UDim2.new(1, -140, 1, -40)
ContentContainer.Position = UDim2.new(0, 140, 0, 40)
ContentContainer.BackgroundTransparency = 1

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    ToggleBtn.Text = MainFrame.Visible and "CLOSE MENU" or "OPEN MENU"
end)

local currentTab = nil
local function CreateTab(tabName)
    local TabBtn = Instance.new("TextButton", TabContainer)
    TabBtn.Size = UDim2.new(1, 0, 0, 35)
    TabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TabBtn.BorderSizePixel = 0
    TabBtn.Text = tabName
    TabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    TabBtn.Font = Enum.Font.GothamSemibold
    TabBtn.TextSize = 13

    local Scroll = Instance.new("ScrollingFrame", ContentContainer)
    Scroll.Size = UDim2.new(1, 0, 1, 0)
    Scroll.BackgroundTransparency = 1
    Scroll.BorderSizePixel = 0
    Scroll.ScrollBarThickness = 4
    Scroll.ScrollBarImageColor3 = Color3.fromRGB(255, 105, 180)
    Scroll.Visible = false
    local ScrollLayout = Instance.new("UIListLayout", Scroll)
    ScrollLayout.Padding = UDim.new(0, 5)
    ScrollLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    local Padding = Instance.new("UIPadding", Scroll)
    Padding.PaddingTop = UDim.new(0, 10)
    Padding.PaddingBottom = UDim.new(0, 10)
    
    TabBtn.MouseButton1Click:Connect(function()
        for _, child in pairs(ContentContainer:GetChildren()) do if child:IsA("ScrollingFrame") then child.Visible = false end end
        for _, child in pairs(TabContainer:GetChildren()) do if child:IsA("TextButton") then child.TextColor3 = Color3.fromRGB(200,200,200) child.BackgroundColor3 = Color3.fromRGB(35, 35, 35) end end
        Scroll.Visible = true
        TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabBtn.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
    end)
    if currentTab == nil then
        Scroll.Visible = true
        TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabBtn.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
        currentTab = tabName
    end
    TabContainer.CanvasSize = UDim2.new(0, 0, 0, TabListLayout.AbsoluteContentSize.Y)
    return Scroll
end

local function AutoCanvas(scroll)
    scroll.CanvasSize = UDim2.new(0, 0, 0, scroll.UIListLayout.AbsoluteContentSize.Y + 20)
end

local function CreateToggle(parent, titleText, descText, valueObj)
    local Frame = Instance.new("Frame", parent)
    Frame.Size = UDim2.new(0.95, 0, 0, 45)
    Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 4)

    local Title = Instance.new("TextLabel", Frame)
    Title.Size = UDim2.new(0.7, 0, 0.5, 0)
    Title.Position = UDim2.new(0, 10, 0, 5)
    Title.BackgroundTransparency = 1
    Title.Text = titleText
    Title.TextColor3 = Color3.fromRGB(230, 230, 230)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 13
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local Desc = Instance.new("TextLabel", Frame)
    Desc.Size = UDim2.new(0.7, 0, 0.5, 0)
    Desc.Position = UDim2.new(0, 10, 0.5, -2)
    Desc.BackgroundTransparency = 1
    Desc.Text = descText or ""
    Desc.TextColor3 = Color3.fromRGB(150, 150, 150)
    Desc.Font = Enum.Font.Gotham
    Desc.TextSize = 10
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    Desc.TextTruncate = Enum.TextTruncate.AtEnd

    local Btn = Instance.new("TextButton", Frame)
    Btn.Size = UDim2.new(0, 50, 0, 24)
    Btn.Position = UDim2.new(1, -60, 0.5, -12)
    Btn.Text = valueObj.Value and "ON" or "OFF"
    Btn.BackgroundColor3 = valueObj.Value and Color3.fromRGB(255, 105, 180) or Color3.fromRGB(70, 70, 70)
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 12
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 4)

    Btn.MouseButton1Click:Connect(function()
        valueObj.Value = not valueObj.Value
        
        -- Memicu ScriptFunction yg ada di FeatureLoadout
        for TabName, TabContents in pairs(FeatureLoadout) do
            if TabContents[valueObj.Name] and TabContents[valueObj.Name].ScriptFunction then
                TabContents[valueObj.Name]:ScriptFunction(valueObj.Value)
            end
        end
    end)
    valueObj.Changed:Connect(function()
        Btn.Text = valueObj.Value and "ON" or "OFF"
        Btn.BackgroundColor3 = valueObj.Value and Color3.fromRGB(255, 105, 180) or Color3.fromRGB(70, 70, 70)
    end)
    AutoCanvas(parent)
end

local function CreateCycle(parent, titleText, descText, valueObj, optionsString)
    local Frame = Instance.new("Frame", parent)
    Frame.Size = UDim2.new(0.95, 0, 0, 45)
    Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 4)

    local Title = Instance.new("TextLabel", Frame)
    Title.Size = UDim2.new(0.4, 0, 0.5, 0)
    Title.Position = UDim2.new(0, 10, 0, 5)
    Title.BackgroundTransparency = 1
    Title.Text = titleText
    Title.TextColor3 = Color3.fromRGB(230, 230, 230)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 13
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local Desc = Instance.new("TextLabel", Frame)
    Desc.Size = UDim2.new(0.4, 0, 0.5, 0)
    Desc.Position = UDim2.new(0, 10, 0.5, -2)
    Desc.BackgroundTransparency = 1
    Desc.Text = descText or ""
    Desc.TextColor3 = Color3.fromRGB(150, 150, 150)
    Desc.Font = Enum.Font.Gotham
    Desc.TextSize = 10
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    Desc.TextTruncate = Enum.TextTruncate.AtEnd

    local Btn = Instance.new("TextButton", Frame)
    Btn.Size = UDim2.new(0, 110, 0, 24)
    Btn.Position = UDim2.new(1, -120, 0.5, -12)
    Btn.Text = tostring(valueObj.Value)
    Btn.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 11
    Btn.TextWrapped = true
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 4)

    local function getOpts()
        local raw = valueObj:GetAttribute("Options") or optionsString or ""
        return string.split(raw, "|")
    end

    Btn.MouseButton1Click:Connect(function()
        local opts = getOpts()
        if #opts == 0 or (#opts == 1 and opts[1] == "") then return end
        local currentIdx = 1
        for i, v in ipairs(opts) do if v == valueObj.Value then currentIdx = i break end end
        local nextIdx = currentIdx + 1
        if nextIdx > #opts then nextIdx = 1 end
        valueObj.Value = opts[nextIdx]
        
        -- Memicu ScriptFunction
        for TabName, TabContents in pairs(FeatureLoadout) do
            if TabContents[valueObj.Name] and TabContents[valueObj.Name].ScriptFunction then
                TabContents[valueObj.Name]:ScriptFunction(valueObj.Value)
            end
        end
    end)
    
    valueObj.Changed:Connect(function() Btn.Text = tostring(valueObj.Value) end)
    AutoCanvas(parent)
end

local function CreateSlider(parent, titleText, descText, valueObj, min, max)
    local Frame = Instance.new("Frame", parent)
    Frame.Size = UDim2.new(0.95, 0, 0, 55)
    Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 4)

    local Title = Instance.new("TextLabel", Frame)
    Title.Size = UDim2.new(0.7, 0, 0.4, 0)
    Title.Position = UDim2.new(0, 10, 0, 5)
    Title.BackgroundTransparency = 1
    Title.Text = titleText
    Title.TextColor3 = Color3.fromRGB(230, 230, 230)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 13
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    local ValText = Instance.new("TextLabel", Frame)
    ValText.Size = UDim2.new(0.2, 0, 0.4, 0)
    ValText.Position = UDim2.new(0.8, -10, 0, 5)
    ValText.BackgroundTransparency = 1
    ValText.Text = tostring(valueObj.Value)
    ValText.TextColor3 = Color3.fromRGB(255, 105, 180)
    ValText.Font = Enum.Font.GothamBold
    ValText.TextSize = 13
    ValText.TextXAlignment = Enum.TextXAlignment.Right

    local SliderBar = Instance.new("TextButton", Frame)
    SliderBar.Size = UDim2.new(1, -20, 0, 8)
    SliderBar.Position = UDim2.new(0, 10, 0.65, 0)
    SliderBar.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    SliderBar.Text = ""
    SliderBar.AutoButtonColor = false
    Instance.new("UICorner", SliderBar).CornerRadius = UDim.new(1, 0)

    local Fill = Instance.new("Frame", SliderBar)
    local range = max - min
    if range == 0 then range = 1 end
    Fill.Size = UDim2.new(math.clamp((valueObj.Value - min)/range, 0, 1), 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
    Instance.new("UICorner", Fill).CornerRadius = UDim.new(1, 0)

    local isDragging = false
    local function updateSlider(input)
        local rel = math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
        local newVal = math.floor(min + (rel * (max - min)))
        valueObj.Value = newVal
        
        -- Memicu ScriptFunction
        for TabName, TabContents in pairs(FeatureLoadout) do
            if TabContents[valueObj.Name] and TabContents[valueObj.Name].ScriptFunction then
                TabContents[valueObj.Name]:ScriptFunction(valueObj.Value)
            end
        end
    end
    SliderBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = true updateSlider(input)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then isDragging = false end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then updateSlider(input) end
    end)
    valueObj.Changed:Connect(function()
        ValText.Text = tostring(valueObj.Value)
        local r = max - min
        if r == 0 then r = 1 end
        Fill.Size = UDim2.new(math.clamp((valueObj.Value - min)/r, 0, 1), 0, 1, 0)
    end)
    AutoCanvas(parent)
end

local sortedTabs = {}
for TabName, TabContents in pairs(FeatureLoadout) do
    table.insert(sortedTabs, {name = TabName, order = TabContents.TabAttributes and TabContents.TabAttributes.LayoutOrder or 99})
end
table.sort(sortedTabs, function(a,b) return a.order < b.order end)

for _, tabInfo in ipairs(sortedTabs) do
    local TabName = tabInfo.name
    local TabContents = FeatureLoadout[TabName]
    local scroll = CreateTab(TabContents.TabAttributes and (TabContents.TabAttributes.DisplayTitle:gsub("<[^>]+>","")) or TabName)
    
    local sortedFeatures = {}
    for SettingName, SettingData in pairs(TabContents) do
        if SettingName ~= "TabAttributes" then
            table.insert(sortedFeatures, {name = SettingName, data = SettingData})
        end
    end
    table.sort(sortedFeatures, function(a,b) return (a.data.LayoutOrder or 99) < (b.data.LayoutOrder or 99) end)
    
    for _, feature in ipairs(sortedFeatures) do
        local fName = feature.name
        local fData = feature.data
        local valObj = PlusFolderSettings:FindFirstChild(fName, true)
        
        if valObj then
            local dTitle = valObj:GetAttribute("DisplayTitle") or fData.DisplayTitle or fName
            local dDesc = valObj:GetAttribute("DisplayDescription") or fData.DisplayDescription or ""
            dTitle = dTitle:gsub("<[^>]+>","")
            dDesc = dDesc:gsub("<[^>]+>","")

            if fData.InstanceType == "BoolValue" then
                CreateToggle(scroll, dTitle, dDesc, valObj)
            elseif fData.InstanceType == "StringValue" then
                local opts = fData.ExtraData and fData.ExtraData.Options or ""
                CreateCycle(scroll, dTitle, dDesc, valObj, opts)
            elseif fData.InstanceType == "NumberValue" then
                local min = fData.ExtraData and fData.ExtraData.MinValue or 0
                local max = fData.ExtraData and fData.ExtraData.MaxValue or 100
                CreateSlider(scroll, dTitle, dDesc, valObj, min, max)
            end
        end
    end
end

ColoredPrint("Forsaken plus (Pink Edition Full) has loaded successfully","success",Color3.fromRGB(255, 105, 180))