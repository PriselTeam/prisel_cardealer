local eSelectedVehicle = nil

function Prisel.CarDealer:OpenMenu()

    local vFrame = vgui.Create("Prisel.Frame")
    vFrame:SetSize(DarkRP.ScrW * 0.85, DarkRP.ScrH * 0.8)
    vFrame:Center()
    vFrame:SetTitle("Concessionnaire")
    vFrame:SetDescription("Bienvenue dans le concessionnaire, ici vous pouvez acheter des véhicules.")
    vFrame:MakePopup()

    if LocalPlayer():HasAdminMode() and Prisel.CarDealer.StaffHG[LocalPlayer():GetUserGroup()] then

        local vSettingsButton = vgui.Create("Prisel.Button", vFrame)
        vSettingsButton:SetSize(vFrame:GetWide() * 0.12, vFrame:GetTall() * 0.05)
        vSettingsButton:SetPos(vFrame:GetWide()*0.83, vFrame:GetTall()*0.0225)
        vSettingsButton:SetText("Paramètres")
        vSettingsButton:SetIcon("prisel_boutique/settings")

    end

    local vHorizontalScroller = vgui.Create( "DScrollPanel", vFrame )
    vHorizontalScroller:Dock( LEFT )
    vHorizontalScroller:SetWide(vFrame:GetWide() * 0.2)
    vHorizontalScroller:DockMargin(0, 79, 0, 0)
    vHorizontalScroller:GetVBar():SetWide(0)

    function vHorizontalScroller:Paint(w,h)
        draw.RoundedBox(0, 0, 0, w, h, DarkRP.Library.ColorNuance(DarkRP.Config.Colors["Secondary"], -10))
    end

    for k, v in ipairs(Prisel.CarDealer.Cars) do

        local vCarsButton = vgui.Create("DModelPanel", vHorizontalScroller)
        vCarsButton:Dock(TOP)
        vCarsButton:DockMargin(0, 0, 0, 0)
        vCarsButton:SetSize(vFrame:GetWide() * 0.2, vFrame:GetTall() * 0.2)
        vCarsButton:SetModel(list.Get("Vehicles")[v.class].Model)
        vCarsButton:SetFOV(70)
        vCarsButton:SetCamPos(Prisel.CarDealer.VectorView)

        function vCarsButton:LayoutEntity() return end

        local vLabelCars = vgui.Create("DLabel", vCarsButton)
        vLabelCars:SetY(vCarsButton:GetTall() * 0.8)
        vLabelCars:SetFont(DarkRP.Library.Font(8))
        vLabelCars:SetText(v.label)
        vLabelCars:SetTextColor(Color(255, 255, 255))
        vLabelCars:SetWide(vCarsButton:GetWide()*0.8)
        vLabelCars:SetContentAlignment(5)
        vLabelCars:CenterHorizontal()

    end

end