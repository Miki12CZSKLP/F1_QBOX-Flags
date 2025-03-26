local QBCore = exports['qbx-core']:GetCore()

RegisterCommand("flag", function(source, args, rawCommand)
    local Player = QBCore.Functions.GetPlayer(source)
    
    -- Change "raceofficer" to the required job
    if not Player or Player.PlayerData.job.name ~= "raceofficer" then
        TriggerClientEvent("chat:addMessage", source, { args = { "^1System", "You are not authorized to use this command!" } })
        return
    end

    if #args < 1 then
        TriggerClientEvent("chat:addMessage", source, { args = { "^1System", "Usage: /flag [flag] (playerName)" } })
        return
    end

    local flag = args[1]:lower()
    local target = args[2] and args[2] or nil

    local validFlags = {
        ["yellow"] = "Yellow Flag",
        ["doubleyellow"] = "Double Yellow Flag",
        ["green"] = "Green Flag",
        ["red"] = "Red Flag",
        ["blue"] = "Blue Flag",
        ["black"] = "Black Flag",
        ["orange"] = "Black Flag with Orange Circle",
        ["white"] = "White Flag",
        ["checkered"] = "Checkered Flag"
    }

    if validFlags[flag] then
        TriggerClientEvent("showFlag", -1, validFlags[flag], target)
        print("^3[F1 FLAGS]^7 Flag " .. validFlags[flag] .. " was raised" .. (target and " for player " .. target or ""))
    else
        TriggerClientEvent("chat:addMessage", source, { args = { "^1System", "Invalid flag! Use one of: yellow, doubleyellow, green, red, blue, black, orange, white, checkered" } })
    end
end, false)