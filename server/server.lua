local QBCore = exports['qb-core']:GetCoreObject()

local activeSessions = {} 

RegisterNetEvent('service:updateDuty', function(duty)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    local citizenId = Player.PlayerData.citizenid
    local jobName = Player.PlayerData.job.name

    if not Config.Jobs[jobName] then
        TriggerClientEvent('QBCore:Notify', src, "No tienes acceso a esta acción.", "error")
        return
    end

    if duty then

        activeSessions[citizenId] = {
            start_time = os.date('%Y-%m-%d %H:%M:%S'),
            job_name = jobName
        }
        TriggerClientEvent('QBCore:Notify', src, "Ahora estás en servicio.", "success")
        sendDiscordLog(citizenId, jobName, "Entró en servicio.")
    else
        local session = activeSessions[citizenId]
        if session then
            local startTime = session.start_time
            local endTime = os.date('%Y-%m-%d %H:%M:%S')
            local duration = calculateDuration(startTime, endTime)

            exports.oxmysql:insert('INSERT INTO job_service_logs (citizenid, job_name, start_time, end_time, duration) VALUES (?, ?, ?, ?, ?)', {
                citizenId,
                jobName,
                startTime,
                endTime,
                duration
            })

            activeSessions[citizenId] = nil

            TriggerClientEvent('QBCore:Notify', src, "Has salido del servicio.", "success")
            sendDiscordLog(citizenId, jobName, string.format("Salió del servicio. Duración: %d minutos.", duration))
        else
            TriggerClientEvent('QBCore:Notify', src, "No tienes una sesión activa.", "error")
        end
    end
end)

function calculateDuration(startTime, endTime)
    local startTimestamp = os.time({year=tonumber(startTime:sub(1, 4)), month=tonumber(startTime:sub(6, 7)), day=tonumber(startTime:sub(9, 10)), hour=tonumber(startTime:sub(12, 13)), min=tonumber(startTime:sub(15, 16)), sec=tonumber(startTime:sub(18, 19))})
    local endTimestamp = os.time({year=tonumber(endTime:sub(1, 4)), month=tonumber(endTime:sub(6, 7)), day=tonumber(endTime:sub(9, 10)), hour=tonumber(endTime:sub(12, 13)), min=tonumber(endTime:sub(15, 16)), sec=tonumber(endTime:sub(18, 19))})
    return math.floor((endTimestamp - startTimestamp) / 60)
end

function sendDiscordLog(citizenId, jobName, message)
    local webhook = Config.Jobs[jobName].webhook
    if not webhook or webhook == "" then return end

    local Player = QBCore.Functions.GetPlayerByCitizenId(citizenId)
    if not Player then return end

    local charInfo = Player.PlayerData.charinfo
    local fullName = charInfo.firstname .. " " .. charInfo.lastname

    local embed = {
        {
            ["color"] = 3447003, -- Azul
            ["title"] = "Registro de Servicio",
            ["description"] = string.format("**Nombre:** %s\n**CitizenID:** %s\n**Trabajo:** %s\n**Acción:** %s", fullName, citizenId, jobName, message),
            ["footer"] = {
                ["text"] = os.date('%Y-%m-%d %H:%M:%S')
            }
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({
        username = "Sistema de Servicio",
        embeds = embed
    }), { ['Content-Type'] = 'application/json' })
end
