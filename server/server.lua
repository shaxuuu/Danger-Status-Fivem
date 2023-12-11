ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('zagrozenia:sendToWebhook')
AddEventHandler('zagrozenia:sendToWebhook', function (data)
    

    local xplayer = ESX.GetPlayerFromId( data.player )

    local embed = {
        {
            ["color"] = data.color,
            ["description"] = langPack[Config.language].name .. ": **" .. xplayer.name .. "**\n"..langPack[Config.language].grade..": **" .. xplayer.job.grade_label .. "**\n"..langPack[Config.language].description..": **" .. data.code .. "!**",
            ["footer"] = {
                ["text"] = Config.serverName .. "  -  " .. os.date("%d.%m.%Y  %H:%M"),
                ["icon_url"] = Config.serverLogo
            }
        }
    }
    
    PerformHttpRequest(Config.webHook, function(err, text, headers) end, 'POST', json.encode({username = langPack[Config.language].webHookName, embeds = embed}), { ['Content-Type'] = 'application/json' })

end)