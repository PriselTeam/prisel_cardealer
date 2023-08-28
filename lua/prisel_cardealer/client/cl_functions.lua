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
end