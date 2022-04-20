-- Made by PinkJoyyy#0337
-- For new uptades https://discord.gg/ejwrqGvQ

Config = {}

Config.Markers = {
    draw_distance = 20.0,
    type = 36, 
    color = {r = 0, g = 255, b = 0}, 
    size = {x = 2.0, y = 2.0, z = 2.0}, 
    rotate = false, 
}

Config.Rental = {
    ["rent_airport"] = { 
        rentacar = {
            {
                pos = vector3(-1035.9, -2728.4, 20.1), 
                heading = 230.59, 
                plate = "RENT",
                vehicles = {  
                    { label = "Panto", model = "panto", money = 5000 },
                },
            },
        },
    
        deleters = {
            vector3(-1026.7, -2734.8, 20),
        },
    },

    -- Example 
    -- ["Name_of_the_rental"] = { 
    --     rentacar = {
    --         {
    --             pos = vector3(0, 0, 0), --Spawn position of the vehicle
    --             heading = 00.00, --Heading of the vehicle
    --             plate = "RENT", --Plate of the vehicle. if you set nil will spawn with a random plate
    --             vehicles = {  
    --                 { label = "Veicle Name", model = "vehicle_model", money = }, -- 
    --             },
    --         },
    --     },
    
    --     deleters = {
    --         vector3(0, 0, 0), --Position of the deleter
    --     },
    -- },

}
