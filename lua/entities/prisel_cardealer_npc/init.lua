AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/breen.mdl")
	self:SetBodygroup(1,1)
	self:SetSolid(SOLID_BBOX)

	self:SetHullType(HULL_HUMAN)
	self:SetHullSizeNormal()

	self:SetNPCState(NPC_STATE_SCRIPT)
	self:CapabilitiesAdd(CAP_ANIMATEDFACE)
	self:SetMoveType(MOVETYPE_NONE)

	self:SetUseType(SIMPLE_USE)
	self:DropToFloor()
end

Prisel.CarDealer.Cooldowns = Prisel.CarDealer.Cooldowns or {}
Prisel.CarDealer.Cooldowns.ENT = Prisel.CarDealer.Cooldowns.ENT or {}

function ENT:Use(pCaller)
    if not IsValid(pCaller) or not pCaller:IsPlayer() then return end
    if not pCaller:Alive() then return end

    if Prisel.CarDealer.Cooldowns.ENT[pCaller:SteamID64()] and Prisel.CarDealer.Cooldowns.ENT[pCaller:SteamID64()] > CurTime() then
        DarkRP.notify(pCaller, 1, 4, "Veuillez patienter avant de réutiliser le concessionnaire.")
        return
    end

    Prisel.CarDealer.Cooldowns.ENT[pCaller:SteamID64()] = CurTime() + 1.5

    net.Start("Prisel:CarDealer:UseEntity")
    net.Send(pCaller)
end