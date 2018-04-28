--[[
Addon by Osmos[FR] : https://steamcommunity.com/id/ThePsyca/
Info : Public Addon
Version : Beta
]]--

local only
local whatframe = "shop"
local l = cclothes.lang.chooselang

local function C_Vet(npc)
    for k, v in pairs(cclothes.addvet) do
        local show = true

        if ( only == "male" or only == "female" ) and v.type != only then
                show = false
        end

        if not string.find(string.lower(v.name), string.lower(SearchBar:GetValue())) then
            show = false
        end

        if show then
            local ShowV = CVet:Add("DModelPanel")
            ShowV:SetSize(250, 400)
            ShowV:SetModel(v.models)
            ShowV:SetFOV(60)
            ShowV:SetCamPos(Vector(50, 0, 50))

            function ShowV:LayoutEntity(Entity)
                return
            end

            function ShowV:PaintOver(w, h)
            local kcol 
                if self.hover then
                    kcol = Color(150, 0 ,50)
                else
                    kcol = Color(226, 0 , 0)
                end
                draw.RoundedBox(5, 0, 360, w, 30, kcol)
                draw.SimpleText(cclothes.lang[l].txt1.." " .. v.name, "Trebuchet24", 35, 365, Color(255, 255, 255))
            end
            ShowV.OnCursorEntered = function (self)
            self.hover = true
            surface.PlaySound(cclothes.oncursor)
            end
            ShowV.OnCursorExited = function (self)
            self.hover = false
        end
            ShowV.DoClick = function()
             surface.PlaySound(cclothes.onclick)
                local advert = vgui.Create("DFrame")
                advert:SetSize(400, 150)
                advert:SetTitle("")
                advert:SetDraggable(true)
                advert:ShowCloseButton(true)
                advert:MakePopup()
                advert:Center()

                function advert:Paint(w, h)
                    draw.RoundedBox(5, 0, 0, w, h, Color(0, 0, 0, 250))
                    draw.RoundedBox(5, 0, 0, w, 30, Color(226, 0, 0))
                    draw.SimpleText(cclothes.lang[l].txt2, "Trebuchet18", 175, 3, Color(255, 255, 255))
                    draw.SimpleText(cclothes.lang[l].txt3.." " .. v.name .. " ?", "Trebuchet18", 100, 55, Color(255, 255, 255))
                end

                local yb = vgui.Create("DButton", advert)
                yb:SetSize(80, 40)
                yb:SetPos(50, 100)
                yb:SetText(cclothes.lang[l].txt4)

                yb.DoClick = function()
                 surface.PlaySound(cclothes.onclick)
                    net.Start("C::BuyV")
                    net.WriteUInt(k, 8)
                    net.WriteEntity(npc)
                    net.SendToServer()
                    FPanel:Remove()
                    advert:Remove()
                end

                local nb = vgui.Create("DButton", advert)
                nb:SetSize(80, 40)
                nb:SetPos(250, 100)
                nb:SetText(cclothes.lang[l].txt5)

                nb.DoClick = function()
                 surface.PlaySound(cclothes.onclick)
                    advert:Remove()
                end
            end
        end
    end
end

net.Receive("C::ReturnInv", function(len, pl)
    local inv = net.ReadTable()
    local npc = net.ReadEntity()
    CVet:Clear()

    for k, v in pairs(inv) do
        local InvShow = true

        if ( only == "male" or only == "female" ) and v.type != only then
                InvShow = false
        end

        if not string.find(string.lower(v.name), string.lower(SearchBar:GetValue())) then
            InvShow = false
        end

        if InvShow then
            local MinV = CVet:Add("DModelPanel")
            MinV:SetSize(250, 400)
            MinV:SetModel(v.models)
            MinV:SetFOV(60)
            MinV:SetCamPos(Vector(50, 0, 50))

            function MinV:LayoutEntity(Entity)
                return
            end

            function MinV:PaintOver(w, h)
                local kcol 

                if self.hover then
                    kcol = Color(150, 0 , 50)
                else
                    kcol = Color(226, 0 ,0)
                end
                draw.RoundedBox(5, 0, 360, w, 30, kcol)
                draw.SimpleText(cclothes.lang[l].txt6.." " .. v.name, "Trebuchet24", 35, 365, Color(255, 255, 255))
            end
            MinV.OnCursorEntered = function (self)
            self.hover = true
            surface.PlaySound(cclothes.oncursor)
             end
             MinV.OnCursorExited = function (self)
             self.hover = false
            end 
            MinV.DoClick = function()
                surface.PlaySound(cclothes.onclick)
                local advert = vgui.Create("DFrame")
                advert:SetSize(400, 150)
                advert:SetTitle("")
                advert:SetDraggable(true)
                advert:ShowCloseButton(true)
                advert:MakePopup()
                advert:Center()

                function advert:Paint(w, h)
                    draw.RoundedBox(5, 0, 0, w, h, Color(0, 0, 0, 250))
                    draw.RoundedBox(5, 0, 0, w, 30, Color(226, 0, 0))
                    draw.SimpleText(cclothes.lang[l].txt7, "Trebuchet18", 175, 3, Color(255, 255, 255))
                    draw.SimpleText(cclothes.lang[l].txt8.." " .. v.name .. " ?", "Trebuchet18", 100, 55, Color(255, 255, 255))
                end

                local yb = vgui.Create("DButton", advert)
                yb:SetSize(80, 40)
                yb:SetPos(50, 100)
                yb:SetText(cclothes.lang[l].txt4)

                yb.DoClick = function()
                surface.PlaySound(cclothes.onclick)
                    net.Start("C::EquipV")
                    net.WriteUInt(k, 8)
                    net.WriteEntity(npc)
                    net.SendToServer()
                    FPanel:Remove()
                    advert:Remove()
                end

                local nb = vgui.Create("DButton", advert)
                nb:SetSize(80, 40)
                nb:SetPos(250, 100)
                nb:SetText(cclothes.lang[l].txt5)

                nb.DoClick = function()
                    surface.PlaySound(cclothes.onclick)
                    advert:Remove()
                end
            end
        end
    end
end)

