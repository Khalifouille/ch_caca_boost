local isBoosted = false

RegisterCommand("sevider", function()
    local playerPed = PlayerPedId()

    if isBoosted then
        TriggerEvent("chat:addMessage", {
            color = {255, 0, 0},
            args = {"Système", "⛔ Tu es déjà boosté ! Patiente la fin de l'effet."}
        })
        return
    end

    RequestAnimDict("missfbi3ig_0")
    while not HasAnimDictLoaded("missfbi3ig_0") do Wait(10) end

    TaskPlayAnim(playerPed, "missfbi3ig_0", "shit_loop_trev", 8.0, -8, -1, 1, 0, false, false, false)

    FreezeEntityPosition(playerPed, true)
    SetPlayerControl(PlayerId(), false, 0)

    TriggerEvent("chat:addMessage", {
        color = {255, 255, 0},
        args = {"Système", "💩 Tu es en train de te vider... Patiente une minute."}
    })

    Wait(60000)

    ClearPedTasks(playerPed)
    FreezeEntityPosition(playerPed, false)
    SetPlayerControl(PlayerId(), true, 0)

    isBoosted = true
    RequestAnimSet("move_m@quick")
    while not HasAnimSetLoaded("move_m@quick") do Wait(10) end
    SetPedMovementClipset(playerPed, "move_m@quick", 5.0)

    TriggerEvent("chat:addMessage", {
        color = {0, 255, 0},
        args = {"Système", "💨 Tu cours maintenant 1.5x plus vite pendant 5 minutes !"}
    })

    Wait(5 * 60000)

    ResetPedMovementClipset(playerPed, 1.0)
    isBoosted = false

    TriggerEvent("chat:addMessage", {
        color = {255, 0, 0},
        args = {"Système", "⏳ Ton boost de vitesse est terminé."}
    })
end)
