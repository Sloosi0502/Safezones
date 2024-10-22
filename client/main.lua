local zones = {}

local function zoneInside(id)
    return function()
        local playerPed = PlayerPedId()
        local allowedJobs = {
            "police",
            "ambulance",
            "sheriff",
            "fib",
            "doj"
        }

        for k, v in pairs(allowedJobs) do
            if ESX.PlayerData.job.name == v then
                return
            end
        end

        SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true)
        SetCanAttackFriendly(playerPed, true, false)
        NetworkSetFriendlyFireOption(true)
        SetEntityInvincible(playerPed, true)
    end
end

local function zoneEnter(id)
    return function()

    end
end

local function zoneExit(id)
    return function()

    end
end

CreateThread(function()
    for k, v in pairs(Config.Zones) do
        zones[k] = lib.zones.poly({
            name = v.name,
            points = v.points,
            thickness = v.thickness,
            debug = false,
            inside = zoneInside(k),
            onEnter = zoneEnter(k),
            onExit = zoneExit(k)
        })
    end
end)