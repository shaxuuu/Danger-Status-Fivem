Wait(3000)

RegisterCommand( langPack[Config.language].dangerCommand, function ( source, args )
    if( ESX.PlayerData.job.name ~= Config.policeJobName or ESX.PlayerData.job.grade < Config.policeJobGrade ) then return end

    local kodZagrozenia
    if( args[1] == "0" )then
        kodZagrozenia = { code = langPack[Config.language].greenCode, color = "8835351" }
    elseif ( args[1] == "1" ) then
        kodZagrozenia = { code = langPack[Config.language].yellowCode, color = "13422910" }
    elseif ( args[1] == "2" ) then
        kodZagrozenia = { code = langPack[Config.language].redCode, color = "10682368" }
    elseif ( args[1] == "3" ) then
        kodZagrozenia = { code = langPack[Config.language].blackCode, color = "0" }
    else
        return
    end

    TriggerServerEvent('zagrozenia:sendToWebhook', { code = kodZagrozenia.code, color = kodZagrozenia.color, player = GetPlayerServerId(PlayerId()) } )
    
end, false)




