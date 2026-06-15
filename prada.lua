-- Pradaxca Plus Standalone UI --
-- FULL TEXTURE, DRAGGABLE, RESIZABLE, EN/ZH & FULL LOGIC EDITION --

if workspace.DistributedGameTime < 3 then
	task.wait(3 - workspace.DistributedGameTime)
end

local StarterGui = game:GetService("StarterGui")
local isCorrectGame = (game.GameId == 6331902150 or game.GameId == 7464167604 or workspace:GetAttribute("ServerType") ~= nil)

if not isCorrectGame then
    pcall(function()
        StarterGui:SetCore("SendNotification", {Title = "Pradaxca Plus", Text = "Failed! This script is for Forsaken.", Duration = 5})
    end)
	return warn("Incorrect game")
end

local targetGui = game:GetService("CoreGui")
pcall(function() if gethui then targetGui = gethui() end end)

if targetGui:FindFirstChild("ForsakenPlusUI_Pradaxca") then
    return warn("Script already running")
else
	Instance.new("BoolValue", targetGui).Name = "ForsakenPlusUI_Pradaxca"
end

game:GetService("Players").LocalPlayer.Idled:Connect(function()
	game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

-- General Variables --
local Version = "1.6"
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local LocalCharacter = LocalPlayer.Character
local LocalHumanoid = LocalCharacter and (LocalCharacter:FindFirstChildOfClass("Humanoid") or LocalCharacter:WaitForChild("Humanoid",2)) or nil
local LocalHead = LocalCharacter and (LocalCharacter:FindFirstChild("Head") or LocalCharacter:WaitForChild("Head",2)) or nil
local LocalRoot = LocalCharacter and ((LocalHumanoid and LocalHumanoid.RootPart) or LocalCharacter:FindFirstChild("HumanoidRootPart") or LocalCharacter:WaitForChild("HumanoidRootPart",2)) or nil
local SpeedMultipliers = LocalCharacter and (LocalCharacter:FindFirstChild("SpeedMultipliers")) or nil
local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui", 20)
local PlayerData = LocalPlayer:FindFirstChild("PlayerData") or LocalPlayer:WaitForChild("PlayerData", 20)
local PlusFolderSettings = Instance.new("Folder")
local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TextChatService = game:GetService("TextChatService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Debris = game:GetService("Debris")
local Network = ReplicatedStorage:FindFirstChild("Modules") and (ReplicatedStorage:FindFirstChild("Modules"):FindFirstChild("Network",true) and ReplicatedStorage:FindFirstChild("Modules"):FindFirstChild("Network",true):FindFirstChild("Network")) or ReplicatedStorage:FindFirstChild("Modules"):FindFirstChild("Network",true) or nil
local InGame = workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("Ingame")
local GameMap = InGame and InGame:FindFirstChild("Map") or nil
local RoundEvent = Instance.new("BindableEvent")
local BindableShouldStop = Instance.new("BindableEvent")
local IsUnderground,IsFixingGenerator,WarnedAboutFilesCompatability = false,false,false
local PlaySound,MainModule,HandlePrivacySettings,Check,TableValueFind,ColoredPrint,Handle007n7NPC,HandleNoliNPC,ChangeTrackWithOverride,LastTrack,NoliConfig,IsHitboxNotNear,GoUnder,HandleAllowJumping,GetValue
local ColorPresets = {["White"] = Color3.fromRGB(255,255,255),["Teal"] = Color3.fromRGB(3,252,157),["Green"] = Color3.fromRGB(0,255,0),["Purple"] = Color3.fromRGB(128,0,128),["Red"] = Color3.fromRGB(255,0,0),["Blue"] = Color3.fromRGB(0,0,255),["Cyan"] = Color3.fromRGB(0,255,255),["Gold"] = Color3.fromRGB(255,215,0),["Orange"] = Color3.fromRGB(255,165,0)}
local GameVersionForScript = "2026-06-12"
local OverriddenAnimations = {}
local Worked,CurrentGameVersion = pcall(function() return MarketplaceService:GetProductInfoAsync(game.PlaceId,Enum.InfoType.Asset)["Updated"] end) ;
CurrentGameVersion = Worked and CurrentGameVersion or GameVersionForScript
local AllAnimations = {}
local FeatureLoadout;

-- Localization (Kamus Bahasa Lengkap) --
local Localization = {
    ["EN"] = {
        ["Settings"] = "Settings", ["Language"] = "Language", ["English"] = "English", ["Mandarin"] = "简体中文",
        ["Hacks"] = "Hacks", ["Automation"] = "Automation", ["Features"] = "Features", ["Visuals"] = "Visuals", ["Miscellaneous"] = "Misc", ["Information"] = "Information",
        ["language_setting_title"] = "Language", ["hookmetamethod_title"] = "HookMetaMethod", ["getgc_title"] = "GetGC", ["require_title"] = "Require", ["files_title"] = "Files", ["Computer_title"] = "Computer",
        ["AutoGeneratorPuzzle_title"] = "Auto Generators", ["AutoPickup_title"] = "Auto Pickup Items",
        ["Invincible_title"] = "God Mode (Ghost)", ["DisableKillerWalls_title"] = "Disable Red Walls", ["DisableToxicTrails_title"] = "Disable Toxic Trails", ["DisableFootprints_title"] = "Disable Footprints", ["SmallerSpikeCollisions_title"] = "Smaller Spike Collisions", ["EnableJumping_title"] = "Enable Jumping", ["StaminaPreset_title"] = "Stamina Hack", ["AntiSlowness_title"] = "Anti Slowness", ["AnimationChanger_title"] = "Animation Changer", ["NoliControl_title"] = "Better Void Rush", ["ControllableDash_title"] = "Controllable Dash",
        ["DisableNoliNPC_title"] = "Disable Noli NPC", ["Disable007n7NPC_title"] = "Disable 007n7 NPC", ["ESP_title"] = "Master ESP", ["KillersESP_title"] = "Killers ESP", ["KillersColor_title"] = "Killers Color", ["SurvivorsESP_title"] = "Survivors ESP", ["SurvivorsColor_title"] = "Survivors Color", ["GeneratorsESP_title"] = "Generators ESP", ["GeneratorsColor_title"] = "Generators Color", ["GeneratorsCheck_title"] = "Hide Completed Generators", ["ItemsESP_title"] = "Items ESP", ["ItemsColor_title"] = "Items Color", ["ESPName_title"] = "Name ESP", ["ESPBox_title"] = "2D Box ESP", ["ESPTracer_title"] = "Tracer ESP",
        ["ExtendedFOV_title"] = "FOV POV Hack", ["ExtendedZoom_title"] = "Extended Zoom", ["ShowChat_title"] = "Show Chat", ["ShowPrivacy_title"] = "Show Privacy Info", ["HideInjury_title"] = "Hide Injury Effects", ["DeleteRagdolls_title"] = "Delete Ragdolls", ["CrashTarget_title"] = "Crash Target", ["SkyGlitch_title"] = "Sky Glitch (Everyone)", ["InstantKill_title"] = "Instant Kill", ["Rejoin_title"] = "Rejoin",
        ["dev_info"] = "Developer: pradaxca", ["tele_info"] = "Telegram: @pradaxca", ["tiktok_info"] = "TikTok: @pradaxca", ["status_info"] = "Status: Free", ["start_notif"] = "Pradaxca Plus loaded in English!",
    },
    ["ZH"] = {
        ["Settings"] = "设置", ["Language"] = "语言", ["English"] = "English", ["Mandarin"] = "简体中文",
        ["Hacks"] = "漏洞利用", ["Automation"] = "自动化", ["Features"] = "特点", ["Visuals"] = "透视", ["Miscellaneous"] = "其他", ["Information"] = "信息",
        ["language_setting_title"] = "语言", ["hookmetamethod_title"] = "HookMetaMethod", ["getgc_title"] = "GetGC", ["require_title"] = "Require", ["files_title"] = "文件", ["Computer_title"] = "电脑模式",
        ["AutoGeneratorPuzzle_title"] = "自动发电机", ["AutoPickup_title"] = "自动拾取物品",
        ["Invincible_title"] = "无敌 (幽灵)", ["DisableKillerWalls_title"] = "禁用红墙", ["DisableToxicTrails_title"] = "禁用毒液轨迹", ["DisableFootprints_title"] = "禁用脚印", ["SmallerSpikeCollisions_title"] = "缩小尖刺碰撞", ["EnableJumping_title"] = "启用跳跃", ["StaminaPreset_title"] = "体力透支", ["AntiSlowness_title"] = "反减速", ["AnimationChanger_title"] = "动画修改器", ["NoliControl_title"] = "更好的虚空冲刺", ["ControllableDash_title"] = "可控冲刺",
        ["DisableNoliNPC_title"] = "禁用 Noli NPC", ["Disable007n7NPC_title"] = "禁用 007n7 NPC", ["ESP_title"] = "透视开关", ["KillersESP_title"] = "杀手透视", ["KillersColor_title"] = "杀手颜色", ["SurvivorsESP_title"] = "幸存者透视", ["SurvivorsColor_title"] = "幸存者颜色", ["GeneratorsESP_title"] = "发电机透视", ["GeneratorsColor_title"] = "发电机颜色", ["GeneratorsCheck_title"] = "隐藏已完成发电机", ["ItemsESP_title"] = "物品透视", ["ItemsColor_title"] = "物品颜色", ["ESPName_title"] = "名字透视", ["ESPBox_title"] = "2D 方框透视", ["ESPTracer_title"] = "射线透视",
        ["ExtendedFOV_title"] = "FOV POV 视野", ["ExtendedZoom_title"] = "扩展缩放", ["ShowChat_title"] = "显示聊天", ["ShowPrivacy_title"] = "显示隐私信息", ["HideInjury_title"] = "隐藏受伤效果", ["DeleteRagdolls_title"] = "删除布娃娃", ["CrashTarget_title"] = "崩溃目标", ["SkyGlitch_title"] = "天空闪烁 (所有人)", ["InstantKill_title"] = "秒杀", ["Rejoin_title"] = "重新加入",
        ["dev_info"] = "开发者: pradaxca", ["tele_info"] = "Telegram: @pradaxca", ["tiktok_info"] = "TikTok: @pradaxca", ["status_info"] = "状态: 免费", ["start_notif"] = "Pradaxca Plus 已加载简体中文!",
    }
}

local currentLang = "EN"
local function getTranslation(key) return Localization[currentLang][key] or key end

-- Database FeatureLoadout (SEMUA DEFAULT DIMATIKAN/FALSE SAAT STARTUP) --
FeatureLoadout = {
    ["Settings"] = {
        ["TabAttributes"] = { ["LayoutOrder"] = 0 },
        ["Language"] = {
            ["DisplayDescription"] = "Change UI Language", ["InstanceType"] = "StringValue", ["DefaultInstanceValue"] = "EN", ["Savable"] = true,
            ["ExtraData"] = { ["Options"] = "EN|ZH" },
            ["ScriptFunction"] = function(self, Value) currentLang = Value updateLocalization() end
        },
    },
    ["Hacks"] = {
        ["TabAttributes"] = { ["LayoutOrder"] = 1 },
        ["hookmetamethod"] = { ["DisplayDescription"] = "Required for bypasses", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = true, ["ExtraData"] = { ["Requirement"] = true }, ["ScriptFunction"] = function(self, State) end },
        ["getgc"] = { ["DisplayDescription"] = "Required for GC exploits", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = true, ["ExtraData"] = { ["Requirement"] = true }, ["ScriptFunction"] = function(self, State) end },
        ["require"] = { ["DisplayDescription"] = "Required to read internal scripts", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = true, ["ExtraData"] = { ["Requirement"] = true }, ["ScriptFunction"] = function(self, State) end },
        ["files"] = { ["DisplayDescription"] = "Required for saving configs", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = true, ["ExtraData"] = { ["Requirement"] = true }, ["ScriptFunction"] = function(self, State) end },
        ["Computer"] = { ["DisplayDescription"] = "Required for keyboard bypass", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = true, ["ExtraData"] = { ["Requirement"] = true }, ["ScriptFunction"] = function(self, State) end },
    },
    ["Automation"] = {
        ["TabAttributes"] = { ["LayoutOrder"] = 2 },
        ["AutoGeneratorPuzzle"] = { ["DisplayDescription"] = "Auto-completes generator puzzles", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["Savable"] = true, ["ScriptFunction"] = function(self, Value) end },
        ["AutoPickup"] = { ["DisplayDescription"] = "Automatically pick up items near you", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["Savable"] = true, ["ScriptFunction"] = function(self, Value) end },
    },
    ["Features"] = {
        ["TabAttributes"] = { ["LayoutOrder"] = 3 },
        ["Invincible"] = {
            ["DisplayDescription"] = "Makes you invisible & god mode", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["ExtraData"] = { ["Requirement"] = "hookmetamethod|require" },
            ["ScriptFunction"] = function(self, Value)
                 if workspace:GetAttribute("Invincible") == nil then
                    workspace:SetAttribute("Invincible", Value)
                    self.Instance.Value = Value
                    if Value then
                        FeatureLoadout["Features"]["DisableToxicTrails"].Instance.Value = true
                        FeatureLoadout["Features"]["DisableFootprints"].Instance.Value = true
                    end
                    task.delay(1.5, function() workspace:SetAttribute("Invincible",nil) end)
                    GoUnder(Value)
                else self.Instance.Value = workspace:GetAttribute("Invincible") end
            end
         },
        ["DisableKillerWalls"] = {
            ["DisplayDescription"] = "Walk through killer red walls", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["ExtraData"] = { ["Requirement"] = true },
            ["ScriptFunction"] = function(self, Value)
                local VertexColor = Value and Vector3.new(0,255,0) or Vector3.new(255,0,0)
                local Color = Value and Color3.new(0,1,0) or Color3.new(1,0,0)
                local KillerDoorsFolder = GameMap and (GameMap:FindFirstChild("KillerDoors",true) or GameMap:FindFirstChild("Killer Doors",true))
                local KillerCollisions = GameMap and GameMap:FindFirstChild("KillerOnly",true)
                if KillerDoorsFolder then
                    for i,v in pairs(KillerDoorsFolder:GetChildren()) do
                        v.Color = Color
                        if v:GetAttribute("OriginalCanCollide") == nil then v:SetAttribute("OriginalCanCollide", v.CanCollide) end
                        v.CanCollide = v:GetAttribute("OriginalCanCollide") ~= false and not Value or false
                        if KillerCollisions then
                            local Params = OverlapParams.new()
                            Params.FilterType = Enum.RaycastFilterType.Include
                            Params.CollisionGroup = "Killers"
                            Params.FilterDescendantsInstances = {KillerCollisions}
                            local Hitbox = workspace:GetPartBoundsInRadius(v.Position, 10, Params)
                            for i,h in pairs(Hitbox) do h.CanCollide = not Value end
                        end
                        if v:FindFirstChildOfClass("SpecialMesh") then v:FindFirstChildOfClass("SpecialMesh").VertexColor = VertexColor end
                    end
                end
            end
        },
        ["DisableToxicTrails"] = { ["DisplayDescription"] = "Disables damaging trails for John Doe", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["Savable"] = true, ["ScriptFunction"] = function(self, Value) for i,v in pairs(InGame:GetChildren()) do if v:IsA("Folder") and (v.Name):find("JohnDoeTrail") then for i,v2 in pairs(v:GetChildren()) do if v2:IsA("BasePart") then v2.CanTouch = not Value end end end end end },
        ["DisableFootprints"] = { ["DisplayDescription"] = "Disables footprints made by John Doe", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["Savable"] = true, ["ScriptFunction"] = function(self, Value) for i,v in pairs(InGame:GetChildren()) do if v:IsA("Folder") and (v.Name):find("Shadows") then for i,v2 in pairs(v:GetChildren()) do if v2:IsA("BasePart") then v2.CanTouch = not Value end end if not v:GetAttribute("Checked") then v:SetAttribute("Checked", true) v.ChildAdded:Connect(function(GrandChild) if GrandChild:IsA("BasePart") then GrandChild.CanTouch = not FeatureLoadout["Features"]["DisableFootprints"]["Instance"].Value end end) end end end end },
        ["SmallerSpikeCollisions"] = { ["DisplayDescription"] = "Makes spike collisions smaller", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["Savable"] = true, ["ScriptFunction"] = function(self, Value) for i,v in pairs(InGame:GetChildren()) do if v.Name == "SpikeCollision" then v.Size = Value and Vector3.new(10,3.25,3.25) or Vector3.new(11, 5, 5) v.Shape = Value and Enum.PartType.Cylinder or Enum.PartType.Block end end end },
        ["EnableJumping"] = { ["DisplayDescription"] = "Enables jumping when it's disabled", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["ScriptFunction"] = function(self, Value) HandleAllowJumping(Value) end },
        ["StaminaPreset"] = { ["DisplayDescription"] = "Modify your stamina limits", ["InstanceType"] = "StringValue", ["DefaultInstanceValue"] = "Original", ["Savable"] = true, ["ExtraData"] = { ["Requirement"] = "require", ["Options"] = "Original|Realistic|Semi-Realistic|Infinite" }, ["ScriptFunction"] = function(self, Value) end },
        ["AntiSlowness"] = { ["DisplayDescription"] = "Removes slowness effects", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["Savable"] = true, ["ScriptFunction"] = function(self, Value) if not Value or not SpeedMultipliers then return end for i,Child in pairs(SpeedMultipliers:GetChildren()) do Check(Child) end end },
        ["AnimationChanger"] = { ["DisplayDescription"] = "Override your animations", ["InstanceType"] = "StringValue", ["DefaultInstanceValue"] = "Original", ["ExtraData"] = { ["Requirement"] = "require", ["Options"] = "Original|Jason|Slasher|c00lkidd|John Doe|Noli|1x1x1x1|Nosferatu|Azure|!Herobrine|!Brimstone" }, ["ScriptFunction"] = function(self, Value) if Value == "Original" then BindableShouldStop:Fire() else local Animator = LocalHumanoid and LocalHumanoid:FindFirstChildOfClass("Animator") if ChangeTrackWithOverride then for i,v in pairs(Animator:GetPlayingAnimationTracks()) do ChangeTrackWithOverride(v,Value,true) end end end end },
        ["NoliControl"] = { ["DisplayDescription"] = "Better control of Void Rush", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["Savable"] = true, ["ExtraData"] = { ["Requirement"] = "require" }, ["ScriptFunction"] = function(self, Value) if NoliConfig then for _, Entry in pairs({ {Name = "InitialTurnDuration", Value = 0.005, Default = 1.5}, {Name = "TurnSpeed", Value = 10000, Default = 1}, {Name = "InitialTurnMult", Value = 1000, Default = 6.6}, }) do local Key, _, Parent = TableValueFind(NoliConfig, function(i, v) return type(i) == "string" and i:find(Entry.Name) and not i:find(Entry.Name .. "OG") end) if Key and Parent then if Value then Parent[Entry.Name .. "OG"] = Parent[Key] Parent[Key] = Entry.Value elseif Parent[Entry.Name .. "OG"] ~= nil then Parent[Key] = Parent[Entry.Name .. "OG"] or Entry.Default end end end if LocalCharacter and LocalCharacter.Parent.Name == "Killers" and not workspace:GetAttribute("NotifCD") then StarterGui:SetCore("SendNotification", { Title = "Information", Text = "Changes apply as killer", Duration = 5 }) workspace:SetAttribute("NotifCD", true) task.delay(10, function() workspace:SetAttribute("NotifCD", nil) end) end end end },
        ["ControllableDash"] = { ["DisplayDescription"] = "Control where dash goes", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["Savable"] = true, ["ScriptFunction"] = function(self, Value) end }
    },
    ["Visuals"] = {
        ["TabAttributes"] = { ["LayoutOrder"] = 4 },
        ["ESP"] = { ["DisplayDescription"] = "Master switch for ESP", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["Savable"] = true, ["ScriptFunction"] = function(self, Value) end },
        ["ESPName"] = { ["DisplayDescription"] = "Shows Player Names", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["Savable"] = true, ["ExtraData"] = { ["Requirement"] = "ESP" }, ["ScriptFunction"] = function(self, Value) end },
        ["ESPBox"] = { ["DisplayDescription"] = "Shows 2D Box on Players", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["Savable"] = true, ["ExtraData"] = { ["Requirement"] = "ESP" }, ["ScriptFunction"] = function(self, Value) end },
        ["ESPTracer"] = { ["DisplayDescription"] = "Draws line to Players", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["Savable"] = true, ["ExtraData"] = { ["Requirement"] = "ESP" }, ["ScriptFunction"] = function(self, Value) end },
        ["DisableNoliNPC"] = { ["DisplayDescription"] = "Removes distracting Noli NPC", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["Savable"] = true, ["ScriptFunction"] = function(self, Value) HandleNoliNPC(Value) end },
        ["Disable007n7NPC"] = { ["DisplayDescription"] = "Removes distracting 007n7 NPC", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["Savable"] = true, ["ScriptFunction"] = function(self, Value) Handle007n7NPC(Value) end },
        ["KillersESP"] = { ["DisplayDescription"] = "Highlight Killers", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["Savable"] = true, ["ExtraData"] = { ["Requirement"] = "ESP" }, ["ScriptFunction"] = function(self, Value) end },
        ["KillersColor"] = { ["DisplayDescription"] = "Color for Killers", ["InstanceType"] = "StringValue", ["DefaultInstanceValue"] = "Red", ["Savable"] = true, ["ExtraData"] = { ["Requirement"] = "ESP|KillersESP", ["Options"] = "Red|Orange|Purple|Gold" }, ["ScriptFunction"] = function(self, Value) end },
        ["SurvivorsESP"] = { ["DisplayDescription"] = "Highlight Survivors", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["Savable"] = true, ["ExtraData"] = { ["Requirement"] = "ESP" }, ["ScriptFunction"] = function(self, Value) end },
        ["SurvivorsColor"] = { ["DisplayDescription"] = "Color for Survivors", ["InstanceType"] = "StringValue", ["DefaultInstanceValue"] = "Green", ["Savable"] = true, ["ExtraData"] = { ["Requirement"] = "ESP|SurvivorsESP", ["Options"] = "Green|Orange|Purple|Gold" }, ["ScriptFunction"] = function(self, Value) end },
        ["GeneratorsESP"] = { ["DisplayDescription"] = "Highlight Generators", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["Savable"] = true, ["ExtraData"] = { ["Requirement"] = "ESP" }, ["ScriptFunction"] = function(self, Value) end },
        ["GeneratorsColor"] = { ["DisplayDescription"] = "Color for Generators", ["InstanceType"] = "StringValue", ["DefaultInstanceValue"] = "Cyan", ["Savable"] = true, ["ExtraData"] = { ["Requirement"] = "ESP|GeneratorsESP", ["Options"] = "Cyan|Blue|Green|Orange|Purple|Gold" }, ["ScriptFunction"] = function(self, Value) end },
        ["GeneratorsCheck"] = { ["DisplayDescription"] = "Hide fully repaired generators", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = true, ["Savable"] = true, ["ExtraData"] = { ["Requirement"] = "ESP|GeneratorsESP" }, ["ScriptFunction"] = function(self, Value) end },
        ["ItemsESP"] = { ["DisplayDescription"] = "Highlight Items", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["Savable"] = true, ["ExtraData"] = { ["Requirement"] = "ESP" }, ["ScriptFunction"] = function(self, Value) end },
        ["ItemsColor"] = { ["DisplayDescription"] = "Color for Items", ["InstanceType"] = "StringValue", ["DefaultInstanceValue"] = "Gold", ["Savable"] = true, ["ExtraData"] = { ["Requirement"] = "ESP|ItemsESP", ["Options"] = "Gold|Cyan|Purple|White" }, ["ScriptFunction"] = function(self, Value) end },
    },
    ["Miscellaneous"] = {
         ["TabAttributes"] = { ["LayoutOrder"] = 5 },
        ["ExtendedFOV"] = { ["DisplayDescription"] = "Extends Field of View", ["InstanceType"] = "NumberValue", ["DefaultInstanceValue"] = PlayerData.Settings.Game.FieldOfView.Value, ["Savable"] = true, ["ExtraData"] = { ["MaxValue"] = 120, ["MinValue"] = 10, ["Step"] = 5 }, ["ScriptFunction"] = function(self, Value) PlayerData.Settings.Game.FieldOfView.Value = Value end },
        ["ExtendedZoom"] = { ["DisplayDescription"] = "Extends Maximum Zoom Distance", ["InstanceType"] = "NumberValue", ["DefaultInstanceValue"] = 10, ["Savable"] = true, ["ExtraData"] = { ["MaxValue"] = 100, ["MinValue"] = 0, ["Step"] = 5 }, ["ScriptFunction"] = function(self, Value) LocalPlayer.CameraMaxZoomDistance = game:GetService("StarterPlayer").CameraMaxZoomDistance + (Value * 0.25) end },
        ["ShowChat"] = { ["DisplayDescription"] = "Shows chat while in round", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["Savable"] = true, ["ExtraData"] = { ["Requirement"] = not game:GetService("Chat"):CanUserChatAsync(LocalPlayer.UserId) and true or nil }, ["ScriptFunction"] = function(self, Value) if TextChatService:FindFirstChildOfClass("ChatWindowConfiguration") then TextChatService:FindFirstChildOfClass("ChatWindowConfiguration").Enabled = Value end end },
        ["ShowPrivacy"] = { ["DisplayDescription"] = "Reveal privacy info of others", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["Savable"] = true, ["ScriptFunction"] = function(self, Value) for i,v in pairs(Players:GetPlayers()) do if v ~= LocalPlayer then HandlePrivacySettings(v) end end end },
        ["HideInjury"] = { ["DisplayDescription"] = "Hide low health red screen", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = true, ["Savable"] = true, ["ScriptFunction"] = function(self, Value) for i,v in pairs(PlayerGui:FindFirstChild("TemporaryUI"):QueryDescendants("#redFlash,#injuredVignette")) do v.Visible = not Value end if game:GetService("Lighting"):FindFirstChild("HealthDesaturation") then game:GetService("Lighting"):FindFirstChild("HealthDesaturation").Enabled = not Value end end },
        ["DeleteRagdolls"] = { ["DisplayDescription"] = "Delete dead bodies for FPS", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["Savable"] = true, ["ScriptFunction"] = function(self, Value) if workspace:FindFirstChild("Ragdolls") and Value then workspace:FindFirstChild("Ragdolls"):ClearAllChildren() end end },
        ["CrashTarget"] = { ["DisplayDescription"] = "Crash target (Host Only)", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["ScriptFunction"] = function(self, Value) if Value then self.Instance.Value = false repeat Network:WaitForChild("RemoteEvent"):FireServer("ExecuteCommand", {"GiveStatus", "All", "Nausea", math.huge, 1}) task.wait(1.5) until false end end },
        ["SkyGlitch"] = { ["DisplayDescription"] = "Glitch sky (Host Only)", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["ScriptFunction"] = function(self, Value) if Value then self.Instance.Value = false Network:WaitForChild("RemoteEvent"):FireServer("ExecuteCommand", {"GiveStatus", "All", "Nausea", -1e11, 10}) end end },
         ["InstantKill"] = { ["DisplayDescription"] = "Instakill others (Host Only)", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["ScriptFunction"] = function(self, Value) if workspace:GetAttribute("InstaKill") == nil then workspace:SetAttribute("InstaKill", Value) self.Instance.Value = Value task.delay(1.5, function() workspace:SetAttribute("InstaKill",nil) end) if Value then repeat Network:WaitForChild("RemoteEvent"):FireServer("ExecuteCommand", {"GiveStatus", game.Players.LocalPlayer.Name, "Strength", 99999, 1}) task.wait(0.5) until not self.Instance.Value end else self.Instance.Value = workspace:GetAttribute("InstaKill") end end },
        ["Rejoin"] = { ["DisplayDescription"] = "Rejoin the server", ["InstanceType"] = "BoolValue", ["DefaultInstanceValue"] = false, ["ScriptFunction"] = function(self, Value) if Value then pcall(function() game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer) end) end end },
    },
    ["Information"] = { ["TabAttributes"] = { ["LayoutOrder"] = 6 } }
}

-- Database Init Sync Tanpa Bug Kosong --
PlusFolderSettings.Name = "Plus"
PlusFolderSettings.Parent = PlayerData

local function ReturnData(Path, WithFolder)
	if WithFolder == false then if isfile(Path) ~= false then return readfile(Path) end
	else if isfile("PradaxcaScript/ForsakenPlus/" .. Path) ~= false then return readfile("PradaxcaScript/ForsakenPlus/" .. Path) end return nil end
end

local function ChangeData(Path, Option, WithFolder)
	if WithFolder == false then if isfile(Path) ~= false then writefile(Path,Option) end
	else if isfile("PradaxcaScript/ForsakenPlus/" .. Path) ~= false then writefile("PradaxcaScript/ForsakenPlus/" .. Path, Option) end end
end

local TableData = {}
pcall(function()
    local decoded = HttpService:JSONDecode(ReturnData("Data.txt", true))
    if decoded and type(decoded) == "table" then TableData = decoded end
end)

for TabName, TabContents in pairs(FeatureLoadout) do
    local Folder = Instance.new("Folder")
    Folder.Name = TabName
    Folder.Parent = PlusFolderSettings
    if TabContents["TabAttributes"] then for Attribute, Value in pairs(TabContents["TabAttributes"]) do Folder:SetAttribute(Attribute, Value) end end
    
    for SettingName, SettingData in pairs(TabContents) do
        if SettingName ~= "TabAttributes" then
            local NewInstance = Instance.new(SettingData.InstanceType)
            NewInstance.Name = SettingName
            
            -- AMAN: SEMUA FITUR CHEAT DEFAULT MATI
            local isSystem = (TabName == "Hacks" or TabName == "Settings")
            local defaultVal = SettingData.DefaultInstanceValue
            if not isSystem and SettingData.InstanceType == "BoolValue" then
                defaultVal = false
            end
            
            NewInstance.Value = defaultVal
            
            if SettingData["Savable"] and FeatureLoadout["Hacks"]["files"]["DefaultInstanceValue"] then
                if TableData[SettingName] ~= nil and (not SettingData.ExtraData or SettingData.ExtraData.Requirement ~= true) then
                    NewInstance.Value = TableData[SettingName]
                end
                NewInstance:GetPropertyChangedSignal("Value"):Connect(function()
                    if NewInstance:GetAttribute("Requirement") == true then return end
                    local TableData2 = {}
                    pcall(function() TableData2 = HttpService:JSONDecode(ReturnData("Data.txt", true)) or {} end)
                    TableData2[SettingName] = SettingData.DefaultInstanceValue ~= NewInstance.Value and NewInstance.Value or nil
                    pcall(function() ChangeData("Data.txt", HttpService:JSONEncode(TableData2), true) end)
                end)
            end
            NewInstance:SetAttribute("LayoutOrder", SettingData.LayoutOrder or 99)
            NewInstance:SetAttribute("DisplayDescription", SettingData.DisplayDescription or "")
            if SettingData.ExtraData then for ExtraDataIndex, ExtraDataValue in pairs(SettingData.ExtraData) do NewInstance:SetAttribute(ExtraDataIndex, ExtraDataValue) end end
            
            FeatureLoadout[TabName][SettingName]["Instance"] = NewInstance
            NewInstance.Parent = Folder
        end
    end
end

function ColoredPrint(Text, Icon, Color)
    task.spawn(function()
        local UniqueID = string.sub(game:GetService("HttpService"):GenerateGUID(false), 1, 7)
        print("[Pradaxca Plus]: " .. tostring(Text) .. " | " .. UniqueID)
    end)
end

function PlaySound(SoundName,Settings,KeepPlaying)
    local Sound = typeof(SoundName) == "string" and game:GetService("ReplicatedStorage").Assets.Sounds:FindFirstChild(SoundName,true) or (typeof(SoundName) == "Instance" and SoundName) or nil
    if Sound then
        task.spawn(function()
            Sound = Sound:Clone()
            Sound.Parent = workspace:FindFirstChild("Sounds") or workspace
            if type(Settings) == "table" then for i,v in pairs(Settings) do Sound[i] = v end end
            if KeepPlaying then Sound.Playing = true else Sound:Play() end
            Debris:AddItem(Sound, Sound.TimeLength + 1)
            return Sound
        end)
    end
end

function GetValue(FeatureName)
    local FeatureInstance = PlusFolderSettings:FindFirstChild(FeatureName,true)
    if FeatureInstance then return FeatureInstance.Value,FeatureInstance end
    return nil
end

local function GetFunction(...)
    for i,v in pairs(table.pack(...)) do if v and typeof(v) == "function" then return v end end return nil
end

-- ESP LOGIC FUNCTIONS --
local function CheckDistance(Highlight, TargetRoot, Settings)
    if workspace.CurrentCamera and TargetRoot then
         local Distance = (workspace.CurrentCamera.CFrame.Position - TargetRoot.Position).Magnitude
        if Distance>1200 then Distance = 0 end
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
    elseif Highlight[1] then Highlight[1]:Destroy() end
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

    local boxESP = espFolder:FindFirstChild("BoxESP")
    if GetValue("ESPBox") then
        if not boxESP then
            boxESP = Instance.new("BillboardGui")
            boxESP.Name = "BoxESP"
            boxESP.Size = UDim2.new(4.5, 0, 6, 0)
            boxESP.AlwaysOnTop = true
            boxESP.Parent = espFolder
            boxESP.Adornee = Root
            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, 0, 1, 0)
            frame.BackgroundTransparency = 1
            frame.BorderSizePixel = 0
            frame.Parent = boxESP
            local stroke = Instance.new("UIStroke")
            stroke.Thickness = 2
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Parent = frame
        end
        boxESP.Frame.UIStroke.Color = Settings.Color
    else
        if boxESP then boxESP:Destroy() end
    end

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

