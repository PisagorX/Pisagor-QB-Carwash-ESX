ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('qb-carwash:server:washCar')
AddEventHandler('qb-carwash:server:washCar', function()
    local src = source
    local Player = ESX.GetPlayerFromId(src)

    if Player.removeMoney(Config.DefaultPrice) then
        TriggerClientEvent('qb-carwash:client:washCar', src)
    elseif Player.removeAccountMoney(Config.DefaultPrice) then
        TriggerClientEvent('qb-carwash:client:washCar', src)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'Paranız Yetersiz!'})
    end
end)