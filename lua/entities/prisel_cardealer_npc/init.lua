AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/props_junk/PopCan01a.mdl")
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