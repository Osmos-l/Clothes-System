--[[
Addon by Osmos[FR] : https://steamcommunity.com/id/ThePsyca/
Info : Public Addon
Version : Beta
]]--

ENT.Base = "base_ai"
ENT.Type = "ai"

ENT.PrintName = "Clothes SHOP"
ENT.Author = "Osmos Kesko"
ENT.Contact = "https://steamcommunity.com/id/ThePsyca/"
ENT.Instructions = "Appuyez sur E"
ENT.Category = "NLF"
ENT.Spawnable = true 

ENT.AutomaticFrameAdvance = true

function ENT:PhysicsCollide(data, physobj)
end

function ENT:PhysicsUpdate(physobj)
end

function ENT:SetAutomaticFrameAdvance(bUsingAnim)
	self.AutomaticFrameAdvance = bUsingAnim
end

--[[
Addon by Osmos[FR] : https://steamcommunity.com/id/ThePsyca/
Info : Public Addon
Version : Beta
]]--