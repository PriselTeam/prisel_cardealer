hook.Add("Prisel.CarDealer.Loaded", "Prisel.CarDealer.Loaded", function()
    print("Car Dealer Loaded")
    Prisel.CarDealer:SetupDatabase()
end)