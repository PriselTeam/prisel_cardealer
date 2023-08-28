net.Receive("Prisel:CarDealer:UseEntity", function()
    Prisel.CarDealer:OpenMenu()
end)

net.Receive("Prisel:CarDealer:SendCarList", function()

    local iToRead = net.ReadUInt(32)

    local tCars = {}
    
    for i = 1, iToRead do
        local iCarID = net.ReadUInt(32)
        local sCarClass = net.ReadString()
        local sCarLabel = net.ReadString()
        local iCarPrice = net.ReadUInt(32)
        local bEnabled = net.ReadBool()

        tCars[i] = {
            id = iCarID,
            class = sCarClass,
            label = sCarLabel,
            -- model = sCarModel,
            price = iCarPrice,
            enabled = bEnabled
        }
    end

    Prisel.CarDealer.Cars = tCars
    
end)