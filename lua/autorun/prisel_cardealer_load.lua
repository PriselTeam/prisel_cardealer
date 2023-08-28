Prisel = Prisel or {}

Prisel.CarDealer = Prisel.CarDealer or {}
Prisel.CarDealer.Cooldowns = Prisel.CarDealer.Cooldowns or {}
Prisel.CarDealer.Cars = Prisel.CarDealer.Cars or {}

local function Include(f) return include("prisel_cardealer/"..f) end
local function AddLuaFile(f) return AddCSLuaFile("prisel_cardealer/"..f) end
local function IncludeAdd(f) return Include(f), AddLuaFile(f) end

IncludeAdd("config.lua")

if SERVER then

    Include("server/sv_functions.lua")
    Include("server/sv_hooks.lua")
    Include("server/sv_network.lua")

    AddLuaFile("client/cl_functions.lua")
    AddLuaFile("client/cl_hooks.lua")
    AddLuaFile("client/cl_network.lua")

else

    Include("client/cl_functions.lua")
    Include("client/cl_hooks.lua")
    Include("client/cl_network.lua")

end

if SERVER then
    hook.Run("Prisel.CarDealer.Loaded")
end