-- Helper & Exploit Functions --
function HandlePrivacySettings(Player)
    if Player then
        local pData = Player:FindFirstChild("PlayerData")
        if pData then
           local PrivacySettings = pData:FindFirstChild("Privacy",true)
            if PrivacySettings then
                for i,v in pairs(PrivacySettings:GetChildren()) do
                    if not v:GetAttribute("OriginalValue") and v:IsA("BoolValue") then
                        v:SetAttribute("OriginalValue", v.Value)
                        v:GetPropertyChangedSignal("Value"):Connect(function()
                                 if GetValue("ShowPrivacy") then v.Value = false else v.Value = v:GetAttribute("OriginalValue") end
                        end)
                        if GetValue("ShowPrivacy") then v.Value = false else v.Value = v:GetAttribute("OriginalValue") end
                    elseif v:IsA("BoolValue") then
                        if GetValue("ShowPrivacy") then v.Value = false else v.Value = v:GetAttribute("OriginalValue") end
                    end
                 end
            end
        end
    end
end

function HandleAllowJumping(Value)
    if LocalHumanoid and not LocalHumanoid:GetAttribute("JumpingConnection") then
        if Value then
            if not LocalHumanoid:GetAttribute("JumpingConnection") then LocalHumanoid:SetAttribute("JumpingConnection",LocalHumanoid.JumpPower) else return end
            local Connection;Connection = LocalHumanoid.StateChanged:Connect(function(old,new)
                if LocalCharacter.Parent ~= "Spectator" and new == Enum.HumanoidStateType.Jumping or new == Enum.HumanoidStateType.Freefall and LocalHumanoid.JumpPower > 0 and (GetValue("EnableJumping") or false) then
                    if not(GetValue("EnableJumping")) then
                         Connection:Disconnect()
                        LocalHumanoid.JumpPower = LocalHumanoid:GetAttribute("JumpingConnection") or 0
                        LocalHumanoid:SetAttribute("JumpingConnection",nil)
                        return
                     end
                    task.spawn(function() task.wait(0.067) LocalHumanoid.JumpPower = 0 end)
                    task.wait(1.5)
                    if GetValue("EnableJumping") then LocalHumanoid.JumpPower = 47
                    else Connection:Disconnect() LocalHumanoid.JumpPower = LocalHumanoid:GetAttribute("JumpingConnection") or 0 LocalHumanoid:SetAttribute("JumpingConnection",nil) end
                 end
            end)
        end
        LocalHumanoid.JumpPower = Value and 47 or 0
    end
