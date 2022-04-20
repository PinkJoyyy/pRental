ESX = nil
TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

ESX.RegisterServerCallback("pBADealer:MoneyCheck", function(source, cb, money)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    money = tonumber(money)

    if xPlayer.getMoney(src) >= money then
        cb(true)
    else
        cb(false)
        xPlayer.showNotification("You don\'t have enough money")
    end
end)