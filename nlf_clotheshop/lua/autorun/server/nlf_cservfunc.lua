--[[
Addon by Osmos[FR] : https://steamcommunity.com/id/ThePsyca/
Info : Public Addon
Version : Beta
]]--


util.AddNetworkString("C::OpenPanel")
util.AddNetworkString("C::BuyV")
util.AddNetworkString("C::OpenInv")
util.AddNetworkString("C::ReturnInv")
util.AddNetworkString("C::EquipV")

local l = cclothes.lang.chooselang

local function C_CreateTable()
    if not file.IsDir("clothes_inv", "DATA") then
        file.CreateDir("clothes_inv")
    end
end

hook.Add("InitPostEntity", "C::Instaltable", timer.Simple(0.2, function()
    C_CreateTable()
end))

local function c_addinv(ply, k)
    if cclothes.teamrestrict[ team.GetName(ply:Team()) ] then DarkRP.notify(ply, 1, 4, cclothes.lang[l].txt19) return end
    local othertable = {}

    othertable[1] = {
        name = cclothes.addvet[k].name,
        models = cclothes.addvet[k].models,
        type = cclothes.addvet[k].type
    }

    if not file.IsDir("clothes_inv/" .. ply:SteamID64(), "DATA") then
        file.CreateDir("clothes_inv/" .. ply:SteamID64())
    end

    if file.Exists("clothes_inv/" .. ply:SteamID64() .. "/inv.txt", "DATA") then
        local read = file.Read("clothes_inv/" .. ply:SteamID64() .. "/inv.txt", "DATA")
        local readtable = util.JSONToTable(read)
        table.insert(readtable, othertable[1])
        local tstring = util.TableToJSON(readtable)
        file.Write("clothes_inv/" .. ply:SteamID64() .. "/inv.txt", tstring)
    else
        local tstring = util.TableToJSON(othertable)
        file.Write("clothes_inv/" .. ply:SteamID64() .. "/inv.txt", tstring)
    end

    file.Write("clothes_inv/" .. ply:SteamID64() .. "/lastmodel.txt", cclothes.addvet[k].models)
end

local function c_checkhavemodels(ply, x)
    if file.Exists("clothes_inv/" .. ply:SteamID64() .. "/inv.txt", "DATA") then
        local readstring = file.Read("clothes_inv/" .. ply:SteamID64() .. "/inv.txt", "DATA")
        local readtable = util.JSONToTable(readstring)

        for k, v in pairs(readtable) do
            if v.models == cclothes.addvet[x].models then return true end
        end

        return false
    else
        return false
    end
end

net.Receive("C::BuyV", function(len, pl)
    if cclothes.teamrestrict[ team.GetName(pl:Team()) ] then DarkRP.notify(pl, 1, 4, cclothes.lang[l].txt19) return end
    local k = net.ReadUInt(8)
    local npc = net.ReadEntity()
    if not npc:GetClass() == "nlf_clothesnpc" then return end

    if pl:GetModel() == cclothes.addvet[k].models or c_checkhavemodels(pl, k) then
        DarkRP.notify(pl, 1, 4, cclothes.lang[l].txt13)

        return
    end

    if pl:GetPos():DistToSqr(npc:GetPos()) > 200 then
        if pl:getDarkRPVar("money") < cclothes.addvet[k].prix then
            DarkRP.notify(pl, 1, 4, cclothes.lang[l].txt14)

            return
        end

        pl:addMoney("-" .. cclothes.addvet[k].prix)
        pl:SetModel(cclothes.addvet[k].models)
        DarkRP.notify(pl, 0, 4, cclothes.lang[l].txt15)
        c_addinv(pl, k)
    end
end)

net.Receive("C::OpenInv", function(len, pl)
    if cclothes.teamrestrict[ team.GetName(pl:Team()) ] then DarkRP.notify(pl, 1, 4, cclothes.lang[l].txt19) return end
    local npc = net.ReadEntity()

    if file.Exists("clothes_inv/" .. pl:SteamID64() .. "/inv.txt", "DATA") then
        local fil = file.Read("clothes_inv/" .. pl:SteamID64() .. "/inv.txt", "DATA")
        local tab = util.JSONToTable(fil)
        net.Start("C::ReturnInv")
        net.WriteTable(tab)
        net.WriteEntity(npc)
        net.Send(pl)
    else
        local tab = {}
        net.Start("C::ReturnInv")
        net.WriteTable(tab)
        net.WriteEntity(npc)
        net.Send(pl)
    end
end)

net.Receive("C::EquipV", function(len, pl)
        if cclothes.teamrestrict[ team.GetName(pl:Team()) ] then DarkRP.notify(pl, 1, 4, cclothes.lang[l].txt19) return end
    local k = net.ReadUInt(8)
    local npc = net.ReadEntity()
    if not npc:GetClass() == "nlf_clothesnpc" then return end

    if pl:GetPos():DistToSqr(npc:GetPos()) > 200 then
        local fil = file.Read("clothes_inv/" .. pl:SteamID64() .. "/inv.txt", "DATA")
        local t = util.JSONToTable(fil)

        if pl:GetModel() == t[k].models then
            DarkRP.notify(pl, 1, 4, cclothes.lang[l].txt13)

            return
        end

        pl:SetModel(t[k].models)
        DarkRP.notify(pl, 0, 4, cclothes.lang[l].txt16)
        pl.cmodel = t[k].models
        file.Write("clothes_inv/" .. pl:SteamID64() .. "/lastmodel.txt", t[k].models)
    end
end)

local function c_dontchangv(ply)
    if cclothes.teamrestrict[ team.GetName(ply:Team()) ] then return end
    if ply.cmodel ~= nil and cclothes.samemodelonspawn then
        timer.Simple(0.1, function()
            ply:SetModel(ply.cmodel)
        end)
    elseif ply.cmodel == nil and cclothes.initspawnoldmodel then
        if file.Exists("clothes_inv/" .. ply:SteamID64() .. "/lastmodel.txt", "DATA") then
            local fil = file.Read("clothes_inv/" .. ply:SteamID64() .. "/lastmodel.txt", "DATA")

            timer.Simple(0.5, function()
                ply:SetModel(fil)
            end)
        end
    end
end

hook.Add("PlayerSetModel", "c_dontchangv", c_dontchangv)

--[[
Addon by Osmos[FR] : https://steamcommunity.com/id/ThePsyca/
Info : Public Addon
Version : Beta
]]--