end

function HandleNoliNPC(Value)
    if Value then
        for i,v in pairs(workspace.Players.Killers:GetChildren()) do
            if v.Name:lower() == "noli" and not Players:GetPlayerFromCharacter(v) then v.Parent = Lighting v:PivotTo(v:GetPivot() * CFrame.new(0,-100,0)) end
        end
        if workspace:FindFirstChild("Themes") then
            for i,v in pairs(workspace.Themes:GetChildren()) do if v.Name:find("FakeLayer") and v:IsA("Sound") then v:Destroy() end end
        end
    else
        for i,v in pairs(Lighting:GetChildren()) do if v.Name:lower() == "noli" then v.Parent = InGame v:PivotTo(v:GetPivot() * CFrame.new(0,100,0)) end end
    end
end

function Handle007n7NPC(Value)
    if Value then
        for i,v in pairs(InGame:GetChildren()) do
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
        for i,v in pairs(Lighting:GetChildren()) do if v.Name:lower() == "007n7" then v.Parent = InGame end end
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
    else IsUnderground = false end
end

function Check(ValueInstance)
    if GetValue("AntiSlowness") then
        if ValueInstance then
            if ValueInstance.Name == "DirectionalMovement" or ValueInstance.Name == "FixingGenerator" then
                 if ValueInstance.Value < 1 then ValueInstance.Value = 1 end
            elseif ValueInstance.Value > 0.05 and ValueInstance.Value < 1 then ValueInstance:Destroy() end
         end
    end
