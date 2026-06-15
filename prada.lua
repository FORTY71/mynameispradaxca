-- Forsaken Plus Made by Naiko Exploits
-- UI Overhaul & Custom ESP by Pradaxca

if workspace.DistributedGameTime < 3 then
	task.wait(3 - workspace.DistributedGameTime)
end

if game.CoreGui:FindFirstChild("PradaxcaUI") or game.CoreGui:FindFirstChild("Plus") then
    return warn("Script already running")
elseif game.GameId == 6331902150 or game.GameId == 7464167604 or workspace:GetAttribute("ServerType") then
	Instance.new("BoolValue", game.CoreGui).Name = "Plus"
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
local IsUnderground,IsFixingGenerator,WarnedAboutFilesCompatability = false,false,false
local PlaySound,MainModule,HandlePrivacySettings,Check,IsHitboxNotNear,IsPoisonOnPosition,GoUnder,HandleAllowJumping,HandleNoliNPC,ChangeTrackWithOverride,LastTrack,NoliConfig,TableValueFind,ColoredPrint,Handle007n7NPC,GetValue
local ColorPresets = {["White"] = Color3.fromRGB(255,255,255),["Teal"] = Color3.fromRGB(3,252,157),["Green"] = Color3.fromRGB(0,255,0),["Purple"] = Color3.fromRGB(128,0,128),["Red"] = Color3.fromRGB(255,0,0),["Blue"] = Color3.fromRGB(0,0,255),["Cyan"] = Color3.fromRGB(0,255,255),["Gold"] = Color3.fromRGB(255,215,0),["Orange"] = Color3.fromRGB(255,165,0)}
local GameVersionForScript = "2026-06-12"
local OverriddenAnimations = {}
local Worked,CurrentGameVersion = pcall(function() return MarketplaceService:GetProductInfoAsync(game.PlaceId,Enum.InfoType.Asset)["Updated"] end) ;
CurrentGameVersion = Worked and CurrentGameVersion or GameVersionForScript
local AllAnimations = {}

