--[[
Addon by Osmos[FR] : https://steamcommunity.com/id/ThePsyca/
Info : Public Addon
Version : Beta
]]--

include("shared.lua")

local l = cclothes.lang.chooselang

surface.CreateFont( "C_Font", {

	font = "Trebuchet24	",
	size = 30,
	weight = 1000,
} ) 

function ENT:Draw()
	self:DrawModel()

	local eye = LocalPlayer():EyeAngles()
	local ang = Angle( 0, eye.y -90, 90)
	local pos = self:GetPos() +  Vector( 0, 0, 80 )

	if self:GetPos():Distance( LocalPlayer():GetPos() ) > 500 then return end
	cam.Start3D2D(pos + Vector(0, 0 , math.sin( CurTime() ) *1.5 ), ang, 0.2)
		draw.SimpleTextOutlined(cclothes.lang[l].npc, "C_Font", 0, 0, Color( 255, 255, 255, 220), TEXT_ALIGN_CENTER, 0, 1, Color(0,0,0) )
	cam.End3D2D()
end 

--[[
Addon by Osmos[FR] : https://steamcommunity.com/id/ThePsyca/
Info : Public Addon
Version : Beta
]]--