end

function TableValueFind(Table, MatchFn, Seen)
    if type(Table) ~= "table" or type(MatchFn) ~= "function" then return nil end
    Seen = Seen or {}
    if Seen[Table] then return nil end
    Seen[Table] = true
    for Key, Value in pairs(Table) do
        if MatchFn(Key, Value) then return Key, Value, Table
        elseif type(Value) == "table" then
            local FoundKey, FoundValue, FoundParent = TableValueFind(Value, MatchFn, Seen)
            if FoundKey ~= nil then return FoundKey, FoundValue, FoundParent end
        end
    end
    return nil
end

local function GetAnimationType(ID)
    for i,v in pairs(AllAnimations) do
        for animtype,animId in pairs(v) do
            if type(animId) == "table" then
                for i2,v2 in pairs(animId) do
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
    else return end
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

local ThreadManager = {Threads = {}}
function ThreadManager:Start(Name,Function,Interval)
    if ThreadManager.Threads[Name] then return end
    ThreadManager.Threads[Name] = task.spawn(function() while true do Function() task.wait(Interval) end end)
end

local IsRequireSupported = false
task.spawn(function()
    local Success, Result = pcall(function()
         local Module = require(ReplicatedStorage:WaitForChild("Systems"):WaitForChild("Character"):WaitForChild("Game"):WaitForChild("Sprinting"))
        if Module and type(Module) == "table" and Module["StaminaChanged"] then IsRequireSupported = true return {Module} end
    end)
    if not (Success and type(Result) == "table") then FeatureLoadout["Hacks"]["require"]["DefaultInstanceValue"] = false else IsRequireSupported = true MainModule = Result[1] end
end)

