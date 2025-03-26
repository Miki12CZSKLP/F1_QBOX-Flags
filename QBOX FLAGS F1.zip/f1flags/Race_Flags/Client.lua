RegisterNetEvent("showFlag")
AddEventHandler("showFlag", function(flag, target)
    local playerId = PlayerId()
    if target == nil or GetPlayerName(playerId) == target then
        ShowNotification("~y~Flag raised: ~s~" .. flag)

        -- Animation for flag display
        RequestAnimDict("mp_common")
        while not HasAnimDictLoaded("mp_common") do
            Wait(100)
        end
        TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_CLIPBOARD", 0, true)
        Wait(5000)
        ClearPedTasks(PlayerPedId())
    end
end)

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end
