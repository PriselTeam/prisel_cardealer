require("mysqloo")

local db = mysqloo.connect("109.122.198.111", "prisel_v3", "P[kUbSp]L7N1-D1V", "prisel_v3", 3306)

function Prisel.CarDealer:SetupDatabase()
    function db:onConnected()

        local sQuery = "CREATE TABLE prisel_car_configs (id INT NOT NULL PRIMARY KEY, carClass VARCHAR(255) NOT NULL, carLabel VARCHAR(255) NOT NULL DEFAULT 'base_vehicle', price INT DEFAULT 0, isEnabled TINYINT(1) NOT NULL DEFAULT 1)"
        local q = self:query(sQuery)

        q:start()

    end

    function db:onConnectionFailed(err)
        print("Prisel - Cardealer -> Connection to database failed: " .. err)
    end

    db:connect()
end

function Prisel.CarDealer:UpdateCarList()
    Prisel.CarDealer.Cars = {}

    local sQuery = "SELECT * FROM prisel_car_configs"
    local q = db:query(sQuery)

    function q:onSuccess(data)
        for _, row in pairs(data) do
            local car = {}
            car.id = tonumber(row.id)
            car.carClass = row.carClass
            car.carLabel = row.carLabel
            car.price = tonumber(row.price)
            car.isEnabled = tobool(row.isEnabled)

            Prisel.CarDealer.Cars[car.id] = car
        end

        print("Prisel - Cardealer -> Updated car list")
    end

    function q:onError(err)
        print("Prisel - Cardealer -> Error while updating car list: " .. err)
    end
end

Prisel.CarDealer:UpdateCarList()