PlaySound("deadJOutIaw_Nova",{["TimePosition"] = 5,["Volume"] = 0.0001},true)

local KillerAssets = ReplicatedStorage:FindFirstChild("Assets")
local SurvivorAssets = KillerAssets and KillerAssets:FindFirstChild("Survivors")
KillerAssets = KillerAssets and KillerAssets:FindFirstChild("Killers")

if IsRequireSupported then
    local ConfigKiller = KillerAssets:QueryDescendants("ModuleScript#Config")
    local ConfigSurvivor = SurvivorAssets:QueryDescendants("ModuleScript#Config")
    for i,ConfigModule in pairs(table.move(ConfigKiller, 1, #ConfigKiller, #ConfigSurvivor+1, ConfigSurvivor)) do
        if ConfigModule.Parent:IsA("Model") then continue end
         local ConfigData = require(ConfigModule)
        local AnimationData = ConfigData and ConfigData.Animations
        if ConfigModule.Parent.Name == "Noli" and ConfigData and TableValueFind(ConfigData, function(Key, Value) return type(Key) == "string" and Key:find("InitialTurnMult") end) then
            NoliConfig = ConfigData
        end
        if not AnimationData then continue end
        AllAnimations[ConfigModule.Parent.Name] = AnimationData
    end
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
            Animator.AnimationPlayed:Connect(function(Track) ChangeTrackWithOverride(Track,(GetValue("AnimationChanger"))) end)
        end
        if SpeedMultipliers ~= nil and typeof(SpeedMultipliers) == "Instance" then
              SpeedMultipliers.ChildAdded:Connect(function(Child)
                if not Child:IsA("NumberValue") or Child.Name == "Sprinting"  then return end
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
                for i,v in pairs(SpeedMultipliers:GetChildren()) do if v.Name == "HinderedMovement" and GetValue("ControllableDash") and v.Value == 0 then v.Value = 0.005 end end
                local function UpdateVelocity()
                    if GetValue("ControllableDash") then Child.LineDirection = LocalHumanoid.MoveDirection * OriginalVelocityMag else Child.LineDirection = OriginalVelocity end
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
                    local InfViewConnection;InfViewConnection = PlusFolderSettings:FindFirstChild("StaminaPreset",true):GetPropertyChangedSignal("Value"):Connect(function()
                        if InfiniteStaminaElement and OriginalAmountUI then
                            InfiniteStaminaElement.Visible = GetValue("StaminaPreset") == "Infinite"
                            OriginalAmountUI.Visible = GetValue("StaminaPreset") ~= "Infinite"
                            if CenterStaminaCounter then CenterStaminaCounter.Visible = GetValue("StaminaPreset") ~= "Infinite" and CenterStaminaCounter:GetAttribute("WasVisible") end
                        else InfViewConnection:Disconnect() end
                    end)
                    TempUI.Destroying:Once(function() InfViewConnection:Disconnect() end)
                end
            end)
            for i,v in pairs(TempUI:QueryDescendants("#redFlash,#injuredVignette")) do v.Visible = not GetValue("HideInjury") end
         end
    end)
end

Lighting.ChildAdded:Connect(function(Child) if Child.Name == "HealthDesaturation" then Child.Enabled = not GetValue("HideInjury") end end)
if Lighting:FindFirstChild("HealthDesaturation") then Lighting.HealthDesaturation.Enabled = not GetValue("HideInjury") end

local getgc = GetFunction(getgc, get_gc)
if getgc then
    if not MainModule then
        for i,Object in pairs(getgc()) do
            if type(Object) == "table" then if rawget(Object, "Stamina") and rawget(Object, "StaminaChanged") then MainModule = Object break end end
        end
    end
else FeatureLoadout["Hacks"]["getgc"]["DefaultInstanceValue"] = false end

local hookmetamethod = GetFunction(hookmetamethod, hook_metamethod)
if not hookmetamethod then FeatureLoadout["Hacks"]["hookmetamethod"]["DefaultInstanceValue"] = false
else
    export type DesyncHook = {DesyncNumber:number,BufferCorruption:buffer}
    export type CorruptArguments = {Number:number,Table1:table,NilObject:any,Table2:table}
    local HookSuccess, HookResult = pcall(function()
        local Event = Network:WaitForChild("UnreliableRemoteEvent")
        local newcclosure = GetFunction(newcclosure, new_cclosure) or function(LClosure) return LClosure end
        local TypeEnum = {"invalidnumber"}
         local __namecall = true
        __namecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...): DesyncHook
            if IsUnderground and rawequal(self, Event) and GetValue("Invincible") and getnamecallmethod() == "FireServer" then
                local Args: CorruptArguments = {...}
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
    if not HookSuccess or not HookResult then FeatureLoadout["Hacks"]["hookmetamethod"]["DefaultInstanceValue"] = false end
end

task.spawn(function() for i,v in pairs(Players:GetPlayers()) do if v ~= LocalPlayer then HandlePrivacySettings(v) end end end)
Players.PlayerAdded:Connect(function(Player) task.wait(2) HandlePrivacySettings(Player) end)
LocalPlayer.CharacterAdded:Connect(ActionOnCharacter)
ActionOnCharacter(LocalCharacter or LocalPlayer.Character)

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
                for i,v in pairs(KillerDoorsFolder:GetChildren()) do
                    v.Color = Color
                     if v:GetAttribute("OriginalCanCollide") == nil then v:SetAttribute("OriginalCanCollide", v.CanCollide) end
                    v.CanCollide = v:GetAttribute("OriginalCanCollide") ~= false and not Value or false
                     if KillerCollisions then
                        local Params = OverlapParams.new()
                        Params.FilterType = Enum.RaycastFilterType.Include
                        Params.CollisionGroup = "Killers"
                         Params.FilterDescendantsInstances = {KillerCollisions}
                        local Hitbox = workspace:GetPartBoundsInRadius(v.Position, 10, Params)
                        for i,h in pairs(Hitbox) do h.CanCollide = not Value end
                    end
                    if v:FindFirstChildOfClass("SpecialMesh") then v:FindFirstChildOfClass("SpecialMesh").VertexColor = VertexColor end
                end
            end
        end
    end)
end

