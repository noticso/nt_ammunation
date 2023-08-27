ESX = nil
PlayerLoaded = false
ESX = exports["es_extended"]:getSharedObject()
local display = false
local location = vector3(18.3, -1111, 29.88)
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
CreateThread(function()
	TriggerEvent('gridsystem:registerMarker', {
		name = "ammunation",
		pos = location,
		size = vector3(1.2, 1.2, 1.2),
		scale = vector3(0.8, 0.8, 0.8),
		control = 'E',
		rotate = 0.0,
		rotate2 = 0.0,
		shouldBob = false,
		shouldRotate = true,
		color =  { r = 130, g = 120, b = 110 },
		trasparent = 255,
		type = -1,
		texture = "ammunation_snk",
		msg = 'Weapon Shop',
		action = function()
			CreateThread(function()
				TriggerEvent('nt_ammunation:SetDisplay', true)
				while display do 
					DisableControlAction(0,1, display)
    				DisableControlAction(0,142, display)
    				DisableControlAction(0,18, display)
    				DisableControlAction(0,322, display)
    				DisableControlAction(0,2, display)
    				DisableControlAction(0,106, display)
					Wait(0)
				end
			end)
		end
	})
end)
