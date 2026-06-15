-- Shenxiue by pradaxca
-- Remastered interface & logic
if workspace.DistributedGameTime < 3 then
	task.wait(3 - workspace.DistributedGameTime)
end

local CoreGui = (gethui and gethui()) or game:GetService("CoreGui")

if CoreGui:FindFirstChild("PradaxcaUI") or CoreGui:FindFirstChild("shen") then
    return warn("Script already running")
elseif game.GameId == 6331902150 or game.GameId == 7464167604 or workspace:GetAttribute("ServerType") then
	Instance.new("BoolValue", CoreGui).Name = "shen"
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
local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui", 60)
local MainUI = PlayerGui:FindFirstChild("MainUI") or PlayerGui:WaitForChild("MainUI", 60)
local PlayerData = LocalPlayer:FindFirstChild("PlayerData") or LocalPlayer:WaitForChild("PlayerData", 20)
local PlusFolderSettings = Instance.new("Folder")

local SaveBasePath = "pradaxca/Shenxiue"

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
local IsUnderground,IsFixingGenerator,WarnedAboutFilesCompatability = false,false,false
local PlaySound,MainModule,HandlePrivacySettings,Check,RichTextGradientColor,IsHitboxNotNear,IsPoisonOnPosition,GoUnder,HandleAllowJumping,HandleNoliNPC,ChangeTrackWithOverride,LastTrack,NoliConfig,TableValueFind,ColoredPrint,Handle007n7NPC,GetValue
local ColorPresets = {["White"] = Color3.fromRGB(255,255,255),["Teal"] = Color3.fromRGB(3,252,157),["Green"] = Color3.fromRGB(0,255,0),["Purple"] = Color3.fromRGB(128,0,128),["Red"] = Color3.fromRGB(255,0,0),["Blue"] = Color3.fromRGB(0,0,255),["Cyan"] = Color3.fromRGB(0,255,255),["Gold"] = Color3.fromRGB(255,215,0),["Orange"] = Color3.fromRGB(255,165,0)}
local IgnoreKeybinds = {"W", "A", "S", "D"}
local GameVersionForScript = "2026-06-12"
local OverriddenAnimations = {}
local Worked,CurrentGameVersion = pcall(function() return MarketplaceService:GetProductInfoAsync(game.PlaceId,Enum.InfoType.Asset)["Updated"] end) ;
CurrentGameVersion = Worked and CurrentGameVersion or GameVersionForScript
local AllAnimations = {}
local FeatureLoadout;
FeatureLoadout = {
    ["ExploitFunctions"] = {
          ["TabAttributes"] = {["DisplayTitle"] = "Loading...",["LayoutOrder"] = 666},
        ["hookmetamethod"] = {["DisplayDescription"] = " ",["DisplayTitle"] = "hookmetamethod",["LayoutOrder"] = 666,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = true,["ExtraData"] = {["Requirement"] = true,},["ScriptFunction"] = function(self, State) end},
        ["getgc"] = {["DisplayDescription"] = " ",["DisplayTitle"] = "getgc",["LayoutOrder"] = 666,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = true,["ExtraData"] = {["Requirement"] = true,},["ScriptFunction"] = function(self, State) end},
        ["require"] = {["DisplayDescription"] = " ",["DisplayTitle"] = "require",["LayoutOrder"] = 666,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = true,["ExtraData"] = {["Requirement"] = true,},["ScriptFunction"] = function(self, State) end},
        ["files"] = {["DisplayDescription"] = " ",["DisplayTitle"] = "files",["LayoutOrder"] = 666,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = true,["ExtraData"] = {["Requirement"] = true,},["ScriptFunction"] = function(self, State) end},
        ["OfficialGame"] = {["DisplayDescription"] = " ",["DisplayTitle"] = "Official Game",["LayoutOrder"] = 666,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = game.GameId == 6331902150 or game.GameId == 7464167604,["ExtraData"] = {["Requirement"] = true,},["ScriptFunction"] = function(self, State) end},
        ["PrivateServer"] = {["DisplayDescription"] = " ",["DisplayTitle"] = "Private Server",["LayoutOrder"] = 666,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = workspace:GetAttribute("ServerType") == "VIP",["ExtraData"] = {["Requirement"] = true,},["ScriptFunction"] = function(self, State) end},
        ["PrivateServerOwner"] = {["DisplayDescription"] = " ",["DisplayTitle"] = "Private Server",["LayoutOrder"] = 666,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = workspace:GetAttribute("ServerOwnerID") == LocalPlayer.UserId,["ExtraData"] = {["Requirement"] = true,},["ScriptFunction"] = function(self, State) end},
        ["NServer"] = {["DisplayDescription"] = " ",["DisplayTitle"] = "N Server",["LayoutOrder"] = 666,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = game.PlaceId == 83645629621104,["ExtraData"] = {["Requirement"] = true,},["ScriptFunction"] = function(self, State) end},
        ["Computer"] = {["DisplayDescription"] = " ",["DisplayTitle"] = "Computer",["LayoutOrder"] = 666,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = UserInputService.KeyboardEnabled,["ExtraData"] = {["Requirement"] = true,},["ScriptFunction"] = function(self, State) end},
    },
    ["Automation"] = {
        ["TabAttributes"] = {["DisplayTitle"] = "Automation",["LayoutOrder"] = 1},
        ["AutoGeneratorPuzzle"] = {["DisplayDescription"] = "Auto-Completes Generator Puzzles",["DisplayTitle"] = "Auto Generator(s)",["LayoutOrder"] = 1,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ExtraData"] = {},["ScriptFunction"] = function(self, Value) end},
        ["AutoPickup"] = {["DisplayDescription"] = "Auto-Picks up Items near you",["DisplayTitle"] = "Auto Pickup",["LayoutOrder"] = 2,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ExtraData"] = {},["ScriptFunction"] = function(self, Value) end},
    },
    ["Features"] = {
        ["TabAttributes"] = {["DisplayTitle"] = "Features",["LayoutOrder"] = 2},
        ["Invincible"] = {
            ["DisplayDescription"] = "Makes you invisible & god mode (you can still use abilities)",["DisplayTitle"] = "Invincible",["LayoutOrder"] = 1,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,
            ["ExtraData"] = {["Requirement"] = "hookmetamethod|require|OfficialGame"},
            ["ScriptFunction"] = function(self, Value)
                if workspace:GetAttribute("Invincible") == nil then
                    workspace:SetAttribute("Invincible", Value)
                    self.Instance.Value = Value
                    if Value then
                        if FeatureLoadout["Features"]["DisableToxicTrails"].Instance then FeatureLoadout["Features"]["DisableToxicTrails"].Instance.Value = true end
                        if FeatureLoadout["Features"]["DisableFootprints"].Instance then FeatureLoadout["Features"]["DisableFootprints"].Instance.Value = true end
                    end
                    task.delay(1.5, function() workspace:SetAttribute("Invincible",nil) end)
                    GoUnder(Value)
                else
                    self.Instance.Value = workspace:GetAttribute("Invincible")
                end
            end
        },
        ["DisableKillerWalls"] = {
            ["DisplayDescription"] = "Disables All Killer Walls (Red Walls)",["DisplayTitle"] = "Disable Killer Walls",["LayoutOrder"] = 2,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,
            ["ExtraData"] = {["Requirement"] = true},
            ["ScriptFunction"] = function(self, Value)
                local VertexColor = Value and Vector3.new(0,255,0) or Vector3.new(255,0,0)
                local Color = Value and Color3.new(0,1,0) or Color3.new(1,0,0)
                local KillerDoorsFolder = GameMap and (GameMap:FindFirstChild("KillerDoors",true) or GameMap:FindFirstChild("Killer Doors",true))
                local KillerCollisions = GameMap and GameMap:FindFirstChild("KillerOnly",true)
                if KillerDoorsFolder then
                    for i,v in KillerDoorsFolder:GetChildren() do
                        v.Color = Color
                        if v:GetAttribute("OriginalCanCollide") == nil then v:SetAttribute("OriginalCanCollide", v.CanCollide) end
                        v.CanCollide = v:GetAttribute("OriginalCanCollide") ~= false and not Value or false
                        if KillerCollisions then
                            local Params = OverlapParams.new()
                            Params.FilterType = Enum.RaycastFilterType.Include
                            Params.CollisionGroup = "Killers"
                            Params.FilterDescendantsInstances = {KillerCollisions}
                            local Hitbox = workspace:GetPartBoundsInRadius(v.Position, 10, Params)
                            for i,v in Hitbox do v.CanCollide = not Value end
                        end
                        if v:FindFirstChildOfClass("SpecialMesh") then v:FindFirstChildOfClass("SpecialMesh").VertexColor = VertexColor end
                    end
                end
            end
        },
        ["DisableToxicTrails"] = {
            ["DisplayDescription"] = "Disables damaging trails for john doe",["DisplayTitle"] = "Disable John Doe's Trails",["LayoutOrder"] = 3,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ExtraData"] = {},
            ["ScriptFunction"] = function(self, Value)
                if not InGame then return end
                for i,v in InGame:GetChildren() do
                    if v:IsA("Folder") and (v.Name):find("JohnDoeTrail") then
                        for i,v2 in v:GetChildren() do if v2:IsA("BasePart") then v2.CanTouch = not Value end end
                    end
                end
            end
        },
        ["DisableFootprints"] = {
            ["DisplayDescription"] = "Disables footprints made by john doe",["DisplayTitle"] = "Disable John Doe's Footprints",["LayoutOrder"] = 4,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ExtraData"] = {},
            ["ScriptFunction"] = function(self, Value)
                if not InGame then return end
                for i,v in InGame:GetChildren() do
                    if v:IsA("Folder") and (v.Name):find("Shadows") then
                        for i,v2 in v:GetChildren() do if v2:IsA("BasePart") then v2.CanTouch = not Value end end
                        if not v:GetAttribute("Checked") then
                            v:SetAttribute("Checked", true)
                            v.ChildAdded:Connect(function(GrandChild)
                                if GrandChild:IsA("BasePart") then GrandChild.CanTouch = not FeatureLoadout["Features"]["DisableFootprints"]["Instance"].Value end
                            end)
                        end
                    end
                end
            end
        },
        ["SmallerSpikeCollisions"] = {
            ["DisplayDescription"] = "Makes spike collisions smaller for john doe's ability",["DisplayTitle"] = "Smaller Spike Collisions",["LayoutOrder"] = 5,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ExtraData"] = {},
            ["ScriptFunction"] = function(self, Value)
                if not InGame then return end
                for i,v in InGame:GetChildren() do
                    if v.Name == "SpikeCollision" then
                        v.Size = Value and Vector3.new(10,3.25,3.25) or Vector3.new(11, 5, 5)
                        v.Shape = Value and Enum.PartType.Cylinder or Enum.PartType.Block
                    end
                end
            end
        },
        ["EnableJumping"] = {["DisplayDescription"] = "Enables Jumping for when its disabled",["DisplayTitle"] = "Enable Jumping",["LayoutOrder"] = 7,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ExtraData"] = {},["ScriptFunction"] = function(self, Value) HandleAllowJumping(Value) end},
        ["StaminaPreset"] = {
            ["DisplayDescription"] = "Select a Stamina Preset",["DisplayTitle"] = "Stamina Preset",["LayoutOrder"] = 8,["Savable"] = true,["InstanceType"] = "StringValue",["DefaultInstanceValue"] = "Original",
            ["ExtraData"] = {["Requirement"] = "require",["Options"] = "Original|Realistic|Semi-Realistic|Infinite"},
            ["ScriptFunction"] = function(self, Value) end
        },
        ["AntiSlowness"] = {
            ["DisplayDescription"] = "Removes all types of Slowness Effects",["DisplayTitle"] = "Anti Slowness",["LayoutOrder"] = 9,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ExtraData"] = {},
            ["ScriptFunction"] = function(self, Value)
                if not Value or not SpeedMultipliers then return end
                for i,Child in SpeedMultipliers:GetChildren() do Check(Child) end
            end
        },
        ["AnimationChanger"] = {
            ["DisplayDescription"] = "Select a character to override the animations",["DisplayTitle"] = "Animation Changer",["LayoutOrder"] = 10,["Savable"] = false,["InstanceType"] = "StringValue",["DefaultInstanceValue"] = "Original",
            ["ExtraData"] = {["Requirement"] = "require",["Options"] = "Original|Jason|Slasher|c00lkidd|John Doe|Noli|1x1x1x1|Nosferatu|Azure|!Herobrine|!Brimstone"},
            ["ScriptFunction"] = function(self, Value)
                if Value == "Original" then
                    BindableShouldStop:Fire()
                else
                    local Animator = LocalHumanoid and LocalHumanoid:FindFirstChildOfClass("Animator")
                    if ChangeTrackWithOverride and Animator then
                        for i,v in Animator:GetPlayingAnimationTracks() do ChangeTrackWithOverride(v,Value,true) end
                    end
                end
            end
        },
        ["NoliControl"] = {
            ["DisplayDescription"] = "Allows you to have better control of Void Rush Ability",["DisplayTitle"] = "Better Void Rush",["LayoutOrder"] = 11,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,
            ["ExtraData"] = {["Requirement"] = "require"},
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
                end
            end
        },
        ["ControllableDash"] = {["DisplayDescription"] = "Allows you to control where the dash goes just like Void Rush Ability",["DisplayTitle"] = "Make Coolkidd's Dash Controllable",["LayoutOrder"] = 12,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ExtraData"] = {},["ScriptFunction"] = function(self, Value) end}
    },
    ["Visuals"] = {
        ["TabAttributes"] = {["DisplayTitle"] = "Visuals",["LayoutOrder"] = 3},
        ["DisableNoliNPC"] = {["DisplayDescription"] = "Disables Noli's Distracting NPC",["DisplayTitle"] = "Disable Noli's NPC",["LayoutOrder"] = 1,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ExtraData"] = {},["ScriptFunction"] = function(self, Value) HandleNoliNPC(Value) end},
        ["Disable007n7NPC"] = {["DisplayDescription"] = "Disables 007n7's Distracting NPC",["DisplayTitle"] = "Disable 007n7's NPC",["LayoutOrder"] = 2,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ExtraData"] = {},["ScriptFunction"] = function(self, Value) Handle007n7NPC(Value) end},
        ["ESP"] = {["DisplayDescription"] = "Track things in the game through walls",["DisplayTitle"] = "ESP",["LayoutOrder"] = 3,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ExtraData"] = {},["ScriptFunction"] = function(self, Value) end},
        ["KillersESP"] = {["DisplayDescription"] = "Enables ESP for the killer(s)",["DisplayTitle"] = "Killer(s) (ESP)",["LayoutOrder"] = 4,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ExtraData"] = {["Requirement"] = "ESP",},["ScriptFunction"] = function(self, Value) end},
        ["KillersColor"] = {["DisplayDescription"] = "Select a Color for Killer(s) (ESP)",["DisplayTitle"] = "Killer(s) Color",["LayoutOrder"] = 5,["Savable"] = true,["InstanceType"] = "StringValue",["DefaultInstanceValue"] = "Red",["ExtraData"] = {["Requirement"] = "ESP|KillersESP",["Options"] = "Red|Orange|Purple|Gold",},["ScriptFunction"] = function(self, Value) end},
        ["SurvivorsESP"] = {["DisplayDescription"] = "Enables ESP for the survivor(s)",["DisplayTitle"] = "Survivor(s) (ESP)",["LayoutOrder"] = 6,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ExtraData"] = {["Requirement"] = "ESP",},["ScriptFunction"] = function(self, Value) end},
        ["SurvivorsColor"] = {["DisplayDescription"] = "Select a Color for Survivor(s) (ESP)",["DisplayTitle"] = "Survivor(s) Color",["LayoutOrder"] = 7,["Savable"] = true,["InstanceType"] = "StringValue",["DefaultInstanceValue"] = "Green",["ExtraData"] = {["Requirement"] = "ESP|SurvivorsESP",["Options"] = "Green|Orange|Purple|Gold",},["ScriptFunction"] = function(self, Value) end},
        ["GeneratorsESP"] = {["DisplayDescription"] = "Enables ESP for the Generator(s)",["DisplayTitle"] = "Generator(s) (ESP)",["LayoutOrder"] = 8,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ExtraData"] = {["Requirement"] = "ESP",},["ScriptFunction"] = function(self, Value) end},
        ["GeneratorsColor"] = {["DisplayDescription"] = "Select a Color for Generator(s) (ESP)",["DisplayTitle"] = "Generator(s) Color",["LayoutOrder"] = 9,["Savable"] = true,["InstanceType"] = "StringValue",["DefaultInstanceValue"] = "Cyan",["ExtraData"] = {["Requirement"] = "ESP|GeneratorsESP",["Options"] = "Cyan|Blue|Green|Orange|Purple|Gold",},["ScriptFunction"] = function(self, Value) end},
        ["GeneratorsCheck"] = {["DisplayDescription"] = "Hides Generator(s) That are Completed (ESP)",["DisplayTitle"] = "Hide Completed Generator(s)",["LayoutOrder"] = 10,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = true,["ExtraData"] = {["Requirement"] = "ESP|GeneratorsESP",},["ScriptFunction"] = function(self, Value) end},
        ["ItemsESP"] = {["DisplayDescription"] = "Enables ESP for the Item(s)",["DisplayTitle"] = "Item(s) (ESP)",["LayoutOrder"] = 11,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ExtraData"] = {["Requirement"] = "ESP",},["ScriptFunction"] = function(self, Value) end},
        ["ItemsColor"] = {["DisplayDescription"] = "Select a Color for Item(s) (ESP)",["DisplayTitle"] = "Item(s) Color",["LayoutOrder"] = 12,["Savable"] = true,["InstanceType"] = "StringValue",["DefaultInstanceValue"] = "Gold",["ExtraData"] = {["Requirement"] = "ESP|ItemsESP",["Options"] = "Gold|Cyan|Purple|White",},["ScriptFunction"] = function(self, Value) end},
        ["ESP_Line"] = {["DisplayDescription"] = "Draws a line from top of screen to target",["DisplayTitle"] = "ESP Line",["LayoutOrder"] = 13,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ExtraData"] = {["Requirement"] = "ESP"},["ScriptFunction"] = function(self, Value) end},
        ["ESP_Box"] = {["DisplayDescription"] = "Draws a 2D box around target",["DisplayTitle"] = "ESP Box",["LayoutOrder"] = 14,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ExtraData"] = {["Requirement"] = "ESP"},["ScriptFunction"] = function(self, Value) end},
        ["ESP_Name"] = {["DisplayDescription"] = "Displays player name above target",["DisplayTitle"] = "ESP Name",["LayoutOrder"] = 15,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ExtraData"] = {["Requirement"] = "ESP"},["ScriptFunction"] = function(self, Value) end},
    },
    ["Miscellaneous"] = {
        ["TabAttributes"] = {["DisplayTitle"] = "Miscellaneous",["LayoutOrder"] = 4},
        ["ExtendedFOV"] = {
            ["DisplayDescription"] = "A extended version of the FOV inside the normal settings",["DisplayTitle"] = "Extended FOV",["LayoutOrder"] = 1,["Savable"] = true,["InstanceType"] = "NumberValue",
            ["DefaultInstanceValue"] = PlayerData and PlayerData:FindFirstChild("Settings") and PlayerData.Settings.Game.FieldOfView.Value or 70,
            ["ExtraData"] = {["MaxValue"] = 120,["MinValue"] = 10,["Step"] = 5,},
            ["ScriptFunction"] = function(self, Value)
                if PlayerData and PlayerData:FindFirstChild("Settings") then PlayerData.Settings.Game.FieldOfView.Value = Value end
                workspace.CurrentCamera.FieldOfView = Value
            end
        },
        ["ExtendedZoom"] = {
            ["DisplayDescription"] = "Extends the Maximum Zoom Distance for the camera",["DisplayTitle"] = "Extended Zoom Distance",["LayoutOrder"] = 2,["Savable"] = true,["InstanceType"] = "NumberValue",["DefaultInstanceValue"] = 10,
            ["ExtraData"] = {["MaxValue"] = 100,["MinValue"] = 0,["Step"] = 5,},
            ["ScriptFunction"] = function(self, Value) LocalPlayer.CameraMaxZoomDistance = game:GetService("StarterPlayer").CameraMaxZoomDistance + (Value * 0.25) end
        },
        ["ShowChat"] = {
            ["DisplayDescription"] = "Shows the Full Chat while in the Round",["DisplayTitle"] = "Show Chat",["LayoutOrder"] = 3,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,
            ["ExtraData"] = {["Requirement"] = not game:GetService("Chat"):CanUserChatAsync(LocalPlayer.UserId) and true or nil},
            ["ScriptFunction"] = function(self, Value)
                if TextChatService:FindFirstChildOfClass("ChatWindowConfiguration") then TextChatService:FindFirstChildOfClass("ChatWindowConfiguration").Enabled = Value end
            end
        },
        ["ShowPrivacy"] = {
            ["DisplayDescription"] = "Shows everyones privacy info",["DisplayTitle"] = "Shows Privacy Info",["LayoutOrder"] = 4,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ExtraData"] = {},
            ["ScriptFunction"] = function(self, Value) for i,v in Players:GetPlayers() do if v ~= LocalPlayer then HandlePrivacySettings(v) end end end
        },
        ["HideInjury"] = {
            ["DisplayDescription"] = "Hides the injured screen and effects used when you are low health",["DisplayTitle"] = "Hide Injured UI/Effects",["LayoutOrder"] = 5,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = true,["ExtraData"] = {},
            ["ScriptFunction"] = function(self, Value)
                if PlayerGui:FindFirstChild("TemporaryUI") then
                    for i,v in PlayerGui:FindFirstChild("TemporaryUI"):QueryDescendants("#redFlash,#injuredVignette") do v.Visible = not Value end
                end
                if game:GetService("Lighting"):FindFirstChild("HealthDesaturation") then game:GetService("Lighting"):FindFirstChild("HealthDesaturation").Enabled = not Value end
            end
        },
        ["DeleteRagdolls"] = {
            ["DisplayDescription"] = "Deletes ALL Ragdolls regardless the type of ragdoll for performance",["DisplayTitle"] = "Delete All Ragdolls",["LayoutOrder"] = 6,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,
            ["ExtraData"] = {["Requirement"] = "PrivateServer"},
            ["ScriptFunction"] = function(self, Value) if workspace:FindFirstChild("Ragdolls") and Value then workspace:FindFirstChild("Ragdolls"):ClearAllChildren() end end
        },
        ["PlayerSelectCrash"] = {["DisplayDescription"] = "Select a player to crash",["DisplayTitle"] = "Player to crash",["LayoutOrder"] = 8,["Savable"] = false,["InstanceType"] = "StringValue",["DefaultInstanceValue"] = "None",["ExtraData"] = {["Requirement"] = "PrivateServerOwner",["Options"] = "None",},["ScriptFunction"] = function(self, Value) end},
        ["CrashTheTarget"] = {
            ["DisplayDescription"] = "Crashes the selected target (Host Exclusive)",["DisplayTitle"] = "Crash Target",["LayoutOrder"] = 9,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,
            ["ExtraData"] = {["Requirement"] = "PlayerSelectCrash~None|PrivateServerOwner",},
            ["ScriptFunction"] = function(self, Value)
                if Value then
                    if self.Instance then self.Instance.Value = false end
                    local PlayerName = FeatureLoadout["Miscellaneous"]["PlayerSelectCrash"]["Instance"].Value
                    if PlayerName == "Everyone" or PlayerName == "Both" then
                        for i,Player in Players:GetPlayers() do
                            if Player ~= LocalPlayer then local Name = Player.Name
                                task.spawn(function()
                                    repeat Network:WaitForChild("RemoteEvent"):FireServer("ExecuteCommand", {"GiveStatus", Name, "Nausea", math.huge, 1}); task.wait(1.5) until not Players:FindFirstChild(Name)
                                end)
                            end
                        end
                    else
                        task.spawn(function()
                            repeat Network:WaitForChild("RemoteEvent"):FireServer("ExecuteCommand", {"GiveStatus", PlayerName, "Nausea", math.huge, 1}); task.wait(1.5) until not Players:FindFirstChild(PlayerName)
                        end)
                    end
                end
            end
        },
        ["SkyGlitch"] = {
            ["DisplayDescription"] = "Gives sky glitching effect to everyone (Host Exclusive)",["DisplayTitle"] = "Sky Glitch",["LayoutOrder"] = 10,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,
            ["ExtraData"] = {["Requirement"] = "PrivateServerOwner"},
            ["ScriptFunction"] = function(self, Value)
                if Value and not workspace:GetAttribute("EffectActive") then
                    workspace:SetAttribute("EffectActive",true)
                    if self.Instance then self.Instance.Value = false end
                    Network:WaitForChild("RemoteEvent"):FireServer("ExecuteCommand", {"GiveStatus", "All", "Nausea", -1e11, 10})
                    task.delay(10, function() workspace:SetAttribute("EffectActive",nil); if self.Instance then self.Instance.Value = false end end)
                elseif workspace:GetAttribute("EffectActive") and self.Instance then
                    self.Instance.Value = true
                end
            end
        },
        ["InstaKill"] = {
            ["DisplayDescription"] = "Allows you to instantly kill anyone (Host Exclusive)",["DisplayTitle"] = "Instant Kill",["LayoutOrder"] = 11,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,
            ["ExtraData"] = {["Requirement"] = "PrivateServerOwner"},
            ["ScriptFunction"] = function(self, Value)
                 if workspace:GetAttribute("InstaKill") == nil then
                    workspace:SetAttribute("InstaKill", Value)
                    if self.Instance then self.Instance.Value = Value end
                    task.delay(1.5, function() workspace:SetAttribute("InstaKill",nil) end)
                    if Value then
                        repeat
                            Network:WaitForChild("RemoteEvent"):FireServer("ExecuteCommand", {"GiveStatus", game.Players.LocalPlayer.Name, "Strength", 99999, 1})
                            task.wait(0.5)
                        until not self.Instance.Value
                    end
                elseif self.Instance then
                    self.Instance.Value = workspace:GetAttribute("InstaKill")
                end
            end
        },
        ["OfficialJoin"] = {
            ["DisplayDescription"] = "Makes you join the official forsaken game",["DisplayTitle"] = "Join the official version",["LayoutOrder"] = 14,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,
            ["ExtraData"] = {["Requirement"] = "OfficialGame~true"},
            ["ScriptFunction"] = function(self, Value)
                if Value and not workspace:GetAttribute("LoadingTeleport") then
                    workspace:SetAttribute("LoadingTeleport",true)
                    if workspace:FindFirstChild("Sounds") then workspace.Sounds:ClearAllChildren() end
                    if workspace:FindFirstChild("Themes") then workspace.Themes:ClearAllChildren() end
                    PlaySound("deadJOutIaw_Nova",{["TimePosition"] = 0.4})
                    task.wait(0.5)
                    game:GetService("ExperienceService"):LaunchExperience({placeId = 83645629621104})
                elseif workspace:GetAttribute("LoadingTeleport") and self.Instance then
                    self.Instance.Value = true
                end
            end
        },
        ["Rejoin"] = {
            ["DisplayDescription"] = "Makes you rejoin the exact same server",["DisplayTitle"] = "Rejoin",["LayoutOrder"] = 15,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ExtraData"] = {},
            ["ScriptFunction"] = function(self, Value)
                if Value and not workspace:GetAttribute("LoadingTeleport") then
                    workspace:SetAttribute("LoadingTeleport",true)
                    if workspace:FindFirstChild("Sounds") then workspace.Sounds:ClearAllChildren() end
                    if workspace:FindFirstChild("Themes") then workspace.Themes:ClearAllChildren() end
                    PlaySound("deadJOutIaw_Nova",{["TimePosition"] = 0.4})
                    task.wait(0.25)
                    if workspace:GetAttribute("ServerType") == "VIP" then game:GetService("TeleportService"):Teleport(game.PlaceId)
                    else game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId) end
                elseif workspace:GetAttribute("LoadingTeleport") and self.Instance then
                    self.Instance.Value = true
                end
            end
        },
    }
}

-- Functions --
function ColoredPrint(Text, Icon, Color) print("[Shenxiue] " .. tostring(Text)) end

function PlaySound(SoundName,Settings,KeepPlaying)
    local Sound = typeof(SoundName) == "string" and game:GetService("ReplicatedStorage").Assets.Sounds:FindFirstChild(SoundName,true) or (typeof(SoundName) == "Instance" and SoundName) or nil
    if Sound then
        task.spawn(function()
            Sound = Sound:Clone()
            Sound.Parent = workspace:FindFirstChild("Sounds") or workspace
            if type(Settings) == "table" then for i,v in Settings do Sound[i] = v end end
            if KeepPlaying then Sound.Playing = true else Sound:Play() end
            Debris:AddItem(Sound, Sound.TimeLength + 1)
            return Sound
        end)
    else
        warn("Failed to play sound: ".. tostring(SoundName))
    end
end

function GetValue(FeatureName)
    local FeatureInstance = PlusFolderSettings:FindFirstChild(FeatureName,true)
    if FeatureInstance then return FeatureInstance.Value,FeatureInstance end
    return nil
end

local function GetFunction(...)
    for i,v in table.pack(...) do if v and typeof(v) == "function" then return v end end
    return nil
end

function RichTextGradientColor(Text:string,Colors) return Text end

local function CheckDistance(Highlight, TargetRoot, Settings)
    if workspace.CurrentCamera and TargetRoot then
        local Distance = (workspace.CurrentCamera.CFrame.Position - TargetRoot.Position).Magnitude
        if Distance>1200 then Distance = 0 end
        if Distance >= Settings["MinDistance"] then
            local TransparencyAmount = math.clamp(1 - math.clamp((Distance - Settings["MinDistance"]) / (Settings["MaxDistance"] - Settings["MinDistance"]), 0, 1), 0.45, 1)
            Highlight.FillTransparency = TransparencyAmount + 0.05
            Highlight.OutlineTransparency = TransparencyAmount <= 0.95 and TransparencyAmount - 0.05 or TransparencyAmount
        else
            Highlight.FillTransparency = 1
            Highlight.OutlineTransparency = 1
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

local function UpdatePlayerCrashDrop()
    local OriginString = "None"
    for i,v in Players:GetPlayers() do
        if v ~= LocalPlayer then OriginString = OriginString .. "|" .. v.Name end
    end
    if #Players:GetPlayers() == 3 then OriginString = OriginString .. "|Both"
    elseif #Players:GetPlayers() > 3 then OriginString = OriginString .. "|Everyone" end
    if FeatureLoadout["Miscellaneous"]["PlayerSelectCrash"]["Instance"] then
        FeatureLoadout["Miscellaneous"]["PlayerSelectCrash"]["Instance"]:SetAttribute("Options", OriginString)
    end
end

function HandlePrivacySettings(Player)
    if Player then
        local pData = Player:FindFirstChild("PlayerData")
        if pData then
            local PrivacySettings = pData:FindFirstChild("Privacy",true)
            if PrivacySettings then
                for i,v in PrivacySettings:GetChildren() do
                    if not v:GetAttribute("OriginalValue") and v:IsA("BoolValue") then
                        v:SetAttribute("OriginalValue", v.Value)
                        v:GetPropertyChangedSignal("Value"):Connect(function()
                            if FeatureLoadout["Miscellaneous"]["ShowPrivacy"]["Instance"] and FeatureLoadout["Miscellaneous"]["ShowPrivacy"]["Instance"].Value then v.Value = false
                            else v.Value = v:GetAttribute("OriginalValue") end
                        end)
                        if FeatureLoadout["Miscellaneous"]["ShowPrivacy"]["Instance"] and FeatureLoadout["Miscellaneous"]["ShowPrivacy"]["Instance"].Value then v.Value = false
                        else v.Value = v:GetAttribute("OriginalValue") end
                    elseif v:IsA("BoolValue") then
                        if FeatureLoadout["Miscellaneous"]["ShowPrivacy"]["Instance"] and FeatureLoadout["Miscellaneous"]["ShowPrivacy"]["Instance"].Value then v.Value = false
                        else v.Value = v:GetAttribute("OriginalValue") end
                    end
                end
            end
        end
    end
end

function HandleAllowJumping(Value)
    if LocalHumanoid and not LocalHumanoid:GetAttribute("JumpingConnection") then
        if Value then
            if not LocalHumanoid:GetAttribute("JumpingConnection") then LocalHumanoid:SetAttribute("JumpingConnection",LocalHumanoid.JumpPower)
            else return end
            local Connection;Connection = LocalHumanoid.StateChanged:Connect(function(old,new)
                if LocalCharacter.Parent ~= "Spectator" and new == Enum.HumanoidStateType.Jumping or new == Enum.HumanoidStateType.Freefall and LocalHumanoid.JumpPower > 0 and ((FeatureLoadout["Features"]["EnableJumping"]["Instance"] and FeatureLoadout["Features"]["EnableJumping"]["Instance"].Value) or false) then
                    if not(FeatureLoadout["Features"]["EnableJumping"]["Instance"].Value) then
                        Connection:Disconnect()
                        LocalHumanoid.JumpPower = LocalHumanoid:GetAttribute("JumpingConnection") or 0
                        LocalHumanoid:SetAttribute("JumpingConnection",nil)
                        return
                    end
                    task.spawn(function() task.wait(0.067) LocalHumanoid.JumpPower = 0 end)
                    task.wait(1.5)
                    if FeatureLoadout["Features"]["EnableJumping"]["Instance"].Value then LocalHumanoid.JumpPower = 47
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
                if v.Name:find("FakeLayer") and v:IsA("Sound") then v:Destroy() end
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
                        if Child:IsA("Sound") and GetValue("Disable007n7NPC") then Child:Destroy() end
                    end)
                end
            end
        end
    else
        for i,v in Lighting:GetChildren() do
            if v.Name:lower() == "007n7" then v.Parent = InGame end
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
    else return false end
end

function IsPoisonOnPosition(Position)
    if GameMap and GameMap:FindFirstChild("ToxicWater") then
        local Params = OverlapParams.new()
        Params.FilterType = Enum.RaycastFilterType.Include
        Params.FilterDescendantsInstances = {GameMap.ToxicWater}
        Params.MaxParts = 1
        local Result = workspace:GetPartBoundsInRadius(Position, 6.7, Params)
        return #Result > 0
    else return false end
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
        repeat Tries += 1
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
            return
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
                if ValueInstance.Value < 1 then ValueInstance.Value = 1 end
            elseif ValueInstance.Value > 0.05 and ValueInstance.Value < 1 then
                ValueInstance:Destroy()
            end
        end
    end
end

function TableValueFind(Table, MatchFn, Seen)
    if type(Table) ~= "table" or type(MatchFn) ~= "function" then return nil end
    Seen = Seen or {}
    if Seen[Table] then return nil end
    Seen[Table] = true
    for Key, Value in Table do
        if MatchFn(Key, Value) then return Key, Value, Table
        elseif type(Value) == "table" then
            local FoundKey, FoundValue, FoundParent = TableValueFind(Value, MatchFn, Seen)
            if FoundKey ~= nil then return FoundKey, FoundValue, FoundParent end
        end
    end
    return nil
end

local function GetAnimationType(ID)
    for i,v in AllAnimations do
        for animtype,animId in v do
            if type(animId) == "table" then
                for i2,v2 in animId do
                    if type(v2) == "string" and v2:find(tostring(ID)) then return animtype,i end
                end
            else
                if type(animId) == "string" and animId:find(tostring(ID)) then return animtype,i end
            end
        end
    end
end

local function AddOverridenAnimation(ID)
    if LocalCharacter and ID then
        if OverriddenAnimations[ID] then return table.unpack(OverriddenAnimations[ID]) end
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
    else return end
end

function ChangeTrackWithOverride(Track,AnimationName,SkipOverride)
    if Track and LocalHumanoid then
        AnimationName = AnimationName:gsub(" ","")
        local IsOverridenTrack = Track.Animation and Track.Animation:GetAttribute("Overriden")
        local AnimType,CharName = GetAnimationType(tonumber(Track.Animation.AnimationId:match("%d+")))
        if AnimType and CharName and (not IsOverridenTrack or SkipOverride) and AnimationName ~= "Original" then local AnimationString = AllAnimations[AnimationName] and AllAnimations[AnimationName][AnimType]
            local OverrideTrack,Animation = AddOverridenAnimation(AnimationString)
            if OverrideTrack and Animation then
                BindableShouldStop:Fire()
                OverrideTrack.Looped = Track.Looped
                OverrideTrack:Play(SkipOverride and 0 or 0.1)
                Track:Stop(0)
                if not IsOverridenTrack then LastTrack = Track end
                BindableShouldStop.Event:Once(function()
                    local AnimationPreset = GetValue("AnimationChanger")
                    if AnimationPreset == "Original" then
                        OverrideTrack:Stop()
                        LastTrack:Play()
                    else OverrideTrack:Stop() end
                end)
            end
        end
    end
end

local function DefaultData(Path, Option)
	if isfile(SaveBasePath .. "/" .. Path) ~= false then return
	else writefile(SaveBasePath .. "/" .. Path, Option) return end
end

local function ChangeData(Path, Option, WithFolder)
	if WithFolder == false then if isfile(Path) ~= false then writefile(Path,Option) end
	else if isfile(SaveBasePath .. "/" .. Path) ~= false then writefile(SaveBasePath .. "/" .. Path, Option) end end
end

local function ReturnData(Path, WithFolder)
	if WithFolder == false then if isfile(Path) ~= false then return readfile(Path) end
	else if isfile(SaveBasePath .. "/" .. Path) ~= false then return readfile(SaveBasePath .. "/" .. Path) end return nil end
end

-- Advanced ESP (Line, Box, Name) --
local ESPDrawings = {}
local DrawingEnabled = false
if typeof(Drawing) == "table" and typeof(Drawing.new) == "function" then DrawingEnabled = true end

local function RemoveESP(character)
    local set = ESPDrawings[character]
    if not set then return end
    for _, obj in pairs({set.Line, set.Box, set.Name}) do
        if obj then obj:Remove() end
    end
    ESPDrawings[character] = nil
end

local function CreateESP(character, color)
    local set = {}
    set.Line = Drawing.new("Line")
    set.Line.Thickness = 1.2
    set.Line.Visible = false
    set.Line.Transparency = 0.8
    set.Line.Color = color
    set.Box = Drawing.new("Square")
    set.Box.Thickness = 1
    set.Box.Visible = false
    set.Box.Filled = false
    set.Box.Transparency = 0.7
    set.Box.Color = color
    set.Name = Drawing.new("Text")
    set.Name.Size = 13
    set.Name.Center = true
    set.Name.Outline = true
    set.Name.Visible = false
    set.Name.Color = color    
    ESPDrawings[character] = set
    return set
end

local function UpdateESP()
    if not DrawingEnabled then return end
    local camera = workspace.CurrentCamera
    if not camera then return end
    local vp = camera.ViewportSize
    local top = Vector2.new(vp.X/2, 0)
    local master = GetValue("ESP") == true
    if not master then
        for char in pairs(ESPDrawings) do RemoveESP(char) end
        return
    end
    local active = {}
    local categories = {
        {Folder = KillersFolder, Toggle = "KillersESP", Color = "KillersColor"},
        {Folder = SurvivorsFolder, Toggle = "SurvivorsESP", Color = "SurvivorsColor"}
    }
    for _, cat in ipairs(categories) do
        local folder = cat.Folder
        if folder then
            local catOn = GetValue(cat.Toggle) == true
            local color = ColorPresets[GetValue(cat.Color)] or Color3.new(1,1,1)
            for _, char in ipairs(folder:GetChildren()) do
                if char ~= LocalCharacter and Players:GetPlayerFromCharacter(char) then
                    if catOn then local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Head") or char:FindFirstChildWhichIsA("BasePart")
                        if root then
                            active[char] = true
                            local set = ESPDrawings[char] or CreateESP(char, color)
                            local spos, onScreen = camera:WorldToViewportPoint(root.Position)
                            if onScreen then
                                set.Line.Color = color
                                set.Box.Color = color
                                set.Name.Color = color
                                local lineOn = GetValue("ESP_Line") == true
                                local boxOn = GetValue("ESP_Box") == true
                                local nameOn = GetValue("ESP_Name") == true
                                set.Line.Visible = lineOn
                                set.Line.From = top
                                set.Line.To = Vector2.new(spos.X, spos.Y)
                                local factor = math.clamp(1000 / (spos.Z + 0.001), 1, 1000)
                                local boxW = math.clamp(root.Size.X * factor, 20, 120)
                                local boxH = math.clamp(root.Size.Y * factor * 1.6, 35, 220)
                                set.Box.Visible = boxOn
                                set.Box.Position = Vector2.new(spos.X - boxW/2, spos.Y - boxH/2)
                                set.Box.Size = Vector2.new(boxW, boxH)
                                set.Name.Visible = nameOn
                                set.Name.Text = Players:GetPlayerFromCharacter(char).Name
                                set.Name.Position = Vector2.new(spos.X, spos.Y - boxH/2 - 15)
                            else
                                set.Line.Visible = false
                                set.Box.Visible = false
                                set.Name.Visible = false
                            end
                        end
                    else
                        RemoveESP(char)
                    end
                else
                    RemoveESP(char)
                end
            end
        end
    end
    for char in pairs(ESPDrawings) do
        if not active[char] then RemoveESP(char) end
    end
end

-- General Scripting --
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

local ThreadManager = {Threads = {}}
function ThreadManager:Start(Name,Function,Interval)
    if ThreadManager.Threads[Name] then return end
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
        local Module = require(ReplicatedStorage:WaitForChild("Systems"):WaitForChild("Character"):WaitForChild("Game"):WaitForChild("Sprinting"))
        if Module and type(Module) == "table" and Module["StaminaChanged"] then
            IsRequireSupported = true
            return {Module}
        end
    end)
 if not (Success and type(Result) == "table") then FeatureLoadout["ExploitFunctions"]["require"]["DefaultInstanceValue"] = false
    else IsRequireSupported = true MainModule = Result[1] end
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
if not NoliConfig then FeatureLoadout["Features"]["NoliControl"]["ExtraData"]["Requirement"] = true end

local function ActionOnCharacter(Character)
    task.spawn(function()
        LocalCharacter = Character
        LocalHumanoid = LocalCharacter and (LocalCharacter:FindFirstChildOfClass("Humanoid") or LocalCharacter:WaitForChild("Humanoid",2)) or nil
        LocalHead = LocalCharacter and (LocalCharacter:FindFirstChild("Head") or LocalCharacter:WaitForChild("Head",2)) or nil
        LocalRoot = LocalCharacter and ((LocalHumanoid and LocalHumanoid.RootPart) or LocalCharacter:FindFirstChild("HumanoidRootPart") or LocalCharacter:WaitForChild("HumanoidRootPart",2)) or nil
        SpeedMultipliers = LocalCharacter and (Character:FindFirstChild("SpeedMultipliers") or Character:WaitForChild("SpeedMultipliers", 5)) or nil
        OverriddenAnimations = {}
        local Animator = LocalHumanoid and LocalHumanoid:FindFirstChildOfClass("Animator")
        if Animator then Animator.AnimationPlayed:Connect(function(Track) ChangeTrackWithOverride(Track,(GetValue("AnimationChanger"))) end) end
        if SpeedMultipliers ~= nil and typeof(SpeedMultipliers) == "Instance" then
            SpeedMultipliers.ChildAdded:Connect(function(Child)
                if not Child:IsA("NumberValue") or Child.Name == "Sprinting" then return end
                Check(Child)
                Child:GetPropertyChangedSignal("Value"):Connect(function() Check(Child) end)
            end)
        end
        task.delay(0.5,GoUnder)
        if not LocalRoot then repeat task.wait() until LocalRoot end
        task.delay(0.25,function() HandleAllowJumping(GetValue("EnableJumping")) end)
        LocalRoot:GetPropertyChangedSignal("Anchored"):Connect(function()
            if not LocalRoot.Anchored then task.delay(0.5,GoUnder) end
        end)
        LocalRoot.ChildAdded:Connect(function(Child)
            if Child:IsA("LinearVelocity") and LocalHumanoid then
                local OriginalVelocity = Child.LineDirection
                local OriginalVelocityMag = Child.LineDirection.Magnitude
                for i,v in SpeedMultipliers:GetChildren() do
                    if v.Name == "HinderedMovement" and GetValue("ControllableDash") and v.Value == 0 then v.Value = 0.005 end
                end
                local function UpdateVelocity()
                    if GetValue("ControllableDash") then Child.LineDirection = LocalHumanoid.MoveDirection * OriginalVelocityMag
                    else Child.LineDirection = OriginalVelocity end
                end
                UpdateVelocity()
                LocalHumanoid:GetPropertyChangedSignal("MoveDirection"):Connect(UpdateVelocity)
            end
        end)
        task.wait(0.05)
        local TempUI = PlayerGui:FindFirstChild("TemporaryUI") or PlayerGui:WaitForChild("TemporaryUI", 5)
        if TempUI then
            for i,v in TempUI:QueryDescendants("#redFlash,#injuredVignette") do v.Visible = not GetValue("HideInjury") end
        end
    end)
end

Lighting.ChildAdded:Connect(function(Child)
    if Child.Name == "HealthDesaturation" then Child.Enabled = not GetValue("HideInjury") end
end)
if Lighting:FindFirstChild("HealthDesaturation") then Lighting.HealthDesaturation.Enabled = not GetValue("HideInjury") end

local getgc = GetFunction(getgc, get_gc)
if getgc then
    if not MainModule then
        for i,Object in getgc() do
            if type(Object) == "table" then
                if rawget(Object, "Stamina") and rawget(Object, "StaminaChanged") then MainModule = Object break end
            end
        end
    end
    if not MainModule then FeatureLoadout["ExploitFunctions"]["getgc"]["DefaultInstanceValue"] = false end
else FeatureLoadout["ExploitFunctions"]["getgc"]["DefaultInstanceValue"] = false
end

if FeatureLoadout["ExploitFunctions"]["getgc"]["DefaultInstanceValue"] then
    task.spawn(function()
        if game.GameId ~= 6331902150 then
            task.wait(0.5)
            local success, gc_result = pcall(function() return getgc(true) end)
            if success and type(gc_result) == type({}) then
                for i,v in pairs(gc_result) do
                    if type(v) == type({}) then
                        if not rawget(v,"Run") then if i%250 == 0 then task.wait() end continue end
                        local num = 0
                        for i,v in pairs(v) do num += 1 end
                        if num > 3 then AllAnimations[HttpService:GenerateGUID(false):sub(1,5)] = v end
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
    if not isfolder("pradaxca") and not isfolder(SaveBasePath) then makefolder("pradaxca") makefolder(SaveBasePath) UserType = 1
    elseif isfolder("pradaxca") and not isfolder(SaveBasePath) then UserType = 2 makefolder(SaveBasePath)
    elseif isfolder("pradaxca") and isfolder(SaveBasePath) then UserType = 3 end
    DefaultData("Data.txt", "{}")
end

local TableData = HttpService:JSONDecode(ReturnData("Data.txt", true) or "{}")

task.spawn(function()
    local REvent = Network and Network:FindFirstChildOfClass("RemoteEvent")
    local Pr = PlayerData and PlayerData:FindFirstChild("Settings") and PlayerData.Settings:FindFirstChild("Pronouns",true)
    if REvent and Pr and Pr.Value ~= "https://t.me/pradaxcaa" then
        REvent:FireServer("UpdateSettings",{Pr, "https://t.me/pradaxcaa"})
        REvent:FireServer("UpdateSettings",Pr, "https://t.me/pradaxcaa")
    end
end)

local hookmetamethod = GetFunction(hookmetamethod, hook_metamethod)
if not hookmetamethod then FeatureLoadout["ExploitFunctions"]["hookmetamethod"]["DefaultInstanceValue"] = false
else
    if GetValue("OfficialGame") then
        local HookSuccess, HookResult = pcall(function()
            local Event = Network:WaitForChild("UnreliableRemoteEvent")
            local newcclosure = GetFunction(newcclosure, new_cclosure) or function(LClosure) return LClosure end
            local FeatureInstance = FeatureLoadout["Features"]["Invincible"]["Instance"]
            local TypeEnum = {"invalidnumber"}
            local __namecall = true
            __namecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
                if IsUnderground and rawequal(self, Event) and FeatureInstance and FeatureInstance.Value and getnamecallmethod() == "FireServer" then local Args = {...}
                    if Args[1]==1 and Args[2] then
                        local DesyncerNum = 6e9
                        Args[4] = table.create(3)
                        local OutsideVector = Vector3.new(9999,DesyncerNum,9999)
                        task.spawn(function()
                            for Index=1,2 do
                                 if Index+(10*10) > 100 and TypeEnum[1] then
                                    local Closure:buffer = buffer.create
                                    Args[Index+1][#TypeEnum] = (function() return Closure(0) end)()
                                    Args[Index+3][#TypeEnum] = (function() return Closure(0) end)()
                                    break
                                end
                            end
                        end)
                        local NAN,BuggedCFrame = coroutine.resume(coroutine.create(function() return CFrame.fromMatrix(OutsideVector,Vector3.zero,Vector3.one,Vector3.new(1,0,1)):Orthonormalize() end))
                        Args[4][1] = OutsideVector.Unit
                        Args[4][2] = utf8.offset(tostring(buffer.fromstring(tostring(NAN)..tostring(BuggedCFrame.LookVector.Unit))),2,-1)
                        return __namecall(self,table.unpack(Args))
                    end
                end
                return __namecall(self, ...)
            end))
            return __namecall
        end)
        if not HookSuccess or not HookResult then FeatureLoadout["ExploitFunctions"]["hookmetamethod"]["DefaultInstanceValue"] = false end
    end
end

task.spawn(function()
    for i,v in Players:GetPlayers() do if v ~= LocalPlayer then HandlePrivacySettings(v) end end
end)
Players.PlayerAdded:Connect(function(Player) task.wait(2) HandlePrivacySettings(Player) end)
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
                    if v:GetAttribute("OriginalCanCollide") == nil then v:SetAttribute("OriginalCanCollide", v.CanCollide) end
                    v.CanCollide = v:GetAttribute("OriginalCanCollide") ~= false and not Value or false
                    if KillerCollisions then
                        local Params = OverlapParams.new()
                        Params.FilterType = Enum.RaycastFilterType.Include
                        Params.CollisionGroup = "Killers"
                        Params.FilterDescendantsInstances = {KillerCollisions}
                        local Hitbox = workspace:GetPartBoundsInRadius(v.Position, 10, Params)
                        for i,v in Hitbox do v.CanCollide = not Value end
                    end
                    if v:FindFirstChildOfClass("SpecialMesh") then v:FindFirstChildOfClass("SpecialMesh").VertexColor = VertexColor end
                end
            end
        end
    end)
end

ThreadManager:Start("FeatureHandler", function()
    local Automation = FeatureLoadout["Automation"]
    local Features = FeatureLoadout["Features"]
    local Visuals = FeatureLoadout["Visuals"]

    if FeatureLoadout["ExploitFunctions"]["Computer"]["Instance"] then FeatureLoadout["ExploitFunctions"]["Computer"]["Instance"].Value = UserInputService.KeyboardEnabled end

    task.spawn(function()
        if LocalRoot and not IsFixingGenerator and Automation["AutoGeneratorPuzzle"]["Instance"] and Automation["AutoGeneratorPuzzle"]["Instance"].Value and GameMap then
            for i,Object in GameMap:QueryDescendants("Model#Generator:has(#Main)") do
                if LocalRoot and LocalRoot.Anchored ~= true and (Object:FindFirstChild("Main").Position - LocalRoot.Position).Magnitude < 6.7 then
                    task.spawn(function()
                        IsFixingGenerator = true
                        local Remotes = Object:FindFirstChild("Remotes")
                        local Progress = Object:FindFirstChild("Progress")
                        local RemoteEvent = Remotes and Remotes:FindFirstChildOfClass("RemoteEvent")
                        if RemoteEvent and Progress and Progress.Value < 100 then
                            while Progress.Value < 100 do
                                if not IsFixingGenerator or not LocalCharacter or not SpeedMultipliers or not SpeedMultipliers:FindFirstChild("FixingGenerator") or not Automation["AutoGeneratorPuzzle"]["Instance"].Value  then break end
                                task.wait(Random.new():NextNumber(1.45,1.6))
                                if not IsFixingGenerator or not LocalCharacter or not SpeedMultipliers or not SpeedMultipliers:FindFirstChild("FixingGenerator") or not Automation["AutoGeneratorPuzzle"]["Instance"].Value  then break end
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

    local StaminaPreset = Features["StaminaPreset"]["Instance"] and Features["StaminaPreset"]["Instance"].Value or "Original"
    if StaminaPreset ~= "Original" and MainModule and MainModule.MaxStamina then
        if StaminaPreset == "Infinite" then rawset(MainModule, "Stamina", MainModule.MaxStamina)
        else
            local MaxStamina = MainModule.MaxStamina
            if MainModule.Stamina < MaxStamina * 0.8 then rawset(MainModule, "Stamina", math.min(MainModule.Stamina + MaxStamina * (StaminaPreset == "Semi-Realistic" and 0.005 or 0.0025), MaxStamina)) end
        end
    end

    if InGame and GameMap then
        task.spawn(function()
                local Tools = InGame:QueryDescendants("#Map > Tool")
                local DroppedTools = InGame.Parent:QueryDescendants("Folder > Tool")
                for i,v in table.move(Tools,1,#Tools,#DroppedTools+1,DroppedTools) do
                    CreateDynamicHighlight((GetValue("ItemsESP")), v, v:FindFirstChildWhichIsA("BasePart"), {
 ["MaxDistance"] = 100, ["MinDistance"] = 12, ["Color"] = ColorPresets[GetValue("ItemsColor")] or Color3.new(1,1,1)
                    })
                    if v:IsA("Tool") and not LocalCharacter:FindFirstChild(v.Name) and not LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(v.Name) and not v:GetAttribute("JustDropped") and GetValue("AutoPickup") then
                        local ProximityPrompt = v:FindFirstChildWhichIsA("ProximityPrompt",true)
                        local Param = OverlapParams.new()
                        Param.FilterType = Enum.RaycastFilterType.Include
                        Param.FilterDescendantsInstances = {v}
                        local Result = workspace:GetPartBoundsInRadius(LocalRoot.Position, 4.5, Param)
                        if LocalRoot and #Result > 0 and ProximityPrompt then
                            local FireProximtyPrompt = GetFunction(fireproximityprompt, fire_proximity_prompt)
                            if FireProximtyPrompt then FireProximtyPrompt(ProximityPrompt)
                            else ProximityPrompt:InputHoldBegin() ProximityPrompt:InputHoldEnd() end
                        end
                    end
                end
        end)
        for i,v in GameMap:QueryDescendants("Model#Generator:has(#Main)") do
            if FeatureLoadout["Visuals"]["GeneratorsCheck"]["Instance"] and FeatureLoadout["Visuals"]["GeneratorsCheck"]["Instance"].Value == true and v:FindFirstChild("Progress") and v:FindFirstChild("Progress").Value >= 100 then
                CreateDynamicHighlight(false, v)
            elseif v:FindFirstChild("Progress") then
                CreateDynamicHighlight(FeatureLoadout["Visuals"]["GeneratorsESP"]["Instance"] and FeatureLoadout["Visuals"]["GeneratorsESP"]["Instance"].Value, v, v:FindFirstChild("Main") or v:WaitForChild("Main"), {
                    ["MaxDistance"] = 100, ["MinDistance"] = 12, ["Color"] = ColorPresets[FeatureLoadout["Visuals"]["GeneratorsColor"]["Instance"] and FeatureLoadout["Visuals"]["GeneratorsColor"]["Instance"].Value] or Color3.new(1,1,1)
                })
            end
        end
    end
    for i,v in workspace.Players:QueryDescendants("#Killers > Instance,#Survivors > Instance") do
        if v ~= LocalPlayer.Character and Players:GetPlayerFromCharacter(v) ~= nil then
            CreateDynamicHighlight((GetValue(v.Parent.Name.."ESP")), v, v:FindFirstChild("HumanoidRootPart"), {
                ["MaxDistance"] = 100, ["MinDistance"] = 10, ["Color"] = ColorPresets[GetValue(v.Parent.Name.."Color")] or Color3.new(1,1,1)
            })
        else
            CreateDynamicHighlight(false, v)
        end
    end
end,0.1)

if workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers") then
    workspace.Players.Killers.ChildAdded:Connect(function(Child) task.wait(0.5) HandleNoliNPC(GetValue("DisableNoliNPC")) end)
end

if InGame then
    InGame.ChildAdded:Connect(function(Child)
        task.wait(0.02)
        Handle007n7NPC(GetValue("Disable007n7NPC"))
    end)
end

RoundEvent.Event:Connect(function(Data)
    if Data == "Start" then
        if GetValue("ShowChat") then TextChatService.ChatWindowConfiguration.Enabled = true end
    else IsUnderground = false end
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
            task.delay(1.5, function() if Child then Child:SetAttribute("JustDropped", nil) end end)
        elseif Child:IsA("Folder") and (Child.Name):find("JohnDoeTrail") then
            task.wait()
            for i,v in Child:GetChildren() do if v:IsA("BasePart") then v.CanTouch = not GetValue("DisableToxicTrails") end end
        elseif Child:IsA("Folder") and (Child.Name):find("Shadows") then
            task.wait()
            for i,v in Child:GetChildren() do if v:IsA("BasePart") then v.CanTouch = not GetValue("DisableFootprints") end end
            if not Child:GetAttribute("Checked") then
                Child:SetAttribute("Checked", true)
                Child.ChildAdded:Connect(function(GrandChild) if GrandChild:IsA("BasePart") then GrandChild.CanTouch = not GetValue("DisableFootprints") end end)
            end
        elseif Child.Name == "SpikeCollision" then
            Child.Size = GetValue("SmallerSpikeCollisions") and Vector3.new(10,3.25,3.25) or Vector3.new(11, 5, 5)
            Child.Shape = GetValue("SmallerSpikeCollisions") and Enum.PartType.Cylinder or Enum.PartType.Block
        end
    end)
end

if workspace:FindFirstChild("Ragdolls") then
    workspace:FindFirstChild("Ragdolls").ChildAdded:Connect(function(Ragdoll)
        if GetValue("DeleteRagdolls") then workspace:FindFirstChild("Ragdolls"):ClearAllChildren() end
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

RunService.RenderStepped:Connect(UpdateESP)

-- ==========================================
-- PRADAXCA CUSTOM UI FRAMEWORK (REMASTERED)
-- ==========================================

local UIConfig = {
    ToggleIcon = "rbxassetid://114704837418228",
    BackgroundId = "rbxassetid://92266968408887",
    CurrentLang = "EN",
    Animations = true
}

local Lang = {
    ["EN"] = {
        Automation = "Automation", Features = "Features", Visuals = "Visuals", 
        Misc = "Miscellaneous", Settings = "Settings", Information = "Information",
        Dev = "Developer: pradaxca", Tele = "Telegram: https://t.me/pradaxcaa", 
        Tiktok = "TikTok: @pradaxcaa", Status = "Status: Free", LangToggle = "Language: English",
        Title = "Shenxiue"
    },
    ["CN"] = {
        Automation = "自动化", Features = "功能", Visuals = "视觉", 
        Misc = "杂项", Settings = "设置", Information = "信息",
        Dev = "开发者: pradaxca", Tele = "电报: https://t.me/pradaxcaa", 
        Tiktok = "抖音: @pradaxcaa", Status = "状态: 免费", LangToggle = "语言: 简体中文",
        Title = "Shenxiue"
    }
}

local FeatureNames = {
    ["EN"] = {
        AutoGeneratorPuzzle = "Auto Generator(s)",
        AutoPickup = "Auto Pickup",
        Invincible = "Invincible",
        DisableKillerWalls = "Disable Killer Walls",
        DisableToxicTrails = "Disable John Doe's Trails",
        DisableFootprints = "Disable John Doe's Footprints",
        SmallerSpikeCollisions = "Smaller Spike Collisions",
        EnableJumping = "Enable Jumping",
        StaminaPreset = "Stamina Preset",
        AntiSlowness = "Anti Slowness",
        AnimationChanger = "Animation Changer",
        NoliControl = "Better Void Rush",
        ControllableDash = "Make Coolkidd's Dash Controllable",
        DisableNoliNPC = "Disable Noli's NPC",
        Disable007n7NPC = "Disable 007n7's NPC",
        ESP = "ESP",
        KillersESP = "Killer(s) (ESP)",
        KillersColor = "Killer(s) Color",
        SurvivorsESP = "Survivor(s) (ESP)",
        SurvivorsColor = "Survivor(s) Color",
        GeneratorsESP = "Generator(s) (ESP)",
        GeneratorsColor = "Generator(s) Color",
        GeneratorsCheck = "Hide Completed Generator(s)",
        ItemsESP = "Item(s) (ESP)",
        ItemsColor = "Item(s) Color",
        ESP_Line = "ESP Line",
        ESP_Box = "ESP Box",
        ESP_Name = "ESP Name",
        ExtendedFOV = "Extended FOV",
        ExtendedZoom = "Extended Zoom Distance",
        ShowChat = "Show Chat",
        ShowPrivacy = "Shows Privacy Info",
        HideInjury = "Hide Injured UI/Effects",
        DeleteRagdolls = "Delete All Ragdolls",
        PlayerSelectCrash = "Player to crash",
        CrashTheTarget = "Crash Target",
        SkyGlitch = "Sky Glitch",
        InstaKill = "Instant Kill",
        OfficialJoin = "Join the official version",
        Rejoin = "Rejoin"
    },
    ["CN"] = {
        AutoGeneratorPuzzle = "自动发电机",
        AutoPickup = "自动拾取",
        Invincible = "无敌",
        DisableKillerWalls = "禁用杀手墙",
        DisableToxicTrails = "禁用 John Doe 轨迹",
        DisableFootprints = "禁用 John Doe 脚印",
        SmallerSpikeCollisions = "更小尖刺碰撞",
        EnableJumping = "启用跳跃",
        StaminaPreset = "耐力模式",
        AntiSlowness = "反减速",
        AnimationChanger = "动画切换",
        NoliControl = "更可控虚空冲刺",
        ControllableDash = "可控冲刺",
        DisableNoliNPC = "禁用 Noli NPC",
        Disable007n7NPC = "禁用 007n7 NPC",
        ESP = "透视",
        KillersESP = "杀手透视",
        KillersColor = "杀手颜色",
        SurvivorsESP = "幸存者透视",
        SurvivorsColor = "幸存者颜色",
        GeneratorsESP = "发电机透视",
        GeneratorsColor = "发电机颜色",
        GeneratorsCheck = "隐藏完成的发电机",
        ItemsESP = "物品透视",
        ItemsColor = "物品颜色",
        ESP_Line = "透视线",
        ESP_Box = "透视方框",
        ESP_Name = "透视名称",
        ExtendedFOV = "扩展视野",
        ExtendedZoom = "扩展缩放距离",
        ShowChat = "显示聊天",
        ShowPrivacy = "显示隐私信息",
        HideInjury = "隐藏受伤UI/效果",
        DeleteRagdolls = "删除所有布娃娃",
        PlayerSelectCrash = "崩溃目标选择",
        CrashTheTarget = "崩溃目标",
        SkyGlitch = "天空故障",
        InstaKill = "瞬间击杀",
        OfficialJoin = "加入官方版本",
        Rejoin = "重新加入"
    }
}

local UI_Parent = (gethui and gethui()) or game:GetService("CoreGui")

if UI_Parent:FindFirstChild("PradaxcaUI") then UI_Parent.PradaxcaUI:Destroy() end

local PradaxcaUI = Instance.new("ScreenGui")
PradaxcaUI.Name = "PradaxcaUI"
PradaxcaUI.Parent = UI_Parent
PradaxcaUI.ResetOnSpawn = false

-- Toggle Button
local ToggleBtn = Instance.new("ImageButton")
ToggleBtn.Name = "ToggleUI"
ToggleBtn.Parent = PradaxcaUI
ToggleBtn.Image = UIConfig.ToggleIcon
ToggleBtn.BackgroundTransparency = 1 
ToggleBtn.Size = UDim2.new(0, 45, 0, 45)
ToggleBtn.Position = UDim2.new(0, 20, 0, 20)
ToggleBtn.Active = true
ToggleBtn.Draggable = true

-- Main Window
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = PradaxcaUI
MainFrame.Size = UDim2.new(0, 500, 0, 330)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -165)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BackgroundTransparency = 1 -- changed so background image stays visible
MainFrame.ClipsDescendants = true
MainFrame.Visible = false
MainFrame.Active = true

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)
local UIStroke = Instance.new("UIStroke", MainFrame)
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Transparency = 0.8
UIStroke.Thickness = 1

-- Solid Texture Background
local BgImage = Instance.new("ImageLabel", MainFrame)
BgImage.Size = UDim2.new(1, 0, 1, 0)
BgImage.Image = UIConfig.BackgroundId
BgImage.BackgroundTransparency = 1
BgImage.ImageTransparency = 0.15
BgImage.ScaleType = Enum.ScaleType.Crop
BgImage.ZIndex = 0

-- Liquid Glass Overlay (on top of the texture)
local GlassOverlay = Instance.new("Frame", MainFrame)
GlassOverlay.Size = UDim2.new(1, 0, 1, 0)
GlassOverlay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GlassOverlay.BackgroundTransparency = 0.88
GlassOverlay.ZIndex = 1
GlassOverlay.Active = false
GlassOverlay.Interactable = false
Instance.new("UICorner", GlassOverlay).CornerRadius = UDim.new(0, 12)

-- Dragging Logic
local dragging, dragInput, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)
MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

-- Resize Logic
local ResizeBtn = Instance.new("TextButton", MainFrame)
ResizeBtn.Size = UDim2.new(0, 20, 0, 20)
ResizeBtn.Position = UDim2.new(1, -20, 1, -20)
ResizeBtn.BackgroundTransparency = 1
ResizeBtn.Text = "⌟"
ResizeBtn.TextColor3 = Color3.fromRGB(255,255,255)
ResizeBtn.TextSize = 20
ResizeBtn.ZIndex = 5
local resizing = false
ResizeBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then resizing = true end
end)
UserInputService.InputChanged:Connect(function(input)
    if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
        local mousePos = UserInputService:GetMouseLocation()
        local newX = math.clamp(mousePos.X - MainFrame.AbsolutePosition.X, 350, 800)
        local newY = math.clamp(mousePos.Y - MainFrame.AbsolutePosition.Y - 36, 250, 600)
        MainFrame.Size = UDim2.new(0, newX, 0, newY)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then resizing = false end
end)

-- Toggle Animation Main Window
ToggleBtn.MouseButton1Click:Connect(function()
    if MainFrame.Visible then
        local tween = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1})
        tween:Play()
        tween.Completed:Wait()
        MainFrame.Visible = false
    else
        MainFrame.Visible = true
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        MainFrame.BackgroundTransparency = 1
        TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 500, 0, 330), BackgroundTransparency = 1}):Play()
    end
end)

-- Layout Structure
local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.BackgroundTransparency = 1
TopBar.ZIndex = 2

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1, -20, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = Lang[UIConfig.CurrentLang].Title
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 2

-- Horizontal Tab Menu
local TabContainer = Instance.new("ScrollingFrame", MainFrame)
TabContainer.Size = UDim2.new(1, -20, 0, 35)
TabContainer.Position = UDim2.new(0, 10, 0, 35)
TabContainer.BackgroundTransparency = 1
TabContainer.ScrollBarThickness = 0
TabContainer.CanvasSize = UDim2.new(1.2, 0, 0, 0)
TabContainer.ZIndex = 2

local TabListLayout = Instance.new("UIListLayout", TabContainer)
TabListLayout.FillDirection = Enum.FillDirection.Horizontal
TabListLayout.Padding = UDim.new(0, 5)

-- Content Area
local ContentContainer = Instance.new("Frame", MainFrame)
ContentContainer.Size = UDim2.new(1, -20, 1, -85)
ContentContainer.Position = UDim2.new(0, 10, 0, 75)
ContentContainer.BackgroundTransparency = 1
ContentContainer.ZIndex = 2

local Tabs = {}
local CurrentTab = nil
local UIRefs = {}
local InfoLabels = {}

local function SwitchTab(tabFrame)
    if CurrentTab then
        TweenService:Create(CurrentTab, TweenInfo.new(0.2), {Position = UDim2.new(0, 20, 0, 0), GroupTransparency = 1}):Play()
        task.wait(0.1)
        CurrentTab.Visible = false
    end
    tabFrame.Visible = true
    tabFrame.Position = UDim2.new(0, -20, 0, 0)
    tabFrame.GroupTransparency = 1
    TweenService:Create(tabFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, 0, 0), GroupTransparency = 0}):Play()
    CurrentTab = tabFrame
end

local function CreateTab(nameKey)
    local btn = Instance.new("TextButton")
    btn.Text = Lang[UIConfig.CurrentLang][nameKey]
    btn.Size = UDim2.new(0, 95, 1, -5)
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundTransparency = 0.85
    btn.TextColor3 = Color3.fromRGB(220, 220, 220)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 13
    btn.ZIndex = 3
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    btn.Parent = TabContainer
    
    local contentScroll = Instance.new("CanvasGroup")
    contentScroll.Size = UDim2.new(1, 0, 1, 0)
    contentScroll.BackgroundTransparency = 1
    contentScroll.Visible = false
    contentScroll.ZIndex = 3
    contentScroll.Parent = ContentContainer
    
    local innerScroll = Instance.new("ScrollingFrame")
    innerScroll.Size = UDim2.new(1, 0, 1, 0)
    innerScroll.BackgroundTransparency = 1
    innerScroll.ScrollBarThickness = 3
    innerScroll.ZIndex = 3
    innerScroll.Parent = contentScroll
    
    local contentLayout = Instance.new("UIListLayout", innerScroll)
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentLayout.Padding = UDim.new(0, 8)
    
    btn.MouseButton1Click:Connect(function() SwitchTab(contentScroll) end)
    
    Tabs[nameKey] = {Btn = btn, Scroll = innerScroll, Key = nameKey}
    return innerScroll
end

local TabAuto = CreateTab("Automation")
local TabFeat = CreateTab("Features")
local TabVis = CreateTab("Visuals")
local TabMisc = CreateTab("Misc")
local TabSet = CreateTab("Settings")
local TabInfo = CreateTab("Information")

local LangBtn = Instance.new("TextButton", TabSet)
LangBtn.Size = UDim2.new(1, -10, 0, 40)
LangBtn.BackgroundColor3 = Color3.fromRGB(255,255,255)
LangBtn.BackgroundTransparency = 0.8
LangBtn.TextColor3 = Color3.fromRGB(255,255,255)
LangBtn.Font = Enum.Font.GothamBold
LangBtn.TextSize = 14
LangBtn.ZIndex = 3
LangBtn.Text = Lang[UIConfig.CurrentLang].LangToggle
Instance.new("UICorner", LangBtn).CornerRadius = UDim.new(0, 6)

local function ApplyLanguage()
    LangBtn.Text = Lang[UIConfig.CurrentLang].LangToggle
    Title.Text = Lang[UIConfig.CurrentLang].Title
    for _, tabData in pairs(Tabs) do tabData.Btn.Text = Lang[UIConfig.CurrentLang][tabData.Key] end
    for key, lbl in pairs(InfoLabels) do lbl.Text = Lang[UIConfig.CurrentLang][key] end
    for key, ref in pairs(UIRefs) do
        local localized = FeatureNames[UIConfig.CurrentLang][key] or ref.BaseTitle
        if ref.Type == "toggle" then
            ref.Object.Text = localized
        elseif ref.Type == "slider" or ref.Type == "dropdown" then
            ref.Object.Text = localized .. " : " .. tostring(ref.Value.Value)
        end
    end
end

LangBtn.MouseButton1Click:Connect(function()
    UIConfig.CurrentLang = (UIConfig.CurrentLang == "EN") and "CN" or "EN"
    ApplyLanguage()
end)

local function AddInfoText(textKey)
    local lbl = Instance.new("TextLabel", TabInfo)
    lbl.Size = UDim2.new(1, -10, 0, 30)
    lbl.BackgroundTransparency = 1
    lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    lbl.Font = Enum.Font.GothamSemibold
    lbl.TextSize = 14
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 3
    lbl.Text = Lang[UIConfig.CurrentLang][textKey]
    InfoLabels[textKey] = lbl
    return lbl
end

AddInfoText("Dev")
AddInfoText("Tele")
AddInfoText("Tiktok")
AddInfoText("Status")

local function CreateToggle(parent, rawTitle, instanceVal, func, featureKey)
    local displayTitle = FeatureNames[UIConfig.CurrentLang][featureKey] or rawTitle
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, -10, 0, 35)
    frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    frame.BackgroundTransparency = 0.9
    frame.ZIndex = 3
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)
    
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -50, 1, 0)
    lbl.Position = UDim2.new(0, 10, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 13
    lbl.ZIndex = 3
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Text = displayTitle
    
    UIRefs[featureKey] = {Type = "toggle", Object = lbl, Value = instanceVal, BaseTitle = rawTitle}
    
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0, 40, 0, 20)
    btn.Position = UDim2.new(1, -50, 0.5, -10)
    btn.BackgroundColor3 = instanceVal.Value and Color3.fromRGB(0, 200, 125) or Color3.fromRGB(60, 60, 60)
    btn.Text = ""
    btn.ZIndex = 3
    Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)
    
    local circle = Instance.new("Frame", btn)
    circle.Size = UDim2.new(0, 16, 0, 16)
    circle.Position = instanceVal.Value and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
    circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    circle.ZIndex = 4
    Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)
    
    btn.MouseButton1Click:Connect(function()
        instanceVal.Value = not instanceVal.Value
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = instanceVal.Value and Color3.fromRGB(0, 200, 125) or Color3.fromRGB(60, 60, 60)}):Play()
        TweenService:Create(circle, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = instanceVal.Value and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)}):Play()
        if func then func(FeatureLoadout, instanceVal.Value) end
    end)