ThreadManager:Start("FeatureHandler", function()
     task.spawn(function()
        if LocalRoot and not IsFixingGenerator and GetValue("AutoGeneratorPuzzle") and GameMap then
            for i,Object in pairs(GameMap:QueryDescendants("Model#Generator:has(#Main)")) do
                if LocalRoot and LocalRoot.Anchored ~= true and (Object:FindFirstChild("Main").Position - LocalRoot.Position).Magnitude < 6.7 then
                    task.spawn(function()
                          IsFixingGenerator = true
                        local Remotes = Object:FindFirstChild("Remotes")
                        local Progress = Object:FindFirstChild("Progress")
                        local RemoteEvent = Remotes and Remotes:FindFirstChildOfClass("RemoteEvent")
                         if RemoteEvent and Progress and Progress.Value < 100 then
                            while Progress.Value < 100 do
                                if not IsFixingGenerator or not LocalCharacter or not SpeedMultipliers or not SpeedMultipliers:FindFirstChild("FixingGenerator") or not GetValue("AutoGeneratorPuzzle") then break end
                             task.wait(Random.new():NextNumber(1.45,1.6))
                                if not IsFixingGenerator or not LocalCharacter or not SpeedMultipliers or not SpeedMultipliers:FindFirstChild("FixingGenerator") or not GetValue("AutoGeneratorPuzzle") then break end
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

    local StaminaPreset = GetValue("StaminaPreset")
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
                for i,v in pairs(table.move(Tools,1,#Tools,#DroppedTools+1,DroppedTools)) do
                    CreateDynamicHighlight((GetValue("ItemsESP")), v, v:FindFirstChildWhichIsA("BasePart"), { ["MaxDistance"] = 100, ["MinDistance"] = 12, ["Color"] = ColorPresets[GetValue("ItemsColor") or "Gold"] })
                     if v:IsA("Tool") and not LocalCharacter:FindFirstChild(v.Name) and not LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(v.Name) and not v:GetAttribute("JustDropped") and GetValue("AutoPickup") then
                        local ProximityPrompt = v:FindFirstChildWhichIsA("ProximityPrompt",true)
                        local Param = OverlapParams.new()
                        Param.FilterType = Enum.RaycastFilterType.Include
                         Param.FilterDescendantsInstances = {v}
                        local Result = workspace:GetPartBoundsInRadius(LocalRoot.Position, 4.5, Param)
                        if LocalRoot and #Result > 0 and ProximityPrompt then
                             local FireProximtyPrompt = GetFunction(fireproximityprompt, fire_proximity_prompt)
                            if FireProximtyPrompt then FireProximtyPrompt(ProximityPrompt) else ProximityPrompt:InputHoldBegin() ProximityPrompt:InputHoldEnd() end
                         end
                    end
                end
        end)
        for i,v in pairs(GameMap:QueryDescendants("Model#Generator:has(#Main)")) do
            if GetValue("GeneratorsCheck") == true and v:FindFirstChild("Progress") and v:FindFirstChild("Progress").Value >= 100 then CreateDynamicHighlight(false, v)
            elseif v:FindFirstChild("Progress") then
                CreateDynamicHighlight(GetValue("GeneratorsESP"), v, v:FindFirstChild("Main") or v:WaitForChild("Main"), { ["MaxDistance"] = 100, ["MinDistance"] = 12, ["Color"] = ColorPresets[GetValue("GeneratorsColor") or "Cyan"] })
            end
        end
    end
    if workspace:FindFirstChild("Players") then
        for i,v in pairs(workspace.Players:QueryDescendants("#Killers > Instance,#Survivors > Instance")) do
            if v ~= LocalPlayer.Character and Players:GetPlayerFromCharacter(v) ~= nil then
                 local espEnabled = GetValue(v.Parent.Name.."ESP")
                local settings = { ["MaxDistance"] = 100, ["MinDistance"] = 10, ["Color"] = ColorPresets[GetValue(v.Parent.Name.."Color") or "White"] }
                CreateDynamicHighlight(espEnabled, v, v:FindFirstChild("HumanoidRootPart"), settings)
                 UpdateCustomESP(v, espEnabled, settings)
            else CreateDynamicHighlight(false, v) UpdateCustomESP(v, false, {}) end
        end
    end
end,0.1)

if workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers") then workspace.Players.Killers.ChildAdded:Connect(function(Child) task.wait(0.5) HandleNoliNPC(GetValue("DisableNoliNPC")) end) end
if InGame then InGame.ChildAdded:Connect(function(Child) task.wait(0.02) Handle007n7NPC(GetValue("Disable007n7NPC")) end) end

RoundEvent.Event:Connect(function(Data)
    if Data == "Start" then if GetValue("ShowChat") then TextChatService.ChatWindowConfiguration.Enabled = true end else IsUnderground = false end
end)

workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
     for i,v in pairs(workspace:QueryDescendants("Highlight[$Dynamic]")) do for i,t in pairs(v:QueryDescendants("Tween")) do t:Cancel() end v.FillTransparency = 0.9 v.OutlineTransparency = 0.9 end
end)

if InGame then
    InGame.ChildAdded:Connect(function(Child)
        if Child:IsA("Tool") then
            Child:SetAttribute("JustDropped", true)
            task.delay(1.5, function() if Child then Child:SetAttribute("JustDropped", nil) end end)
        elseif Child:IsA("Folder") and (Child.Name):find("JohnDoeTrail") then
            task.wait()
            for i,v in pairs(Child:GetChildren()) do if v:IsA("BasePart") then v.CanTouch = not GetValue("DisableToxicTrails") end end
        elseif Child:IsA("Folder") and (Child.Name):find("Shadows") then
            task.wait()
            for i,v in pairs(Child:GetChildren()) do if v:IsA("BasePart") then v.CanTouch = not GetValue("DisableFootprints") end end
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

if workspace:FindFirstChild("Ragdolls") then workspace:FindFirstChild("Ragdolls").ChildAdded:Connect(function(Ragdoll) if GetValue("DeleteRagdolls") then workspace:FindFirstChild("Ragdolls"):ClearAllChildren() end end) end


-- ==========================================
-- SKRIP UI UTAMA: FULL TEXTURE BG, RESIZE & DRAG
-- ==========================================

local SG = Instance.new("ScreenGui")
SG.Name = "ForsakenPlusUI_Pradaxca"
SG.ResetOnSpawn = false
SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local suc = pcall(function() SG.Parent = targetGui end)
if not suc then SG.Parent = LocalPlayer:WaitForChild("PlayerGui") end

-- Fungsi Dragging Kustom Untuk HP / Mobile Delta (Sangat Mulus)
local function MakeDraggable(TopBar, Object)
    local Dragging = false
    local DragInput, DragStart, StartPosition
    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true
            DragStart = input.Position
            StartPosition = Object.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then Dragging = false end
            end)
        end
    end)
    TopBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then DragInput = input end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == DragInput and Dragging then
            local delta = input.Position - DragStart
            Object.Position = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + delta.Y)
        end
    end)
end

-- Tombol Toggle Transparan (Draggable) --
local ToggleBtn = Instance.new("ImageButton", SG)
ToggleBtn.Size = UDim2.new(0, 45, 0, 45)
ToggleBtn.Position = UDim2.new(0, 15, 0.5, -25)
ToggleBtn.BackgroundTransparency = 1 
ToggleBtn.Image = "rbxassetid://114704837418228"
MakeDraggable(ToggleBtn, ToggleBtn) -- Bisa diseret bebas

-- Frame Utama Kaca Cair Dihapus -> FULL BACKGROUND TEXTURE --
local MainFrame = Instance.new("Frame", SG)
MainFrame.Size = UDim2.new(0, 550, 0, 400)
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BackgroundTransparency = 0 -- FULL SOLID agar jelas
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)
local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(255, 105, 180)
MainStroke.Thickness = 2

-- Latar Belakang Tekstur Penuh --
local BGTexture = Instance.new("ImageLabel", MainFrame)
BGTexture.Size = UDim2.new(1, 0, 1, 0)
BGTexture.Position = UDim2.new(0, 0, 0, 0)
BGTexture.Image = "rbxassetid://92266968408887"
BGTexture.BackgroundTransparency = 1
BGTexture.ImageTransparency = 0 -- 100% JELAS, TIDAK TRANSPARAN
BGTexture.ZIndex = 0
BGTexture.ScaleType = Enum.ScaleType.Crop
Instance.new("UICorner", BGTexture).CornerRadius = UDim.new(0, 10)

-- Title Bar (Untuk Dragging Utama) --
local TitleBar = Instance.new("Frame", MainFrame)
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
TitleBar.BackgroundTransparency = 0.1
TitleBar.ZIndex = 2
Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 10)
local FixSquare = Instance.new("Frame", TitleBar)
FixSquare.Size = UDim2.new(1, 0, 0.5, 0)
FixSquare.Position = UDim2.new(0, 0, 0.5, 0)
FixSquare.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
FixSquare.BackgroundTransparency = 0.1
FixSquare.BorderSizePixel = 0
FixSquare.ZIndex = 2

MakeDraggable(TitleBar, MainFrame) -- Bisa ditarik dari Title Bar

local TitleText = Instance.new("TextLabel", TitleBar)
TitleText.Size = UDim2.new(1, -50, 1, 0)
TitleText.Position = UDim2.new(0, 15, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "Pradaxca Plus - Pink Edition"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 18
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.ZIndex = 3

-- Tombol Minimize --
local MinBtn = Instance.new("TextButton", TitleBar)
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -35, 0, 5)
MinBtn.BackgroundTransparency = 1
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 24
MinBtn.ZIndex = 3