local FeatureLoadout;
FeatureLoadout = {
    ["ExploitFunctions"] = {
        ["TabAttributes"] = {["DisplayTitle"] = "Loading...",["LayoutOrder"] = 666},
        ["hookmetamethod"] = {["DisplayTitle"] = "hookmetamethod",["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = true,["ScriptFunction"] = function() end},
        ["getgc"] = {["DisplayTitle"] = "getgc",["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = true,["ScriptFunction"] = function() end},
        ["require"] = {["DisplayTitle"] = "require",["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = true,["ScriptFunction"] = function() end},
        ["files"] = {["DisplayTitle"] = "files",["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = true,["ScriptFunction"] = function() end},
        ["OfficialGame"] = {["DisplayTitle"] = "Official Game",["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = game.GameId == 6331902150 or game.GameId == 7464167604,["ScriptFunction"] = function() end},
        ["PrivateServer"] = {["DisplayTitle"] = "Private Server",["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = workspace:GetAttribute("ServerType") == "VIP",["ScriptFunction"] = function() end},
        ["PrivateServerOwner"] = {["DisplayTitle"] = "Private Server",["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = workspace:GetAttribute("ServerOwnerID") == LocalPlayer.UserId,["ScriptFunction"] = function() end},
        ["NServer"] = {["DisplayTitle"] = "N Server",["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = game.PlaceId == 83645629621104,["ScriptFunction"] = function() end},
        ["Computer"] = {["DisplayTitle"] = "Computer",["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = UserInputService.KeyboardEnabled,["ScriptFunction"] = function() end},
    },
    ["Automation"] = {
        ["TabAttributes"] = {["DisplayTitle"] = "Automation",["LayoutOrder"] = 1},
        ["AutoGeneratorPuzzle"] = {["DisplayTitle"] = "Auto Generator(s)",["LayoutOrder"] = 1,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ScriptFunction"] = function() end},
        ["AutoPickup"] = {["DisplayTitle"] = "Auto Pickup",["LayoutOrder"] = 2,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ScriptFunction"] = function() end},
    },
    ["Features"] = {
        ["TabAttributes"] = {["DisplayTitle"] = "Features",["LayoutOrder"] = 2},
        ["Invincible"] = {
            ["DisplayTitle"] = "Invincible",["LayoutOrder"] = 1,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,
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
            ["DisplayTitle"] = "Disable Killer Walls",["LayoutOrder"] = 2,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,
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
                            for _, hb in Hitbox do hb.CanCollide = not Value end
                        end
                        if v:FindFirstChildOfClass("SpecialMesh") then v:FindFirstChildOfClass("SpecialMesh").VertexColor = VertexColor end
                    end
                end
            end
        },
        ["DisableToxicTrails"] = {
            ["DisplayTitle"] = "Disable John Doe's Trails",["LayoutOrder"] = 3,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,
            ["ScriptFunction"] = function(self, Value)
                if not InGame then return end
                for i,v in InGame:GetChildren() do
                    if v:IsA("Folder") and (v.Name):find("JohnDoeTrail") then
                        for _, v2 in v:GetChildren() do if v2:IsA("BasePart") then v2.CanTouch = not Value end end
                    end
                end
            end
        },
        ["DisableFootprints"] = {
            ["DisplayTitle"] = "Disable John Doe's Footprints",["LayoutOrder"] = 4,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,
            ["ScriptFunction"] = function(self, Value)
                if not InGame then return end
                for i,v in InGame:GetChildren() do
                    if v:IsA("Folder") and (v.Name):find("Shadows") then
                        for _, v2 in v:GetChildren() do if v2:IsA("BasePart") then v2.CanTouch = not Value end end
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
            ["DisplayTitle"] = "Smaller Spike Collisions",["LayoutOrder"] = 5,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,
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
        ["EnableJumping"] = {["DisplayTitle"] = "Enable Jumping",["LayoutOrder"] = 7,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ScriptFunction"] = function(self, Value) HandleAllowJumping(Value) end},
        ["StaminaPreset"] = {
            ["DisplayTitle"] = "Stamina Preset",["LayoutOrder"] = 8,["Savable"] = true,["InstanceType"] = "StringValue",["DefaultInstanceValue"] = "Original",
            ["ExtraData"] = {["Options"] = "Original|Realistic|Semi-Realistic|Infinite"},
            ["ScriptFunction"] = function() end
        },
        ["AntiSlowness"] = {
            ["DisplayTitle"] = "Anti Slowness",["LayoutOrder"] = 9,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,
            ["ScriptFunction"] = function(self, Value)
                if not Value or not SpeedMultipliers then return end
                for _,Child in SpeedMultipliers:GetChildren() do Check(Child) end
            end
        },
        ["AnimationChanger"] = {
            ["DisplayTitle"] = "Animation Changer",["LayoutOrder"] = 10,["Savable"] = false,["InstanceType"] = "StringValue",["DefaultInstanceValue"] = "Original",
            ["ExtraData"] = {["Options"] = "Original|Jason|Slasher|c00lkidd|John Doe|Noli|1x1x1x1|Nosferatu|Azure|!Herobrine|!Brimstone"},
            ["ScriptFunction"] = function(self, Value)
                if Value == "Original" then
                    BindableShouldStop:Fire()
                else
                    local Animator = LocalHumanoid and LocalHumanoid:FindFirstChildOfClass("Animator")
                    if ChangeTrackWithOverride and Animator then
                        for _,v in Animator:GetPlayingAnimationTracks() do ChangeTrackWithOverride(v,Value,true) end
                    end
                end
            end
        },
        ["NoliControl"] = {
            ["DisplayTitle"] = "Better Void Rush",["LayoutOrder"] = 11,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,
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
        ["ControllableDash"] = {["DisplayTitle"] = "Make Coolkidd's Dash Controllable",["LayoutOrder"] = 12,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ScriptFunction"] = function() end}
    },
    ["Visuals"] = {
        ["TabAttributes"] = {["DisplayTitle"] = "Visuals",["LayoutOrder"] = 3},
        ["DisableNoliNPC"] = {["DisplayTitle"] = "Disable Noli's NPC",["LayoutOrder"] = 1,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ScriptFunction"] = function(self, Value) HandleNoliNPC(Value) end},
        ["Disable007n7NPC"] = {["DisplayTitle"] = "Disable 007n7's NPC",["LayoutOrder"] = 2,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ScriptFunction"] = function(self, Value) Handle007n7NPC(Value) end},
        ["ESP"] = {["DisplayTitle"] = "ESP Master",["LayoutOrder"] = 3,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ScriptFunction"] = function() end},
        ["ESPBox"] = {["DisplayTitle"] = "ESP Box",["LayoutOrder"] = 4,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ScriptFunction"] = function() end},
        ["ESPLine"] = {["DisplayTitle"] = "ESP Line (Tracer)",["LayoutOrder"] = 5,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ScriptFunction"] = function() end},
        ["ESPName"] = {["DisplayTitle"] = "ESP Name & Distance",["LayoutOrder"] = 6,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ScriptFunction"] = function() end},
        ["KillersESP"] = {["DisplayTitle"] = "Killer(s) Enabled",["LayoutOrder"] = 7,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ScriptFunction"] = function() end},
        ["KillersColor"] = {["DisplayTitle"] = "Killer(s) Color",["LayoutOrder"] = 8,["Savable"] = true,["InstanceType"] = "StringValue",["DefaultInstanceValue"] = "Red",["ExtraData"] = {["Options"] = "Red|Orange|Purple|Gold"},["ScriptFunction"] = function() end},
        ["SurvivorsESP"] = {["DisplayTitle"] = "Player(s) Enabled",["LayoutOrder"] = 9,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ScriptFunction"] = function() end},
        ["SurvivorsColor"] = {["DisplayTitle"] = "Player(s) Color",["LayoutOrder"] = 10,["Savable"] = true,["InstanceType"] = "StringValue",["DefaultInstanceValue"] = "Green",["ExtraData"] = {["Options"] = "Green|Orange|Purple|Gold"},["ScriptFunction"] = function() end},
        ["GeneratorsESP"] = {["DisplayTitle"] = "Generator(s) Master",["LayoutOrder"] = 11,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ScriptFunction"] = function() end},
        ["GeneratorsColor"] = {["DisplayTitle"] = "Generator(s) Color",["LayoutOrder"] = 12,["Savable"] = true,["InstanceType"] = "StringValue",["DefaultInstanceValue"] = "Cyan",["ExtraData"] = {["Options"] = "Cyan|Blue|Green|Orange|Purple|Gold"},["ScriptFunction"] = function() end},
        ["GeneratorsCheck"] = {["DisplayTitle"] = "Hide Completed Generator(s)",["LayoutOrder"] = 13,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = true,["ScriptFunction"] = function() end},
        ["ItemsESP"] = {["DisplayTitle"] = "Item(s) Enabled",["LayoutOrder"] = 14,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,["ScriptFunction"] = function() end},
        ["ItemsColor"] = {["DisplayTitle"] = "Item(s) Color",["LayoutOrder"] = 15,["Savable"] = true,["InstanceType"] = "StringValue",["DefaultInstanceValue"] = "Gold",["ExtraData"] = {["Options"] = "Gold|Cyan|Purple|White"},["ScriptFunction"] = function() end},
    },
    ["Miscellaneous"] = {
        ["TabAttributes"] = {["DisplayTitle"] = "Miscellaneous",["LayoutOrder"] = 4},
        ["ExtendedFOV"] = {
            ["DisplayTitle"] = "Extended FOV",["LayoutOrder"] = 1,["Savable"] = true,["InstanceType"] = "NumberValue",
            ["DefaultInstanceValue"] = PlayerData and PlayerData:FindFirstChild("Settings") and PlayerData.Settings.Game.FieldOfView.Value or 70,
            ["ExtraData"] = {["MaxValue"] = 120,["MinValue"] = 10,["Step"] = 5},
            ["ScriptFunction"] = function(self, Value)
                if PlayerData and PlayerData:FindFirstChild("Settings") then PlayerData.Settings.Game.FieldOfView.Value = Value end
                workspace.CurrentCamera.FieldOfView = Value
            end
        },
        ["ExtendedZoom"] = {
            ["DisplayTitle"] = "Extended Zoom",["LayoutOrder"] = 2,["Savable"] = true,["InstanceType"] = "NumberValue",["DefaultInstanceValue"] = 10,
            ["ExtraData"] = {["MaxValue"] = 100,["MinValue"] = 0,["Step"] = 5},
            ["ScriptFunction"] = function(self, Value) LocalPlayer.CameraMaxZoomDistance = game:GetService("StarterPlayer").CameraMaxZoomDistance + (Value * 0.25) end
        },
        ["ShowChat"] = {
            ["DisplayTitle"] = "Show Chat",["LayoutOrder"] = 3,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,
            ["ScriptFunction"] = function(self, Value)
                if TextChatService:FindFirstChildOfClass("ChatWindowConfiguration") then TextChatService:FindFirstChildOfClass("ChatWindowConfiguration").Enabled = Value end
            end
        },
        ["ShowPrivacy"] = {
            ["DisplayTitle"] = "Shows Privacy Info",["LayoutOrder"] = 4,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,
            ["ScriptFunction"] = function(self, Value) for _,v in Players:GetPlayers() do if v ~= LocalPlayer then HandlePrivacySettings(v) end end end
        },
        ["HideInjury"] = {
            ["DisplayTitle"] = "Hide Injured UI/Effects",["LayoutOrder"] = 5,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = true,
            ["ScriptFunction"] = function(self, Value)
                if PlayerGui:FindFirstChild("TemporaryUI") then
                    for _,v in PlayerGui:FindFirstChild("TemporaryUI"):QueryDescendants("#redFlash,#injuredVignette") do v.Visible = not Value end
                end
                if Lighting:FindFirstChild("HealthDesaturation") then Lighting:FindFirstChild("HealthDesaturation").Enabled = not Value end
            end
        },
        ["DeleteRagdolls"] = {
            ["DisplayTitle"] = "Delete All Ragdolls",["LayoutOrder"] = 6,["Savable"] = true,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,
            ["ScriptFunction"] = function(self, Value) if workspace:FindFirstChild("Ragdolls") and Value then workspace:FindFirstChild("Ragdolls"):ClearAllChildren() end end
        },
        ["PlayerSelectCrash"] = {["DisplayTitle"] = "Player to crash",["LayoutOrder"] = 8,["Savable"] = false,["InstanceType"] = "StringValue",["DefaultInstanceValue"] = "None",["ExtraData"] = {["Options"] = "None"},["ScriptFunction"] = function() end},
        ["CrashTheTarget"] = {
            ["DisplayTitle"] = "Crash Target",["LayoutOrder"] = 9,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,
            ["ScriptFunction"] = function(self, Value)
                if Value then
                    if self.Instance then self.Instance.Value = false end
                    local PlayerName = FeatureLoadout["Miscellaneous"]["PlayerSelectCrash"]["Instance"].Value
                    if PlayerName == "Everyone" or PlayerName == "Both" then
                        for _,Player in Players:GetPlayers() do
                            if Player ~= LocalPlayer then
                                local Name = Player.Name
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
            ["DisplayTitle"] = "Sky Glitch",["LayoutOrder"] = 10,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,
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
            ["DisplayTitle"] = "Instant Kill",["LayoutOrder"] = 11,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,
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
        ["Rejoin"] = {
            ["DisplayTitle"] = "Rejoin",["LayoutOrder"] = 15,["Savable"] = false,["InstanceType"] = "BoolValue",["DefaultInstanceValue"] = false,
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

-- Functions
function ColoredPrint(Text, Icon, Color) print("[ForsakenPlus] " .. tostring(Text)) end
function PlaySound(SoundName,Settings,KeepPlaying)
    local Sound = typeof(SoundName) == "string" and game:GetService("ReplicatedStorage").Assets.Sounds:FindFirstChild(SoundName,true) or (typeof(SoundName) == "Instance" and SoundName) or nil
    if Sound then
        task.spawn(function()
            Sound = Sound:Clone()
            Sound.Parent = workspace:FindFirstChild("Sounds") or workspace
            if type(Settings) == "table" then for i,v in Settings do Sound[i] = v end end
            if KeepPlaying then Sound.Playing = true else Sound:Play() end
            Debris:AddItem(Sound, Sound.TimeLength + 1)
        end)
    end
end
function GetValue(FeatureName)
    local FeatureInstance = PlusFolderSettings:FindFirstChild(FeatureName,true)
    if FeatureInstance then return FeatureInstance.Value,FeatureInstance end
    return nil
end
local function GetFunction(...)
    for _,v in table.pack(...) do if v and typeof(v) == "function" then return v end end
    return nil
end

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
    for _,v in Players:GetPlayers() do if v ~= LocalPlayer then OriginString = OriginString .. "|" .. v.Name end end
    if #Players:GetPlayers() == 3 then OriginString = OriginString .. "|Both"
    elseif #Players:GetPlayers() > 3 then OriginString = OriginString .. "|Everyone" end
    if FeatureLoadout["Miscellaneous"]["PlayerSelectCrash"]["Instance"] then FeatureLoadout["Miscellaneous"]["PlayerSelectCrash"]["Instance"]:SetAttribute("Options", OriginString) end
end

function HandlePrivacySettings(Player)
    if Player and Player:FindFirstChild("PlayerData") and Player.PlayerData:FindFirstChild("Privacy",true) then
        for _,v in Player.PlayerData:FindFirstChild("Privacy",true):GetChildren() do
            if not v:GetAttribute("OriginalValue") and v:IsA("BoolValue") then
                v:SetAttribute("OriginalValue", v.Value)
                v:GetPropertyChangedSignal("Value"):Connect(function()
                    if FeatureLoadout["Miscellaneous"]["ShowPrivacy"]["Instance"] and FeatureLoadout["Miscellaneous"]["ShowPrivacy"]["Instance"].Value then v.Value = false
                    else v.Value = v:GetAttribute("OriginalValue") end
                end)
            end
            if v:IsA("BoolValue") then
                if FeatureLoadout["Miscellaneous"]["ShowPrivacy"]["Instance"] and FeatureLoadout["Miscellaneous"]["ShowPrivacy"]["Instance"].Value then v.Value = false
                else v.Value = v:GetAttribute("OriginalValue") end
            end
        end
    end
end

function HandleAllowJumping(Value)
    if LocalHumanoid and not LocalHumanoid:GetAttribute("JumpingConnection") then
        if Value then
            if not LocalHumanoid:GetAttribute("JumpingConnection") then LocalHumanoid:SetAttribute("JumpingConnection",LocalHumanoid.JumpPower) else return end
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
        for _,v in workspace.Players.Killers:GetChildren() do
            if v.Name:lower() == "noli" and not Players:GetPlayerFromCharacter(v) then
                v.Parent = Lighting
                v:PivotTo(v:GetPivot() * CFrame.new(0,-100,0))
            end
        end
    else
        for _,v in Lighting:GetChildren() do
            if v.Name:lower() == "noli" then
                v.Parent = InGame
                v:PivotTo(v:GetPivot() * CFrame.new(0,100,0))
            end
        end
    end
end

function Handle007n7NPC(Value)
    if Value then
        for _,v in InGame:GetChildren() do
            if v.Name:lower() == "007n7" and not Players:GetPlayerFromCharacter(v) then
                v.Parent = Lighting
                if v:FindFirstChild("HumanoidRootPart") then
                    v:FindFirstChild("HumanoidRootPart").ChildAdded:Connect(function(Child) if Child:IsA("Sound") and GetValue("Disable007n7NPC") then Child:Destroy() end end)
                end
            end
        end
    else
        for _,v in Lighting:GetChildren() do if v.Name:lower() == "007n7" then v.Parent = InGame end end
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

function GoUnder(Value)
    local Offset = 15
    if Value == nil then IsUnderground = false Value = GetValue("Invincible") end
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
            return
        end
        task.wait(0.1)
        LocalHumanoid.CameraOffset = Vector3.new(0, 0, 0)
    else IsUnderground = false end
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
    for _,v in AllAnimations do
        for animtype,animId in v do
            if type(animId) == "table" then
                for _,v2 in animId do if type(v2) == "string" and v2:find(tostring(ID)) then return animtype,_ end end
            else
                if type(animId) == "string" and animId:find(tostring(ID)) then return animtype,_ end
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
        if AnimType and CharName and (not IsOverridenTrack or SkipOverride) and AnimationName ~= "Original" then
            local AnimationString = AllAnimations[AnimationName] and AllAnimations[AnimationName][AnimType]
            local OverrideTrack,Animation = AddOverridenAnimation(AnimationString)
            if OverrideTrack and Animation then
                BindableShouldStop:Fire()
                OverrideTrack.Looped = Track.Looped
                OverrideTrack:Play(SkipOverride and 0 or 0.1)
                Track:Stop(0)
                if not IsOverridenTrack then LastTrack = Track end
                BindableShouldStop.Event:Once(function()
                    local AnimationPreset = GetValue("AnimationChanger")
                    if AnimationPreset == "Original" then OverrideTrack:Stop() LastTrack:Play() else OverrideTrack:Stop() end
                end)
            end
        end
    end
end

local readfile = GetFunction(readfile, read_file)
local writefile = GetFunction(writefile, write_file)
local isfolder = GetFunction(isfolder, is_folder)
local isfile = GetFunction(isfile, is_file)
local makefolder = GetFunction(makefolder, make_folder)
if not (readfile and writefile and isfolder and isfile) then
    FeatureLoadout["ExploitFunctions"]["files"]["DefaultInstanceValue"] = false
else
    if not isfolder("NaikoScript") then makefolder("NaikoScript") makefolder("NaikoScript/ForsakenPlus") end
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
        LocalRoot:GetPropertyChangedSignal("Anchored"):Connect(function() if not LocalRoot.Anchored then task.delay(0.5,GoUnder) end end)
        LocalRoot.ChildAdded:Connect(function(Child)
            if Child:IsA("LinearVelocity") and LocalHumanoid then
                local OriginalVelocity = Child.LineDirection
                local OriginalVelocityMag = Child.LineDirection.Magnitude
                for _,v in SpeedMultipliers:GetChildren() do if v.Name == "HinderedMovement" and GetValue("ControllableDash") and v.Value == 0 then v.Value = 0.005 end end
                local function UpdateVelocity()
                    if GetValue("ControllableDash") then Child.LineDirection = LocalHumanoid.MoveDirection * OriginalVelocityMag else Child.LineDirection = OriginalVelocity end
                end
                UpdateVelocity()
                LocalHumanoid:GetPropertyChangedSignal("MoveDirection"):Connect(UpdateVelocity)
            end
        end)
    end)
end

local getgc = GetFunction(getgc, get_gc)
if getgc then
    task.spawn(function()
        for _,Object in getgc() do
            if type(Object) == "table" and rawget(Object, "Stamina") and rawget(Object, "StaminaChanged") then MainModule = Object break end
        end
    end)
end

Players.PlayerAdded:Connect(function(Player) task.wait(2) HandlePrivacySettings(Player) end)
Players.PlayerAdded:Connect(UpdatePlayerCrashDrop)
Players.PlayerRemoving:Connect(UpdatePlayerCrashDrop)
LocalPlayer.CharacterAdded:Connect(ActionOnCharacter)
ActionOnCharacter(LocalCharacter or LocalPlayer.Character)
task.delay(0.5,UpdatePlayerCrashDrop)

-- ==========================================
-- PRADAXCA CUSTOM UI FRAMEWORK (SMALLER & COMPACT)
-- ==========================================
local UIConfig = {
    ToggleIcon = "rbxassetid://114704837418228",
    BackgroundId = "rbxassetid://92266968408887",
    CurrentLang = "EN"
}

local Lang = {
    ["EN"] = { Automation = "Automation", Features = "Features", Visuals = "Visuals", Misc = "Miscellaneous", Settings = "Settings", Information = "Information", Title = "Forsaken Plus", LangToggle = "Lang: EN" },
    ["CN"] = { Automation = "自动化", Features = "功能", Visuals = "视觉", Misc = "杂项", Settings = "设置", Information = "信息", Title = "被遗忘者 Plus", LangToggle = "语言: CN" }
}

if CoreGui:FindFirstChild("PradaxcaUI") then CoreGui.PradaxcaUI:Destroy() end

local PradaxcaUI = Instance.new("ScreenGui")
PradaxcaUI.Name = "PradaxcaUI"
PradaxcaUI.Parent = CoreGui
PradaxcaUI.ResetOnSpawn = false

-- 1. Custom ESP Drawing Logic (ScreenGui Base to prevent Executor crashes)
local ESPScreen = Instance.new("ScreenGui", CoreGui)
ESPScreen.Name = "PradaxcaESP"
ESPScreen.IgnoreGuiInset = true
local ESPObjects = {}

local function DrawLineGui(frame, p1, p2, color)
    local center = (p1 + p2) / 2
    local distance = (p2 - p1).Magnitude
    local angle = math.atan2(p2.Y - p1.Y, p2.X - p1.X)
    frame.Position = UDim2.new(0, center.X, 0, center.Y)
    frame.Size = UDim2.new(0, distance, 0, 1.5)
    frame.Rotation = math.deg(angle)
    frame.BackgroundColor3 = color
    frame.Visible = true
end

RunService.RenderStepped:Connect(function()
    local espEnabled = GetValue("ESP")
    local boxEnabled = GetValue("ESPBox")
    local lineEnabled = GetValue("ESPLine")
    local nameEnabled = GetValue("ESPName")
    local cam = workspace.CurrentCamera

    for _, v in pairs(workspace.Players:QueryDescendants("#Killers > Instance, #Survivors > Instance")) do
        if v:IsA("Model") and v ~= LocalPlayer.Character and Players:GetPlayerFromCharacter(v) ~= nil then
            local isKiller = v.Parent.Name == "Killers"
            local espToggle = GetValue(v.Parent.Name .. "ESP")
            
            if espEnabled and espToggle and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Head") then
                local root = v.HumanoidRootPart
                local head = v.Head
                local colorStr = GetValue(v.Parent.Name .. "Color")
                local color = ColorPresets[colorStr] or Color3.new(1,1,1)
                
                local rootPos, onScreen = cam:WorldToViewportPoint(root.Position)
                local headPos = cam:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
                local legPos = cam:WorldToViewportPoint(root.Position - Vector3.new(0, 3, 0))

                if not ESPObjects[v] then
                    ESPObjects[v] = {}
                    local box = Instance.new("Frame", ESPScreen) box.BackgroundTransparency = 1
                    local stroke = Instance.new("UIStroke", box) stroke.Thickness = 1.5 stroke.Color = Color3.new(1,1,1)
                    local line = Instance.new("Frame", ESPScreen) line.BorderSizePixel = 0 line.AnchorPoint = Vector2.new(0.5, 0.5)
                    local txt = Instance.new("TextLabel", ESPScreen) txt.BackgroundTransparency = 1 txt.Font = Enum.Font.GothamBold txt.TextSize = 13 txt.TextStrokeTransparency = 0 txt.TextColor3 = Color3.new(1,1,1)
                    ESPObjects[v] = {Box = box, Stroke = stroke, Line = line, Name = txt}
                end

                local d = ESPObjects[v]

                if onScreen then
                    local height = math.abs(headPos.Y - legPos.Y)
                    local width = height * 0.55

                    if boxEnabled then
                        d.Box.Visible = true
                        d.Box.Size = UDim2.new(0, width, 0, height)
                        d.Box.Position = UDim2.new(0, rootPos.X - width/2, 0, headPos.Y)
                        d.Stroke.Color = color
                    else d.Box.Visible = false end

                    if lineEnabled then
                        DrawLineGui(d.Line, Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y), Vector2.new(rootPos.X, legPos.Y), color)
                    else d.Line.Visible = false end

                    if nameEnabled then
                        d.Name.Visible = true
                        local dist = math.floor((cam.CFrame.Position - root.Position).Magnitude)
                        d.Name.Text = string.format("[%s] %s [%dm]", isKiller and "KILLER" or "PLAYER", v.Name, dist)
                        d.Name.Position = UDim2.new(0, rootPos.X - 50, 0, headPos.Y - 25)
                        d.Name.Size = UDim2.new(0, 100, 0, 20)
                        d.Name.TextColor3 = color
                    else d.Name.Visible = false end
                else
                    d.Box.Visible = false d.Line.Visible = false d.Name.Visible = false
                end
            elseif ESPObjects[v] then
                ESPObjects[v].Box:Destroy() ESPObjects[v].Line:Destroy() ESPObjects[v].Name:Destroy()
                ESPObjects[v] = nil
            end
        end
    end
end)

-- 2. UI Elements
local ToggleBtn = Instance.new("ImageButton", PradaxcaUI)
ToggleBtn.Image = UIConfig.ToggleIcon ToggleBtn.BackgroundTransparency = 1 
ToggleBtn.Size = UDim2.new(0, 45, 0, 45) ToggleBtn.Position = UDim2.new(0, 20, 0, 20)
ToggleBtn.Active = true ToggleBtn.Draggable = true

local MainFrame = Instance.new("Frame", PradaxcaUI)
MainFrame.Size = UDim2.new(0, 450, 0, 300) -- UI lebih kecil
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BackgroundTransparency = 0.45 MainFrame.ClipsDescendants = true
MainFrame.Visible = false MainFrame.Active = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)
local UIStroke = Instance.new("UIStroke", MainFrame) UIStroke.Color = Color3.fromRGB(255, 255, 255) UIStroke.Transparency = 0.8

local BgImage = Instance.new("ImageLabel", MainFrame)
BgImage.Size = UDim2.new(1, 0, 1, 0) BgImage.Image = UIConfig.BackgroundId
BgImage.BackgroundTransparency = 1 BgImage.ImageTransparency = 0.6 BgImage.ScaleType = Enum.ScaleType.Crop BgImage.ZIndex = 0

local dragging, dragInput, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true dragStart = input.Position startPos = MainFrame.Position end
end)
MainFrame.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)

-- Resize Button Kanan Bawah
local ResizeBtn = Instance.new("TextButton", MainFrame)
ResizeBtn.Size = UDim2.new(0, 20, 0, 20)
ResizeBtn.Position = UDim2.new(1, -20, 1, -20)
ResizeBtn.BackgroundTransparency = 1
ResizeBtn.Text = "⌟" ResizeBtn.TextColor3 = Color3.fromRGB(255,255,255) ResizeBtn.TextSize = 25
local resizing = false
ResizeBtn.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then resizing = true end end)
UserInputService.InputChanged:Connect(function(input)
    if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
        local mousePos = UserInputService:GetMouseLocation()
        local newX = math.clamp(mousePos.X - MainFrame.AbsolutePosition.X, 350, 800)
        local newY = math.clamp(mousePos.Y - MainFrame.AbsolutePosition.Y - 36, 200, 600)
        MainFrame.Size = UDim2.new(0, newX, 0, newY)
    end
end)
UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then resizing = false end end)

ToggleBtn.MouseButton1Click:Connect(function()
    if MainFrame.Visible then
        TweenService:Create(MainFrame, TweenInfo.new(0.2), {Size = UDim2.new(0, 0, 0, 0)}):Play()
        task.wait(0.2) MainFrame.Visible = false
    else
        MainFrame.Visible = true MainFrame.Size = UDim2.new(0, 0, 0, 0)
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 450, 0, 300)}):Play()
    end
end)

local TopBar = Instance.new("Frame", MainFrame) TopBar.Size = UDim2.new(1, 0, 0, 35) TopBar.BackgroundTransparency = 1
local Title = Instance.new("TextLabel", TopBar) Title.Size = UDim2.new(1, -20, 1, 0) Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1 Title.Text = Lang[UIConfig.CurrentLang].Title Title.TextColor3 = Color3.fromRGB(255, 255, 255) Title.Font = Enum.Font.GothamBold Title.TextSize = 16 Title.TextXAlignment = Enum.TextXAlignment.Left

local TabContainer = Instance.new("ScrollingFrame", MainFrame) TabContainer.Size = UDim2.new(0, 110, 1, -35) TabContainer.Position = UDim2.new(0, 0, 0, 35) TabContainer.BackgroundTransparency = 1 TabContainer.ScrollBarThickness = 0
Instance.new("UIListLayout", TabContainer).Padding = UDim.new(0, 3)

local ContentContainer = Instance.new("Frame", MainFrame) ContentContainer.Size = UDim2.new(1, -120, 1, -45) ContentContainer.Position = UDim2.new(0, 110, 0, 35) ContentContainer.BackgroundTransparency = 1

local Tabs = {}
local CurrentTab = nil

local function SwitchTab(tabFrame)
    if CurrentTab then CurrentTab.Visible = false end
    tabFrame.Visible = true CurrentTab = tabFrame
end

local function CreateTab(nameKey)
    local btn = Instance.new("TextButton", TabContainer)
    btn.Text = Lang[UIConfig.CurrentLang][nameKey] btn.Size = UDim2.new(1, -10, 0, 30) btn.Position = UDim2.new(0, 5, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255) btn.BackgroundTransparency = 0.9 btn.TextColor3 = Color3.fromRGB(200, 200, 200) btn.Font = Enum.Font.GothamSemibold btn.TextSize = 12
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
    local innerScroll = Instance.new("ScrollingFrame", ContentContainer) innerScroll.Size = UDim2.new(1, 0, 1, 0) innerScroll.BackgroundTransparency = 1 innerScroll.ScrollBarThickness = 2 innerScroll.Visible = false
    local contentLayout = Instance.new("UIListLayout", innerScroll) contentLayout.SortOrder = Enum.SortOrder.LayoutOrder contentLayout.Padding = UDim.new(0, 5)
    btn.MouseButton1Click:Connect(function() SwitchTab(innerScroll) end)
    Tabs[nameKey] = {Btn = btn, Scroll = innerScroll, Key = nameKey}
    return innerScroll
end

local TabAuto = CreateTab("Automation") local TabFeat = CreateTab("Features") local TabVis = CreateTab("Visuals") local TabMisc = CreateTab("Misc") local TabSet = CreateTab("Settings") local TabInfo = CreateTab("Information")

local function CreateToggle(parent, title, instanceVal, func)
    local frame = Instance.new("Frame", parent) frame.Size = UDim2.new(1, -10, 0, 30) frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) frame.BackgroundTransparency = 0.9 Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 4)
    local lbl = Instance.new("TextLabel", frame) lbl.Size = UDim2.new(1, -50, 1, 0) lbl.Position = UDim2.new(0, 10, 0, 0) lbl.BackgroundTransparency = 1 lbl.TextColor3 = Color3.fromRGB(255, 255, 255) lbl.Font = Enum.Font.Gotham lbl.TextSize = 12 lbl.TextXAlignment = Enum.TextXAlignment.Left lbl.Text = title
    local btn = Instance.new("TextButton", frame) btn.Size = UDim2.new(0, 30, 0, 16) btn.Position = UDim2.new(1, -40, 0.5, -8) btn.BackgroundColor3 = instanceVal.Value and Color3.fromRGB(0, 170, 127) or Color3.fromRGB(80, 80, 80) btn.Text = "" Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)
    local circle = Instance.new("Frame", btn) circle.Size = UDim2.new(0, 12, 0, 12) circle.Position = instanceVal.Value and UDim2.new(1, -14, 0.5, -6) or UDim2.new(0, 2, 0.5, -6) circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255) Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)
    btn.MouseButton1Click:Connect(function()
        instanceVal.Value = not instanceVal.Value
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = instanceVal.Value and Color3.fromRGB(0, 170, 127) or Color3.fromRGB(80, 80, 80)}):Play()
        TweenService:Create(circle, TweenInfo.new(0.2), {Position = instanceVal.Value and UDim2.new(1, -14, 0.5, -6) or UDim2.new(0, 2, 0.5, -6)}):Play()
        if func then func(FeatureLoadout, instanceVal.Value) end
    end)
end

local function CreateSlider(parent, title, instanceVal, min, max, func)
    local frame = Instance.new("Frame", parent) frame.Size = UDim2.new(1, -10, 0, 45) frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) frame.BackgroundTransparency = 0.9 Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 4)
    local lbl = Instance.new("TextLabel", frame) lbl.Size = UDim2.new(1, -10, 0, 20) lbl.Position = UDim2.new(0, 10, 0, 2) lbl.BackgroundTransparency = 1 lbl.TextColor3 = Color3.fromRGB(255, 255, 255) lbl.Font = Enum.Font.Gotham lbl.TextSize = 12 lbl.TextXAlignment = Enum.TextXAlignment.Left lbl.Text = title .. " : " .. tostring(instanceVal.Value)
    local sliderBg = Instance.new("Frame", frame) sliderBg.Size = UDim2.new(1, -20, 0, 6) sliderBg.Position = UDim2.new(0, 10, 0, 30) sliderBg.BackgroundColor3 = Color3.fromRGB(80, 80, 80) Instance.new("UICorner", sliderBg).CornerRadius = UDim.new(1, 0)
    local sliderFill = Instance.new("Frame", sliderBg) local percent = (instanceVal.Value - min) / (max - min) sliderFill.Size = UDim2.new(percent, 0, 1, 0) sliderFill.BackgroundColor3 = Color3.fromRGB(0, 170, 127) Instance.new("UICorner", sliderFill).CornerRadius = UDim.new(1, 0)
    local btn = Instance.new("TextButton", sliderBg) btn.Size = UDim2.new(1, 0, 1, 0) btn.BackgroundTransparency = 1 btn.Text = ""
    local dragging = false
    btn.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end end)
    UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local rel = math.clamp((UserInputService:GetMouseLocation().X - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1)
            sliderFill.Size = UDim2.new(rel, 0, 1, 0)
            local val = math.floor(min + (max - min) * rel) instanceVal.Value = val lbl.Text = title .. " : " .. tostring(val)
            if title:lower():find("fov") or title:lower():find("pov") then workspace.CurrentCamera.FieldOfView = val end
            if func then func(FeatureLoadout, val) end
        end
    end)
end

local function CreateDropdown(parent, title, instanceVal, optionsString, func)
    local frame = Instance.new("Frame", parent) frame.Size = UDim2.new(1, -10, 0, 30) frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) frame.BackgroundTransparency = 0.9 Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 4)
    local lbl = Instance.new("TextLabel", frame) lbl.Size = UDim2.new(1, -80, 1, 0) lbl.Position = UDim2.new(0, 10, 0, 0) lbl.BackgroundTransparency = 1 lbl.TextColor3 = Color3.fromRGB(255, 255, 255) lbl.Font = Enum.Font.Gotham lbl.TextSize = 12 lbl.TextXAlignment = Enum.TextXAlignment.Left lbl.Text = title .. ": " .. tostring(instanceVal.Value)
    local dropBtn = Instance.new("TextButton", frame) dropBtn.Size = UDim2.new(0, 70, 0, 20) dropBtn.Position = UDim2.new(1, -75, 0.5, -10) dropBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50) dropBtn.TextColor3 = Color3.fromRGB(255, 255, 255) dropBtn.Text = "Select ▼" dropBtn.TextSize = 11 Instance.new("UICorner", dropBtn).CornerRadius = UDim.new(0, 4)
    local listFrame = Instance.new("ScrollingFrame", parent) listFrame.Size = UDim2.new(1, -10, 0, 80) listFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) listFrame.BackgroundTransparency = 0.5 listFrame.Visible = false listFrame.ScrollBarThickness = 2 Instance.new("UICorner", listFrame).CornerRadius = UDim.new(0, 4)
    Instance.new("UIListLayout", listFrame).SortOrder = Enum.SortOrder.LayoutOrder
    for _, opt in ipairs(string.split(optionsString, "|")) do
        local optBtn = Instance.new("TextButton", listFrame) optBtn.Size = UDim2.new(1, 0, 0, 20) optBtn.BackgroundTransparency = 1 optBtn.TextColor3 = Color3.fromRGB(200, 200, 200) optBtn.Text = opt optBtn.Font = Enum.Font.Gotham optBtn.TextSize = 11
        optBtn.MouseButton1Click:Connect(function() instanceVal.Value = opt lbl.Text = title .. ": " .. tostring(opt) listFrame.Visible = false if func then func(FeatureLoadout, opt) end end)
    end
    dropBtn.MouseButton1Click:Connect(function() listFrame.Visible = not listFrame.Visible end)
end

-- Initialize Settings mapping to UI (ALL DEFAULT OFF)
PlusFolderSettings.Name = "Plus" PlusFolderSettings.Parent = PlayerData
for TabName, TabContents in pairs(FeatureLoadout) do
    if TabName == "ExploitFunctions" then continue end
    local targetTab
    if TabName == "Automation" then targetTab = TabAuto elseif TabName == "Features" then targetTab = TabFeat elseif TabName == "Visuals" then targetTab = TabVis elseif TabName == "Miscellaneous" then targetTab = TabMisc end
    local Folder = Instance.new("Folder", PlusFolderSettings) Folder.Name = TabName
    for SettingName, SettingData in pairs(TabContents) do
        if type(SettingData) ~= "table" or SettingName == "TabAttributes" then continue end
        local NewInstance = Instance.new(SettingData.InstanceType) NewInstance.Name = SettingName
        NewInstance.Value = SettingData.DefaultInstanceValue -- Defaults di paksa False semua
        NewInstance.Parent = Folder FeatureLoadout[TabName][SettingName]["Instance"] = NewInstance
        NewInstance:GetPropertyChangedSignal("Value"):Connect(function() if SettingData.ScriptFunction then SettingData.ScriptFunction(FeatureLoadout[TabName][SettingName], NewInstance.Value) end end)
        if targetTab then
            local cleanTitle = SettingData.DisplayTitle:gsub("<[^>]+>", "")
            if SettingData.InstanceType == "BoolValue" then CreateToggle(targetTab, cleanTitle, NewInstance, SettingData.ScriptFunction)
            elseif SettingData.InstanceType == "NumberValue" then local min = SettingData.ExtraData and SettingData.ExtraData.MinValue or 0 local max = SettingData.ExtraData and SettingData.ExtraData.MaxValue or 100 CreateSlider(targetTab, cleanTitle, NewInstance, min, max, SettingData.ScriptFunction)
            elseif SettingData.InstanceType == "StringValue" and SettingData.ExtraData and SettingData.ExtraData.Options then CreateDropdown(targetTab, cleanTitle, NewInstance, SettingData.ExtraData.Options, SettingData.ScriptFunction) end
        end
    end
end
SwitchTab(Tabs["Automation"].Scroll)
ColoredPrint("Forsaken Plus UI V2 (Smaller + Custom ESP) loaded gracefully.","success",Color3.fromRGB(0, 200, 125))