net.Receive("C::OpenPanel", function(len, pl)
    local npc = net.ReadEntity()
    FPanel = vgui.Create("DFrame")
    FPanel:SetSize(900, 600)
    FPanel:SetPos(ScrW() * 0.25, ScrH() * 1)
    FPanel:SetTitle("")
    FPanel:SetDraggable(true)
    FPanel:ShowCloseButton(true)
    FPanel:MakePopup()
    FPanel:MoveTo(ScrW() * 0.25, ScrH() * 0.25, 0.25, 0, 10)

    function FPanel:Paint(w, h)
        draw.RoundedBox(0, 0, 0, w, 100, Color(0, 0, 0, 253))
        draw.RoundedBox(5, 0, 0, w, 30, Color(226, 0, 0))
        draw.SimpleText(cclothes.lang[l].npc, "Trebuchet24", 400, 3, Color(255, 255, 255))
        draw.SimpleText(cclothes.lang[l].txt9, "Trebuchet18", 250, 50, Color(255, 255, 255))
        draw.SimpleText(cclothes.lang[l].txt10.." "..cclothes.lang[l].txt17, "Trebuchet18", 475, 75, Color(255, 255, 255))
        draw.SimpleText(cclothes.lang[l].txt10.." "..cclothes.lang[l].txt18, "Trebuchet18", 675, 75, Color(255, 255, 255))
    end

    SearchBar = vgui.Create("DTextEntry", FPanel)
    SearchBar:SetSize(150, 25)
    SearchBar:SetPos(250, 70)
    SearchBar:SetText("")

    SearchBar.OnEnter = function()
        if whatframe == "shop" then
            CVet:Clear()
            C_Vet(npc)
        else
            net.Start("C::OpenInv")
            net.WriteEntity(npc)
            net.SendToServer()
        end
    end

    local ShopB = vgui.Create("DButton", FPanel)
    ShopB:SetSize(100, 39)
    ShopB:SetPos(0, 31)
    ShopB:SetText(cclothes.lang[l].txt11)
    ShopB:SetTextColor(Color(255, 255, 255))

    function ShopB:Paint(w, h)
    local kcol 

        if self.hover then
            kcol = Color(150, 0, 50)
        else
            kcol = Color(226, 0, 0)
         end
        draw.RoundedBoxEx(15, 0, 0, w, h, kcol, false, true, false, false)
    end

    ShopB.DoClick = function()
    surface.PlaySound(cclothes.onclick)
        whatframe = "shop"
        CVet:Clear()
        C_Vet(npc)
    end
    ShopB.OnCursorEntered = function (self)
    self.hover = true
    surface.PlaySound(cclothes.oncursor)
    end
    ShopB.OnCursorExited = function (self)
    self.hover = false
    end

    local Mbox = vgui.Create("DCheckBox", FPanel)
    Mbox:SetPos(450, 75)

    if only == "male" then
        Mbox:SetValue(true)
    end

    Mbox.OnChange = function()
        if only == "male" then
            only = nil
        else
            only = "male"
        end

        if whatframe == "shop" then
            CVet:Clear()
            C_Vet(npc)
        else
            net.Start("C::OpenInv")
            net.WriteEntity(npc)
            net.SendToServer()
        end
    end

    local Fbox = vgui.Create("DCheckBox", FPanel)
    Fbox:SetPos(650, 75)

    if only == "female" then
        Fbox:SetValue(true)
    end

    Fbox.OnChange = function()
        if only == "female" then
            only = nil
        else
            only = "female"
        end

        if whatframe == "shop" then
            CVet:Clear()
            C_Vet(npc)
        else
            net.Start("C::OpenInv")
            net.WriteEntity(npc)
            net.SendToServer()
        end
    end

    local InvB = vgui.Create("DButton", FPanel)
    InvB:SetSize(100, 39)
    InvB:SetPos(101, 31)
    InvB:SetText(cclothes.lang[l].txt12)
    InvB:SetTextColor(Color(255, 255, 255))

    function InvB:Paint(w, h)
        local kcol 

        if self.hover then
            kcol = Color(150, 0 , 50)
        else
            kcol = Color(226, 0 , 0)
        end
        draw.RoundedBoxEx(15, 0, 0, w, h, kcol, false, true, false, false)
    end

    InvB.DoClick = function()
        surface.PlaySound(cclothes.onclick)
        whatframe = "inv"
        net.Start("C::OpenInv")
        net.WriteEntity(npc)
        net.SendToServer()
    end
    InvB.OnCursorEntered = function(self)
    self.hover = true
    surface.PlaySound(cclothes.oncursor)
    end 
    InvB.OnCursorExited = function(self)
    self.hover = false
    end

    local SPanel = vgui.Create("DPanel", FPanel)
    SPanel:SetSize(900, 500)
    SPanel:SetPos(0, 100)

    function SPanel:Paint(w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 250))
    end

    local CScrool = vgui.Create("DScrollPanel", SPanel)
    CScrool:Dock(FILL)
    CVet = vgui.Create("DIconLayout", CScrool)
    CVet:DockMargin(30, 30, 5, 5)
    CVet:Dock(FILL)
    CVet:SetSpaceX(5)
    CVet:SetSpaceY(5)
   
C_Vet(npc)
end)

--[[
Addon by Osmos[FR] : https://steamcommunity.com/id/ThePsyca/
Info : Public Addon
Version : Beta
]]--