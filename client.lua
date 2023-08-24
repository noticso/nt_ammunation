ESX = nil
PlayerLoaded = false
ESX = exports["es_extended"]:getSharedObject()
local display = false
function  Draw3DText(x,y,z,text,scale, textX, textY, textZ)
    local onScreen, _x, _y = World3dToScreen2d(textX,textY,textZ)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
    SetTextScale(scale,scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(true)
    SetTextColour(255,255,255,215)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 700
    DrawRect(_x, _y + 0.0150, 0.06 + factor,  0.03, 41, 11, 41, 100 )
    DrawMarker(
        27, 
        x, 
        y, 
        z, 
        0.0, 
        0.0, 
        0.0, 
        0.0, 
        0.0, 
        0.0, 
        1.0, 
        1.0, 
        1.0, 
        170, 
        24, 
        107, 
        255, 
        false, 
        false, 
        2, 
        false
    )
end
-- SET DISPLAY 
RegisterNetEvent('nt_ammunation:SetDisplay')
AddEventHandler('nt_ammunation:SetDisplay', function(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
        items = Config.Items
    })
end)
function disableControl(display)
    DisableControlAction(0,1, display)
    DisableControlAction(0,142, display)
    DisableControlAction(0,18, display)
    DisableControlAction(0,322, display)
    DisableControlAction(0,2, display)
    DisableControlAction(0,106, display)
end

RegisterNUICallback('exit', function() 
    TriggerEvent('nt_ammunation:SetDisplay', false)
end)
RegisterNUICallback('buy', function(data) 
    TriggerServerEvent('nt_ammunation:buy', data)
end)
CreateThread(function ()
    ESX = exports["es_extended"]:getSharedObject()
    while ESX.GetPlayerData().job == nil do
        Wait(100)
    end
    PlayerLoaded = true
    local location1= Config.Location
    local text1 = Config.TextLoc
    while true do
        local pedCoords = GetEntityCoords(PlayerPedId())
        if PlayerLoaded == true then
            if Vdist(pedCoords, location1) < Config.MaxDistance then
                --Call function
                Draw3DText(location1.x, location1.y, location1.z,'~w~ Premi ~y~ [E] ~w~ l\' armeria',0.4, text1.x, text1.y, text1.z);
            end
            --CHECK 1st LOCATION
            if Vdist(pedCoords, location1) < Config.ClickDistance and IsControlPressed(0,38) then
                TriggerEvent('nt_ammunation:SetDisplay', not display)
                while display do
                    disableControl(display)
                    Wait(0)
                end
            end
        end
        Wait(7)
    end
end)
