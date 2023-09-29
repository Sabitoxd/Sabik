local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()

--окно
local Window = Library:CreateWindow({
    Title = 'Esp by sabik',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

--табы
local Tabs = {
    Main = Window:AddTab('Main'),
}
local RightGroupBox = Window.Tabs.Main:AddRightGroupbox('Fun')
local MyButton = RightGroupBox:AddButton({
    Text = 'Reset race(for fun, dont save)',
    Func = function()
        game:GetService("Players").LocalPlayer.statz.race:Destroy()
    end,
    DoubleClick = false,
    Tooltip = 'This is main button'
})
local MyButton = RightGroupBox:AddButton({
    Text = 'Reset rellcoins',
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Skrapisismyscript/Solo_Hub/main/INFRELLCOINS"))()
    end,
    DoubleClick = false,
    Tooltip = 'This is main button'
})
local MyButton = RightGroupBox:AddButton({
    Text = 'Fly',
    Func = function()
        function getRoot(char)
            local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
            return rootPart
        end
        
        FLYING = false
        iyflyspeed = 1
        vehicleflyspeed = 10
        function sFLY()
            repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and getRoot(game.Players.LocalPlayer.Character) and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            repeat wait() until game.Players.LocalPlayer:GetMouse()
            if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
            local T = getRoot(game.Players.LocalPlayer.Character)
        local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
        local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
        local SPEED = 0
        
        local function FLY()
            FLYING = true
            local BG = Instance.new('BodyGyro')
            local BV = Instance.new('BodyVelocity')
            BG.P = 9e4
            BG.Parent = T
            BV.Parent = T
            BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            BG.cframe = T.CFrame
            BV.velocity = Vector3.new(0, 0, 0)
            BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
            task.spawn(function()
                repeat wait()
                    if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                        SPEED = 50
                    elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
                        SPEED = 0
                    end
                    if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
                        BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                        lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                    elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
                        BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                    else
                        BV.velocity = Vector3.new(0, 0, 0)
                    end
                    BG.cframe = workspace.CurrentCamera.CoordinateFrame
                until not FLYING
                CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
                lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
                SPEED = 0
                BG:Destroy()
                BV:Destroy()
                if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
                    game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
                end
            end)
        end
        flyKeyDown = game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KEY)
            if KEY:lower() == 'w' then
                CONTROL.F = (true and vehicleflyspeed or iyflyspeed)
            elseif KEY:lower() == 's' then
                CONTROL.B = - (true and vehicleflyspeed or iyflyspeed)
            elseif KEY:lower() == 'a' then
                CONTROL.L = - (true and vehicleflyspeed or iyflyspeed)
            elseif KEY:lower() == 'd' then 
                CONTROL.R = (true and vehicleflyspeed or iyflyspeed)
            end
            pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
        end)
        flyKeyUp = game.Players.LocalPlayer:GetMouse().KeyUp:Connect(function(KEY)
            if KEY:lower() == 'w' then
                CONTROL.F = 0
            elseif KEY:lower() == 's' then
                CONTROL.B = 0
            elseif KEY:lower() == 'a' then
                CONTROL.L = 0
            elseif KEY:lower() == 'd' then
                CONTROL.R = 0
            end
        end)
        FLY()
        end
        
        function NOFLY()
        FLYING = false
        if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
        if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
        end
        pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
        end
        
        sFLY(true)
    end,
    DoubleClick = false,
    Tooltip = 'This is main button'
})














--бокс группа
local LeftGroupBox = Window.Tabs.Main:AddLeftGroupbox('Esp')
local MyButton = LeftGroupBox:AddButton({
    Text = 'Esp on',
    Func = function()
pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/ShutUpRimuru/RobloxESP/main/ESP.lua'))() end)
    end,
    DoubleClick = false,
    Tooltip = 'This is the main button'
})

LeftGroupBox:AddSlider('MySlider', {
    Text = 'Speed Hack',
    Default = 16,
    Min = 16,
    Max = 10000,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().WalkSpeedValue = Value --set your desired walkspeed her
        game:service'Players'.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal'WalkSpeed':Connect(function()
        game:service'Players'.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue
        end)
        game:service'Players'.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue
    end
})
local MyButton = LeftGroupBox:AddButton({
    Text = 'Enable Inf spin',
    Func = function()
game:GetService("Players").LocalPlayer.startevent:FireServer("band", "\128") 
    end,
    DoubleClick = false,
    Tooltip = 'This is the main button'
})
local MyButton = LeftGroupBox:AddButton({
    Text = 'Off inf spin ',
    Func = function()
game:GetService("Players").LocalPlayer.startevent:FireServer("band", "Eye") 
    end,
    DoubleClick = false,
    Tooltip = 'This is the main button'
})
local MyButton = LeftGroupBox:AddButton({
    Text = 'Rejoin',
    Func = function()
local TeleportService = game:GetService("TeleportService")
TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end,
    DoubleClick = false,
    Tooltip = 'This is the main button'
})
--список игроков
LeftGroupBox:AddDropdown('Usernames', {
    SpecialType = 'Player',
    Text = 'List of players',
    Tooltip = 'Select target',
    Callback = function(Username)
        getgenv().target = Username
    end
})

--переключатель
LeftGroupBox:AddToggle('Toggle', {
    Text = 'Turn AimBot on/off',
    Default = false,
    Tooltip = 'on/off',
    Callback = function(Value)
        getgenv().toggle = Value
    end
})

--бинд аимбота
LeftGroupBox:AddLabel('AimBot key bind'):AddKeyPicker('KeyPicker', {
    Default = '',
    SyncToggleState = false,
    Mode = 'Toggle',
    Text = 'AimBot key bind',
    NoUI = false,
    Callback = function(Value)
        Toggles.Toggle:SetValue(Value)
    end
})
--если выбранный игрок ливает
game:GetService("Players").PlayerRemoving:Connect(function(player)
    if player.Name == Options.Usernames.Value then
        Options.Usernames:SetValue()
    end
end)

--аим бот
local eventbypass
eventbypass = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if getgenv().toggle == true and getgenv().target ~= nil then
        target = getgenv().target
        if not checkcaller() and self.Name == "update" and method == "FireServer" and args[1] == "fixmouse" and args[2] ~= workspace[target].Torso.CFrame then
            return workspace[game.Players.LocalPlayer.Name].combat.update:FireServer("fixmouse", workspace[target].Torso.CFrame)
        end
    else
        target = args[2]
    end
    return eventbypass(self, ...)
end)
--UI Settings
local LeftGroupBox2 = Tabs.Main:AddLeftGroupbox('UI Settings')
--выклбчить гуи
LeftGroupBox2:AddButton('Unload', function() Library:Unload() end)
--бинд менюшки
LeftGroupBox2:AddLabel('Menu keybind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })
Library.ToggleKeybind = Options.MenuKeybind

