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
local MyButton = LeftGroupBox:AddButton({
    Text = 'Speedhack on',
    Func = function()
getgenv().WalkSpeedValue = 80 --set your desired walkspeed her
game:service'Players'.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal'WalkSpeed':Connect(function()
game:service'Players'.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue
end)
game:service'Players'.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue
    end,
    DoubleClick = false,
    Tooltip = 'This is the main button'
})

LeftGroupBox:AddSlider('MySlider', {
    Text = 'Speed Hack',
    Default = 16,
    Min = 16,
    Max = 1000,
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
