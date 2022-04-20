ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

RegisterServerEvent("pRental:TakeMoney")
AddEventHandler("pRental:TakeMoney", function(money)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    money = tonumber(money)

        if xPlayer.getMoney(money) >= money then
            xPlayer.removeMoney(money)
            xPlayer.showNotification("You paid ".. money .. "$ for the rental")
        else
            xPlayer.showNotification("You don\'t have enough money")
        end
end)
