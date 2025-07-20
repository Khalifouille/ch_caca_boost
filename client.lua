RegisterCommand("sevider", function()
    local playerPed = PlayerPedId()

    RequestAnimDict("missfbi3ig_0")
    while not HasAnimDictLoaded("missfbi3ig_0") do
        Wait(10)
    end

    TaskPlayAnim(playerPed, "missfbi3ig_0", "shit_loop_trev", 8.0, -8, -1, 1, 0, false, false, false)

    FreezeEntityPosition(playerPed, true)
    SetPlayerControl(PlayerId(), false, 0)

    TriggerEvent("chat:addMessage", {
        color = {255, 255, 0},
        multiline = true,
        args = {"Système", "💩 Tu es en train de te vider... Patiente une minute."}
    })

    Wait(60000)

    ClearPedTasks(playerPed)
    FreezeEntityPosition(playerPed, false)
    SetPlayerControl(PlayerId(), true, 0)


    local originalSprintMultiplier = GetRunSprintMultiplierForPlayer(PlayerId())
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.5)

    TriggerEvent("chat:addMessage", {
        color = {0, 255, 0},
        multiline = true,
        args = {"Système", "💨 Tu cours maintenant 1.5x plus vite pendant 5 minutes !"}
    })

    Wait(5 * 60000)
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)

    TriggerEvent("chat:addMessage", {
        color = {255, 0, 0},
        multiline = true,
        args = {"Système", "⏳ Ton boost de vitesse est terminé."}
    })
end)
