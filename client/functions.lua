pRental = {}

function pRental:OpenRent(id, data)
    local src = source
    local playerPed = PlayerPedId(src)
    local elements = {}

    for k, v in pairs(data.vehicles) do
        table.insert(elements, { label = "Model: " .. v.label .. " | Price: $" .. v.money, value = v.model, livery = v.livery, plate = data.plate, pos = data.pos, heading = data.heading,  money = v.money})
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop', {
		title    = "Rent a vehicle",
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
        ESX.TriggerServerCallback('pBADealer:MoneyCheck', function(rent) 
                    if rent then
                    if ESX.Game.IsSpawnPointClear(data.current.pos, 3.5) then
                        
                        ESX.Game.SpawnVehicle(data.current.value, data.current.pos, data.current.heading, function(vehicle)
                    
                            if data.current.livery ~= nil then
                                SetVehicleLivery(vehicle, data.current.livery)
                            end
            
                            if data.current.plate ~= nil then
                                SetVehicleNumberPlateText(vehicle, data.current.plate .. math.random(1000, 9999))
                            end
            
                            TaskWarpPedIntoVehicle(playerPed, vehicle, -1)   
                            TriggerServerEvent("pRental:TakeMoney", data.current.money)
                        end)

                        menu.close()
                    
                    else   
                        ESX.ShowNotification("The spawn point is occupied by another vehicle")
                    end
                end
            
                end, data.current.money)
	end, function(data, menu)
		menu.close()
	end)
end

function pRental:DeleteVehicle()
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if DoesEntityExist(vehicle) then

        SetEntityAsMissionEntity(vehicle, true, true)
        
        DeleteVehicle(vehicle)
        
    else

        ESX.ShowNotification("You are not in a vehicle!")
    end
end