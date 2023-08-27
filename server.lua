ESX = nil
ESX = exports["es_extended"]:getSharedObject()


RegisterNetEvent('nt_ammunation:buy')
AddEventHandler('nt_ammunation:buy', function (data)
    plr = ESX.GetPlayerFromId(source)   
    local noMoney;
    local notEnoughMoney;
    local noSpace;
    local paid;
    local money = plr.getMoney()
    local price;
    local hash;
    for key,value in pairs(Config.Items) do
        if value.id == data.id then   
            hash = value.hash   
           for i=0, 1 do
            
            price = value.price * data.quantity  
                if plr.canCarryItem(value.hash, data.quantity)then
                    if money ~= 0 then
                        if money >= (value.price * data.quantity) then
                            
                            paid = true         
                               
                        else 
                           notEnoughMoney = true
                        end  
                    else 
                        noMoney = true
                    end
                else 
                    noSpace = true
                end
                    
            end
   
        end
        end
       
        
       if noSpace then
        TriggerClientEvent('esx:showNotification', source, "You haven't got enough space in your inventory")
        TriggerClientEvent('nt_ammunation:SetDisplay', plr.source, false)
       end
        if notEnoughMoney then
            TriggerClientEvent('esx:showNotification', source, "You haven't got enough money. Go to an ATM to withdraw!")
            TriggerClientEvent('nt_ammunation:SetDisplay', plr.source, false)
        end
        if noMoney then
            TriggerClientEvent('esx:showNotification', source, "You haven't got any money. Go to an ATM to withdraw!")
            TriggerClientEvent('nt_ammunation:SetDisplay', plr.source, false)

   end
        if paid then 
            TriggerClientEvent('esx:showNotification', source, 'Paying...')
            TriggerClientEvent('nt_ammunation:SetDisplay', plr.source, false)
            plr.removeMoney(price)
            Wait(2000)
            plr.addInventoryItem(hash, data.quantity)   
        end     
end)