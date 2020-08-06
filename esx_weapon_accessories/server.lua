local ESX = nil
 
TriggerEvent('esx:getSharedObject', function( obj ) ESX = obj end)

ESX.RegisterUsableItem('WeaponAcc_Add', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('WeaponAcc_Add', 1)
    TriggerClientEvent('WeaponAcc:Add', source)
end)

ESX.RegisterUsableItem('WeaponAcc_Remove', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('WeaponAcc_Remove', 1)
    TriggerClientEvent('WeaponAcc:Remove', source)
end)

ESX.RegisterUsableItem('WeaponAcc_Skin', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('WeaponAcc_Skin', 1)
    TriggerClientEvent('WeaponAcc:Skin', source)
end)

ESX.RegisterUsableItem('WeaponAcc_Color', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('WeaponAcc_Color', 1)
    TriggerClientEvent('WeaponAcc:Color', source)
end)

RegisterServerEvent('SetWeaponToSQL')
AddEventHandler('SetWeaponToSQL', function(Weapon, Component)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addWeaponComponent(Weapon, Component)
end)

RegisterServerEvent('RemoveWeaponToSQL')
AddEventHandler('RemoveWeaponToSQL', function(Weapon, Component)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeWeaponComponent(Weapon, Component)
end)