-- Tombol Resize UI (Di pojok kanan bawah) --
local ResizeBtn = Instance.new("TextButton", MainFrame)
ResizeBtn.Size = UDim2.new(0, 20, 0, 20)
ResizeBtn.Position = UDim2.new(1, -20, 1, -20)
ResizeBtn.BackgroundTransparency = 1
ResizeBtn.Text = "◢"
ResizeBtn.TextColor3 = Color3.fromRGB(255, 105, 180)
ResizeBtn.Font = Enum.Font.GothamBold
ResizeBtn.TextSize = 18
ResizeBtn.ZIndex = 10

local isResizing = false
local resizeDragStart, resizeStartSize
ResizeBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isResizing = true
        resizeDragStart = input.Position
        resizeStartSize = MainFrame.Size
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if isResizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - resizeDragStart
        local newX = math.clamp(resizeStartSize.X.Offset + delta.X, 400, 800) -- Batas min max lebar
        local newY = math.clamp(resizeStartSize.Y.Offset + delta.Y, 250, 600) -- Batas min max tinggi
        MainFrame.Size = UDim2.new(0, newX, 0, newY)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then isResizing = false end
end)


-- Container Tab & Konten --
local TabContainer = Instance.new("ScrollingFrame", MainFrame)
TabContainer.Size = UDim2.new(0, 140, 1, -40)
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TabContainer.BackgroundTransparency = 0.3 -- Biar texture kelihatan dikit, tapi jelas
TabContainer.BorderSizePixel = 0
TabContainer.ScrollBarThickness = 2
TabContainer.ScrollBarImageColor3 = Color3.fromRGB(255, 105, 180)
TabContainer.ZIndex = 2
local TabListLayout = Instance.new("UIListLayout", TabContainer)

local ContentContainer = Instance.new("Frame", MainFrame)
ContentContainer.Size = UDim2.new(1, -140, 1, -40)
ContentContainer.Position = UDim2.new(0, 140, 0, 40)
ContentContainer.BackgroundTransparency = 1
ContentContainer.ZIndex = 2

-- Animasi Buka/Tutup UI TANPA BLUR --
local function closeUI()
    TweenService:Create(MainFrame, TweenInfo.new(0.2), {Size = UDim2.new(0, MainFrame.Size.X.Offset, 0, 0)}):Play()
    task.delay(0.2, function() MainFrame.Visible = false end)
end

local function openUI()
    MainFrame.Visible = true
    local targetY = math.max(MainFrame.Size.Y.Offset, 400)
    MainFrame.Size = UDim2.new(0, MainFrame.Size.X.Offset, 0, 0)
    TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, MainFrame.Size.X.Offset, 0, targetY)}):Play()
end

ToggleBtn.MouseButton1Click:Connect(function()
    if MainFrame.Visible then closeUI() else openUI() end
end)
MinBtn.MouseButton1Click:Connect(closeUI)

-- Fungsi Pembuatan UI & Lokalisasi --
function updateTabsLocalization()
    for _, tabBtn in pairs(TabContainer:GetChildren()) do
        if tabBtn:IsA("TextButton") then tabBtn.Text = getTranslation(tabBtn.Name) end
    end
end

local currentTab = nil
local function CreateTab(tabKey)
    local tabName = getTranslation(tabKey)
    local TabBtn = Instance.new("TextButton", TabContainer)
    TabBtn.Name = tabKey
    TabBtn.Size = UDim2.new(1, 0, 0, 35)
    TabBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    TabBtn.BackgroundTransparency = 1
    TabBtn.BorderSizePixel = 0
    TabBtn.Text = tabName
    TabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    TabBtn.Font = Enum.Font.GothamSemibold
    TabBtn.TextSize = 14
    TabBtn.ZIndex = 3

    local Scroll = Instance.new("ScrollingFrame", ContentContainer)
    Scroll.Name = tabKey
    Scroll.Size = UDim2.new(1, 0, 1, 0)
    Scroll.BackgroundTransparency = 1
    Scroll.BorderSizePixel = 0
    Scroll.ScrollBarThickness = 4
    Scroll.ScrollBarImageColor3 = Color3.fromRGB(255, 105, 180)
    Scroll.Visible = false
    Scroll.ZIndex = 3
    local ScrollLayout = Instance.new("UIListLayout", Scroll)
    ScrollLayout.Padding = UDim.new(0, 5)
    ScrollLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    local Padding = Instance.new("UIPadding", Scroll)
    Padding.PaddingTop = UDim.new(0, 10)
    Padding.PaddingBottom = UDim.new(0, 10)
    
    TabBtn.MouseButton1Click:Connect(function()
        for _, child in pairs(ContentContainer:GetChildren()) do if child:IsA("ScrollingFrame") then child.Visible = false child.GroupTransparency = 1 end end
        for _, child in pairs(TabContainer:GetChildren()) do if child:IsA("TextButton") then child.TextColor3 = Color3.fromRGB(200,200,200) child.BackgroundTransparency = 1 end end
        
        Scroll.Visible = true
        Scroll.GroupTransparency = 1
        TweenService:Create(Scroll, TweenInfo.new(0.3), {GroupTransparency = 0}):Play()
        
        TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabBtn.BackgroundTransparency = 0.5
        TabBtn.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
    end)
    
    if currentTab == nil then
        Scroll.Visible = true
        Scroll.GroupTransparency = 0
        TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabBtn.BackgroundTransparency = 0.5
        TabBtn.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
        currentTab = tabKey
    end
    
    TabContainer.CanvasSize = UDim2.new(0, 0, 0, TabListLayout.AbsoluteContentSize.Y)
    return Scroll
end

local function AutoCanvas(scroll) scroll.CanvasSize = UDim2.new(0, 0, 0, scroll.UIListLayout.AbsoluteContentSize.Y + 20) end

function updateControlsLocalization()
    for _, scroll in pairs(ContentContainer:GetChildren()) do
        if scroll:IsA("ScrollingFrame") then
            for _, control in pairs(scroll:GetChildren()) do
                if control:IsA("Frame") then
                    local titleText = control:FindFirstChild("Title")
                    if titleText and control:GetAttribute("LocalizationKey") then
                        titleText.Text = getTranslation(control:GetAttribute("LocalizationKey") .. "_title")
                    end
                end
            end
        end
    end
end

local function CreateToggle(parent, featureKey, valueObj, descText)
    local titleText = getTranslation(featureKey .. "_title")
    local Frame = Instance.new("Frame", parent)
    Frame.Name = featureKey
    Frame.Size = UDim2.new(0.95, 0, 0, 45)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Frame.BackgroundTransparency = 0.2 -- Sedikit transparan agar readable
    Frame:SetAttribute("LocalizationKey", featureKey)
    Frame.ZIndex = 4
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 6)
    Instance.new("UIStroke", Frame).Color = Color3.fromRGB(80,80,80)

    local Title = Instance.new("TextLabel", Frame)
    Title.Name = "Title"
    Title.Size = UDim2.new(0.7, 0, 0.5, 0)
    Title.Position = UDim2.new(0, 10, 0, 5)
    Title.BackgroundTransparency = 1
    Title.Text = titleText
    Title.TextColor3 = Color3.fromRGB(230, 230, 230)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 13
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.ZIndex = 5

    local Desc = Instance.new("TextLabel", Frame)
    Desc.Size = UDim2.new(0.7, 0, 0.5, 0)
    Desc.Position = UDim2.new(0, 10, 0.5, -2)
    Desc.BackgroundTransparency = 1
    Desc.Text = descText or ""
    Desc.TextColor3 = Color3.fromRGB(180, 180, 180)
    Desc.Font = Enum.Font.Gotham
    Desc.TextSize = 10
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    Desc.TextTruncate = Enum.TextTruncate.AtEnd
    Desc.ZIndex = 5

    local Btn = Instance.new("TextButton", Frame)
    Btn.Size = UDim2.new(0, 50, 0, 24)
    Btn.Position = UDim2.new(1, -60, 0.5, -12)
    Btn.Text = valueObj.Value and "ON" or "OFF"
    Btn.BackgroundColor3 = valueObj.Value and Color3.fromRGB(255, 105, 180) or Color3.fromRGB(70, 70, 70)
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 12
    Btn.ZIndex = 5
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 4)

    Btn.MouseButton1Click:Connect(function()
        valueObj.Value = not valueObj.Value
        for TabName, TabContents in pairs(FeatureLoadout) do
            if TabContents[valueObj.Name] and TabContents[valueObj.Name].ScriptFunction then TabContents[valueObj.Name]:ScriptFunction(valueObj.Value) end
        end
    end)
    valueObj.Changed:Connect(function()
        Btn.Text = valueObj.Value and "ON" or "OFF"
        Btn.BackgroundColor3 = valueObj.Value and Color3.fromRGB(255, 105, 180) or Color3.fromRGB(70, 70, 70)
    end)
    AutoCanvas(parent)
end

