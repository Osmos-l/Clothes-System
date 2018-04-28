--[[
Addon by Osmos[FR] : https://steamcommunity.com/id/ThePsyca/
Info : Public Addon
Version : Beta
]]--

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

local l = cclothes.lang.chooselang

function ENT:Initialize()
	self:SetModel(cclothes.models )
	self:SetHullType(HULL_HUMAN)
	self:SetHullSizeNormal()
	self:SetNPCState(NPC_STATE_SCRIPT)
	self:SetSolid(SOLID_BBOX)
	self:SetUseType(SIMPLE_USE)
	self:SetBloodColor(BLOOD_COLOR_RED)
end 

function ENT:AcceptInput(name, activator, caller)
	if name == "Use" and  caller:IsPlayer() then
		   if cclothes.teamrestrict[ team.GetName(caller:Team()) ] then DarkRP.notify(caller, 1, 4, cclothes.lang[l].txt19) return end
		net.Start("C::OpenPanel")
		net.WriteEntity(self)
		net.Send(caller)
	end 
end 

--[[
Addon by Osmos[FR] : https://steamcommunity.com/id/ThePsyca/
Info : Public Addon
Version : Beta
]]--