end

local function CreateSlider(parent, rawTitle, instanceVal, min, max, func, featureKey)
    local displayTitle = FeatureNames[UIConfig.CurrentLang][featureKey] or rawTitle
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, -10, 0, 50)
    frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    frame.BackgroundTransparency = 0.9
    frame.ZIndex = 3
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)
    
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -20, 0, 20)
    lbl.Position = UDim2.new(0, 10, 0, 5)
    lbl.BackgroundTransparency = 1
    lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 13
    lbl.ZIndex = 3
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Text = displayTitle .. " : " .. tostring(instanceVal.Value)

    UIRefs[featureKey] = {Type = "slider", Object = lbl, Value = instanceVal, BaseTitle = rawTitle}
    
    local sliderBg = Instance.new("Frame", frame)
    sliderBg.Size = UDim2.new(1, -20, 0, 6)
    sliderBg.Position = UDim2.new(0, 10, 0, 35)
    sliderBg.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    sliderBg.ZIndex = 3
    Instance.new("UICorner", sliderBg).CornerRadius = UDim.new(1, 0)
    
    local sliderFill = Instance.new("Frame", sliderBg)
    local percent = (instanceVal.Value - min) / (max - min)
    sliderFill.Size = UDim2.new(percent, 0, 1, 0)
    sliderFill.BackgroundColor3 = Color3.fromRGB(0, 170, 127)
    sliderFill.ZIndex = 3
    Instance.new("UICorner", sliderFill).CornerRadius = UDim.new(1, 0)
    
    local btn = Instance.new("TextButton", sliderBg)
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.ZIndex = 4
    
    local draggingSlider = false
    btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then draggingSlider = true end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then draggingSlider = false end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if draggingSlider and input.UserInputType == Enum.UserInputType.MouseMovement then
            local mousePos = UserInputService:GetMouseLocation().X
            local rel = math.clamp((mousePos - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1)
            sliderFill.Size = UDim2.new(rel, 0, 1, 0)
            local val = math.floor(min + (max - min) * rel)
            instanceVal.Value = val
            lbl.Text = displayTitle .. " : " .. tostring(val)
            if featureKey == "ExtendedFOV" then
                workspace.CurrentCamera.FieldOfView = val
            end
            if func then func(FeatureLoadout, val) end
        end
    end)
