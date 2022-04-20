ESX = nil

Citizen.CreateThread(function()
    
    while ESX == nil do
        
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

        Citizen.Wait(100)
    end
    
    ESX.PlayerData = ESX.GetPlayerData()
end)

Citizen.CreateThread(function()

    Citizen.Wait(1000)

    for k, v in pairs(Config.Rental) do

        for _, index in pairs(v.rentacar) do

            TriggerEvent("gridsystem:registerMarker", {
                name = "pRental:rent:" .. k .. ":" .. _,
                type = Config.Markers.type,
                drawDistance = Config.Markers.draw_distance,
                size = vector3(Config.Markers.size.x, Config.Markers.size.y, Config.Markers.size.z),
                shouldBob = false,
                shouldRotate = Config.Markers.rotate,
                pos = index.pos,
                color = Config.Markers.color,
                scale = vector3(0.8, 0.8, 0.8),
                permission = nil,
                action = function()
                    pRental:OpenRent(_, index)
                end,
                onExit = function()
                    
                    ESX.UI.Menu.CloseAll()
                end,
                msg = "Press ~INPUT_CONTEXT~ to rent a vehicle",
            })
        end

        for _, index in pairs(v.deleters) do

            TriggerEvent("gridsystem:registerMarker", {
                name = "pRental:deleter:" .. k .. ":" .. _,
                type = Config.Markers.type,
                drawDistance = Config.Markers.draw_distance,
                size = vector3(Config.Markers.size.x, Config.Markers.size.y, Config.Markers.size.z),
                shouldBob = false,
                shouldRotate = Config.Markers.rotate,
                pos = index,
                color = 1,
                scale = vector3(0.8, 0.8, 0.8),
                permission = nil,
                action = function()
                    pRental:DeleteVehicle()
                end,
                onExit = function()                    
                    ESX.UI.Menu.CloseAll()
                end,
                msg = "Press ~INPUT_CONTEXT~ to delete the vehicle",
            })
        end
    end
end)

