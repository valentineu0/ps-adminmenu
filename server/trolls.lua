-- Freeze Player
local frozen = false
RegisterNetEvent('ps-adminmenu:server:FreezePlayer', function(data, selectedData)
    if not CheckPerms(data.perms) then return end
    local src = source

    local target = selectedData["Player"].value

    local ped = GetPlayerPed(target)
    local Player = QBCore.Functions.GetPlayer(target)

    if not frozen then
        frozen = true
        FreezeEntityPosition(ped, true)
        QBCore.Functions.Notify(src, locale("Frozen", Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname .. " | " .. Player.PlayerData.citizenid), 'Success', 7500)
    else
        frozen = false
        FreezeEntityPosition(ped, false)
        QBCore.Functions.Notify(src, locale("deFrozen", Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname .. " | " .. Player.PlayerData.citizenid), 'Success', 7500)

    end
    if Player == nil then return QBCore.Functions.Notify(src, locale("not_online"), 'error', 7500) end

end)