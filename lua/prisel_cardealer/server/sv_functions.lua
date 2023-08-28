require("mysqloo")

local db = mysqloo.connect("109.122.198.111", "prisel_v3", "P[kUbSp]L7N1-D1V", "prisel_v3", 3306)

function Prisel.CarDealer:SetupDatabase()
    function db:onConnected()
        print("Prisel - Cardealer -> Connected to database!")

        local sQuery = "CREATE TABLE prisel_car_configs (id INT NOT NULL PRIMARY KEY, carClass VARCHAR(255) NOT NULL, carLabel VARCHAR(255) NOT NULL DEFAULT 'base_vehicle', price INT DEFAULT 0, isEnabled TINYINT(1) NOT NULL DEFAULT 1)"
        local q = self:query(sQuery)

        function q:onSuccess()
            print("Prisel - Cardealer -> Created table prisel_car_configs")
        end

        function q:onError(err)
            print("Prisel - Cardealer -> Error creating table prisel_car_configs: " .. err)
        end

        q:start()

    end

    function db:onConnectionFailed(err)
        print("Prisel - Cardealer -> Connection to database failed: " .. err)
    end

    db:connect()
end