local function CreateCycle(parent, featureKey, valueObj, optionsString, descText)
    local titleText = getTranslation(featureKey .. "_title")
    local Frame = Instance.new("Frame", parent)
    Frame.Name = featureKey
    Frame.Size = UDim2.new(0.95, 0, 0, 45)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Frame.BackgroundTransparency = 0.2
    Frame:SetAttribute("LocalizationKey", featureKey)
    Frame.ZIndex = 4
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 6)
    Instance.new("UIStroke", Frame).Color = Color3.fromRGB(80,80,80)

    local Title = Instance.new("TextLabel", Frame)
    Title.Name = "Title"
    Title.Size = UDim2.new(0.4, 0, 0.5, 0)
    Title.Position = UDim2.new(0, 10, 0, 5)
    Title.BackgroundTransparency = 1
    Title.Text = titleText
    Title.TextColor3 = Color3.fromRGB(230, 230, 230)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 13
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.ZIndex = 5
    
    local Desc = Instance.new("TextLabel", Frame)
    Desc.Size = UDim2.new(0.4, 0, 0.5, 0)
    Desc.Position = UDim2.new(0, 10, 0.5, -2)
    Desc.BackgroundTransparency = 1
    Desc.Text = descText or ""
    Desc.TextColor3 = Color3.fromRGB(180, 180, 180)
    Desc.Font = Enum.Font.Gotham
    Desc.TextSize = 10
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    Desc.TextTruncate = Enum.TextTruncate.AtEnd
    Desc.ZIndex = 5

    local Btn = Instance.new("TextButton", Frame)
    Btn.Size = UDim2.new(0, 110, 0, 24)
    Btn.Position = UDim2.new(1, -120, 0.5, -12)
    Btn.Text = getTranslation(valueObj.Value)
    Btn.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 11
    Btn.TextWrapped = true
    Btn.ZIndex = 5
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
        Btn.Text = getTranslation(valueObj.Value)
        for TabName, TabContents in pairs(FeatureLoadout) do
            if TabContents[valueObj.Name] and TabContents[valueObj.Name].ScriptFunction then TabContents[valueObj.Name]:ScriptFunction(valueObj.Value) end
        end
     end)
    valueObj.Changed:Connect(function() Btn.Text = getTranslation(valueObj.Value) end)
    AutoCanvas(parent)
end

local function CreateSlider(parent, featureKey, valueObj, min, max, descText)
    local titleText = getTranslation(featureKey .. "_title")
    local Frame = Instance.new("Frame", parent)
    Frame.Name = featureKey
    Frame.Size = UDim2.new(0.95, 0, 0, 55)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Frame.BackgroundTransparency = 0.2
    Frame:SetAttribute("LocalizationKey", featureKey)
    Frame.ZIndex = 4
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 6)
    Instance.new("UIStroke", Frame).Color = Color3.fromRGB(80,80,80)

    local Title = Instance.new("TextLabel", Frame)
    Title.Name = "Title"
    Title.Size = UDim2.new(0.7, 0, 0.4, 0)
    Title.Position = UDim2.new(0, 10, 0, 5)
    Title.BackgroundTransparency = 1
    Title.Text = titleText
    Title.TextColor3 = Color3.fromRGB(230, 230, 230)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 13
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.ZIndex = 5
    
    local Desc = Instance.new("TextLabel", Frame)
    Desc.Size = UDim2.new(0.7, 0, 0.4, 0)
    Desc.Position = UDim2.new(0, 10, 0.4, 2)
    Desc.BackgroundTransparency = 1
    Desc.Text = descText or ""
    Desc.TextColor3 = Color3.fromRGB(180, 180, 180)
    Desc.Font = Enum.Font.Gotham
    Desc.TextSize = 10
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    Desc.TextTruncate = Enum.TextTruncate.AtEnd
    Desc.ZIndex = 5
    
    local ValText = Instance.new("TextLabel", Frame)
    ValText.Size = UDim2.new(0.2, 0, 0.4, 0)
    ValText.Position = UDim2.new(0.8, -10, 0, 5)
    ValText.BackgroundTransparency = 1
    ValText.Text = tostring(valueObj.Value)
    ValText.TextColor3 = Color3.fromRGB(255, 105, 180)
    ValText.Font = Enum.Font.GothamBold
    ValText.TextSize = 13
    ValText.TextXAlignment = Enum.TextXAlignment.Right
    ValText.ZIndex = 5

    local SliderBar = Instance.new("TextButton", Frame)
    SliderBar.Size = UDim2.new(1, -20, 0, 8)
    SliderBar.Position = UDim2.new(0, 10, 0.75, 0)
    SliderBar.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    SliderBar.Text = ""
    SliderBar.AutoButtonColor = false
    SliderBar.ZIndex = 5
    Instance.new("UICorner", SliderBar).CornerRadius = UDim.new(1, 0)

    local Fill = Instance.new("Frame", SliderBar)
    local range = max - min
    if range == 0 then range = 1 end
    Fill.Size = UDim2.new(math.clamp((valueObj.Value - min)/range, 0, 1), 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
    Fill.ZIndex = 6
    Instance.new("UICorner", Fill).CornerRadius = UDim.new(1, 0)

    local isDragging = false
    local function updateSlider(input)
        local rel = math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
        local newVal = math.floor(min + (rel * (max - min)))
        valueObj.Value = newVal
        for TabName, TabContents in pairs(FeatureLoadout) do
             if TabContents[valueObj.Name] and TabContents[valueObj.Name].ScriptFunction then TabContents[valueObj.Name]:ScriptFunction(valueObj.Value) end
        end
    end
    SliderBar.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then isDragging = true updateSlider(input) end end)
    UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then isDragging = false end end)
    UserInputService.InputChanged:Connect(function(input) if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then updateSlider(input) end end)
    valueObj.Changed:Connect(function() ValText.Text = tostring(valueObj.Value) local r = max - min if r == 0 then r = 1 end Fill.Size = UDim2.new(math.clamp((valueObj.Value - min)/r, 0, 1), 0, 1, 0) end)
     AutoCanvas(parent)
end

-- Initialize UI Tabs --
task.wait(0.5)

local sortedTabs = {}
for TabName, TabContents in pairs(FeatureLoadout) do
    table.insert(sortedTabs, {name = TabName, order = TabContents.TabAttributes and TabContents.TabAttributes.LayoutOrder or 99})
end
table.sort(sortedTabs, function(a,b) return a.order < b.order end)

for _, tabInfo in ipairs(sortedTabs) do
    local TabName = tabInfo.name
    local TabContents = FeatureLoadout[TabName]
    local scroll = CreateTab(TabName)
    
    local sortedFeatures = {}
    for SettingName, SettingData in pairs(TabContents) do
        if SettingName ~= "TabAttributes" then table.insert(sortedFeatures, {name = SettingName, data = SettingData}) end
    end
    table.sort(sortedFeatures, function(a,b) return (a.data.LayoutOrder or 99) < (b.data.LayoutOrder or 99) end)
    
    for _, feature in ipairs(sortedFeatures) do
        local fName = feature.name
        local fData = feature.data
        local valObj = PlusFolderSettings:FindFirstChild(fName, true)
        
         if valObj then
            local desc = valObj:GetAttribute("DisplayDescription") or ""
            if fData.InstanceType == "BoolValue" then CreateToggle(scroll, fName, valObj, desc)
            elseif fData.InstanceType == "StringValue" then
                local opts = fData.ExtraData and fData.ExtraData.Options or ""
                CreateCycle(scroll, fName, valObj, opts, desc)
            elseif fData.InstanceType == "NumberValue" then
                local min = fData.ExtraData and fData.ExtraData.MinValue or 0
                local max = fData.ExtraData and fData.ExtraData.MaxValue or 100
                CreateSlider(scroll, fName, valObj, min, max, desc)
            end
        end
    end
end

function updateInformationTab()
    local infoScroll = ContentContainer:FindFirstChild("Information")
    if not infoScroll then return end
    infoScroll:ClearAllChildren()
    local InfoLayout = Instance.new("UIListLayout", infoScroll)
    InfoLayout.Padding = UDim.new(0, 8)
    InfoLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    local Padding = Instance.new("UIPadding", infoScroll)
    Padding.PaddingTop = UDim.new(0, 10)
    Padding.PaddingBottom = UDim.new(0, 10)

    local function createInfoText(langKey, color)
        local frame = Instance.new("Frame", infoScroll)
        frame.Size = UDim2.new(0.95, 0, 0, 35)
        frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        frame.BackgroundTransparency = 0.2
        frame.ZIndex = 4
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)
        Instance.new("UIStroke", frame).Color = Color3.fromRGB(80,80,80)

        local label = Instance.new("TextLabel", frame)
        label.Size = UDim2.new(1, -20, 1, 0)
        label.Position = UDim2.new(0, 10, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = getTranslation(langKey)
        label.TextColor3 = color or Color3.fromRGB(230, 230, 230)
        label.Font = Enum.Font.GothamBold
        label.TextSize = 14
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.ZIndex = 5
    end

    createInfoText("dev_info", Color3.fromRGB(255, 105, 180))
    createInfoText("tele_info")
    createInfoText("tiktok_info")
    createInfoText("status_info", Color3.fromRGB(0, 255, 0))
    
    AutoCanvas(infoScroll)
end

function updateLocalization()
    MainFrame.TitleBar.TitleText.Text = "Pradaxca Plus - Pink Edition"
    updateTabsLocalization()
    updateControlsLocalization()
    updateInformationTab()
end

-- Apply saved Language on startup --
local savedLang = GetValue("Language") or "EN"
currentLang = savedLang
updateLocalization()

task.spawn(function()
    task.wait(1.5)
    StarterGui:SetCore("SendNotification", { Title = "Pradaxca Plus", Text = getTranslation("start_notif"), Duration = 5 })
end)

ColoredPrint("Pradaxca Plus - Full Active Edition loaded successfully!","success",Color3.fromRGB(255, 105, 180))