local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    for job, data in pairs(Config.Jobs) do
        exports['qb-target']:AddBoxZone(job .. "_service", data.coords, 1.0, 1.0, {
            name = job .. "_service",
            heading = 0,
            debugPoly = false,
            minZ = data.coords.z - 1,
            maxZ = data.coords.z + 1
        }, {
            options = {
                {
                    type = "client",
                    event = "service:openMenu",
                    icon = "fas fa-clipboard",
                    label = data.label,
                    job = job 
                }
            },
            distance = 2.0
        })
    end
end)

RegisterNetEvent('service:openMenu', function()
    local playerData = QBCore.Functions.GetPlayerData()
    local currentJob = playerData.job.name
    local jobData = Config.Jobs[currentJob]

    if not jobData then
        QBCore.Functions.Notify("No puedes usar esto.", "error")
        return
    end

    exports['qb-menu']:openMenu({
        {
            header = jobData.menuTitle,
            isMenuHeader = true
        },
        {
            header = Config.Options.onDuty,
            txt = "Ponte en servicio",
            params = {
                event = "service:setDuty",
                args = {duty = true}
            }
        },
        {
            header = Config.Options.offDuty,
            txt = "Sal del servicio",
            params = {
                event = "service:setDuty",
                args = {duty = false}
            }
        }
    })
end)

RegisterNetEvent('service:setDuty', function(data)
    local duty = data.duty
    TriggerServerEvent('service:updateDuty', duty)
end)