end

local function CreateDropdown(parent, rawTitle, instanceVal, optionsString, func, featureKey)
    local displayTitle = FeatureNames[UIConfig.CurrentLang][featureKey] or rawTitle
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, -10, 0, 35)
    frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    frame.BackgroundTransparency = 0.9
    frame.ZIndex = 3
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)
    
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -100, 1, 0)
    lbl.Position = UDim2.new(0, 10, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 13
    lbl.ZIndex = 3
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Text = displayTitle .. " : " .. tostring(instanceVal.Value)

    UIRefs[featureKey] = {Type = "dropdown", Object = lbl, Value = instanceVal, BaseTitle = rawTitle}
    
    local dropBtn = Instance.new("TextButton", frame)
    dropBtn.Size = UDim2.new(0, 80, 0, 25)
    dropBtn.Position = UDim2.new(1, -90, 0.5, -12.5)
    dropBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    dropBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    dropBtn.Text = "Select ▼"
    dropBtn.ZIndex = 3
    Instance.new("UICorner", dropBtn).CornerRadius = UDim.new(0, 4)

    local listFrame = Instance.new("ScrollingFrame", parent)
    listFrame.Size = UDim2.new(1, -20, 0, 100)
    listFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    listFrame.BackgroundTransparency = 0.5
    listFrame.Visible = false
    listFrame.ScrollBarThickness = 2
    listFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    listFrame.CanvasSize = UDim2.new(0,0,0,0)
    listFrame.ZIndex = 5
    Instance.new("UICorner", listFrame).CornerRadius = UDim.new(0, 6)

    local function buildOptions()
        listFrame:ClearAllChildren()
        Instance.new("UIListLayout", listFrame).SortOrder = Enum.SortOrder.LayoutOrder
        local optString = instanceVal:GetAttribute("Options") or optionsString
        local options = string.split(optString, "|")
        for _, opt in ipairs(options) do
            local optBtn = Instance.new("TextButton", listFrame)
            optBtn.Size = UDim2.new(1, 0, 0, 25)
            optBtn.BackgroundTransparency = 1
            optBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
            optBtn.Text = opt
            optBtn.Font = Enum.Font.Gotham
            optBtn.ZIndex = 5
            optBtn.MouseButton1Click:Connect(function()
                instanceVal.Value = opt
                lbl.Text = displayTitle .. " : " .. tostring(opt)
                listFrame.Visible = false
                if func then func(FeatureLoadout, opt) end
            end)
        end
    end

    buildOptions()
    if instanceVal:GetAttribute("Options") == nil then instanceVal:SetAttribute("Options", optionsString) end
    instanceVal:GetAttributeChangedSignal("Options"):Connect(buildOptions)
    
    dropBtn.MouseButton1Click:Connect(function() listFrame.Visible = not listFrame.Visible end)
end

-- Link Data to Custom UI
PlusFolderSettings.Name = "shen"
PlusFolderSettings.Parent = PlayerData

for TabName, TabContents in pairs(FeatureLoadout) do
    if TabName == "ExploitFunctions" or TabName == "Outdated" or TabName == "Unofficial" then continue end
    
    local targetTab
    if TabName == "Automation" then targetTab = TabAuto
    elseif TabName == "Features" then targetTab = TabFeat
    elseif TabName == "Visuals" then targetTab = TabVis
    elseif TabName == "Miscellaneous" then targetTab = TabMisc
    end

    local Folder = Instance.new("Folder", PlusFolderSettings)
    Folder.Name = TabName

    for SettingName, SettingData in pairs(TabContents) do
        if type(SettingData) ~= "table" or SettingName == "TabAttributes" then continue end
        
        local NewInstance = Instance.new(SettingData.InstanceType)
        NewInstance.Name = SettingName
        NewInstance.Value = TableData[SettingName] ~= nil and TableData[SettingName] or SettingData.DefaultInstanceValue
        NewInstance.Parent = Folder
        FeatureLoadout[TabName][SettingName]["Instance"] = NewInstance

        NewInstance:GetPropertyChangedSignal("Value"):Connect(function()
            if SettingData.Savable then
                TableData[SettingName] = NewInstance.Value
                ChangeData("Data.txt", HttpService:JSONEncode(TableData), true)
            end
            if SettingData.ScriptFunction then SettingData.ScriptFunction(FeatureLoadout[TabName][SettingName], NewInstance.Value) end
        end)

        if targetTab then
            local cleanTitle = SettingData.DisplayTitle:gsub("<[^>]+>", "")
            if SettingData.InstanceType == "BoolValue" then
                CreateToggle(targetTab, cleanTitle, NewInstance, SettingData.ScriptFunction, SettingName)
            elseif SettingData.InstanceType == "NumberValue" then
                local min = SettingData.ExtraData and SettingData.ExtraData.MinValue or 0
                local max = SettingData.ExtraData and SettingData.ExtraData.MaxValue or 100
                CreateSlider(targetTab, cleanTitle, NewInstance, min, max, SettingData.ScriptFunction, SettingName)
            elseif SettingData.InstanceType == "StringValue" and SettingData.ExtraData and SettingData.ExtraData.Options then
                CreateDropdown(targetTab, cleanTitle, NewInstance, SettingData.ExtraData.Options, SettingData.ScriptFunction, SettingName)
            end
        end

        if SettingData.ScriptFunction then
            task.spawn(function()
                local ok, err = pcall(SettingData.ScriptFunction, FeatureLoadout[TabName][SettingName], NewInstance.Value)
                if not ok then warn("Shenxiue init error ("..SettingName.."): "..tostring(err)) end
            end)
        end
    end
end

SwitchTab(Tabs["Automation"].Scroll)

RunService.RenderStepped:Connect(function()
    if FeatureLoadout and FeatureLoadout["Miscellaneous"] and FeatureLoadout["Miscellaneous"]["ExtendedFOV"] and FeatureLoadout["Miscellaneous"]["ExtendedFOV"]["Instance"] then
        local fovValue = FeatureLoadout["Miscellaneous"]["ExtendedFOV"]["Instance"].Value
        if workspace.CurrentCamera.FieldOfView ~= fovValue then
            workspace.CurrentCamera.FieldOfView = fovValue
        end
    end
end)

ColoredPrint("Shenxiue (pradaxca UI) has loaded successfully","success",Color3.fromRGB(0, 200, 125))