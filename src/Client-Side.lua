local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
src = Tunnel.getInterface(GetCurrentResourceName())

local Blips = {}
local InService = false

CreateThread(function()

    local CoordBlip = Config.GetWork
    local x,y,z = CoordBlip.x, CoordBlip.y, CoordBlip.z

    while true do

        local Ped = PlayerPedId()
        local Entity = GetEntityCoords(Ped)
        local Distance = #(Entity - vector3(x,y,z))

        if Distance < 5 and not InService then
            DrawMarker(1, x,y,z -1, 0,0,0, 0,0,0, 1.3,1.3,1.3, 255,255,0,155, false,false,2,false)
            if Distance <= 1 then
                if IsControlJustPressed(0, 38) then
                    InService = true
                    AtWork()
                    ExitWork()
                    TriggerEvent("Notify", "sucesso", "Serviço Iniciado", 8000)
                end
            end
        end
        Citizen.Wait(5)
    end
end)
function AtWork()
    CreateThread(function()

        local InitBlip = 1
        local LastBlip = 0
       
        while InService do
            local Blip = Config.InWork[InitBlip]
            local BlipMarker = Blips[InitBlip]

            if Blip then
                local Ped = PlayerPedId()
                local CoordPlaces = GetEntityCoords(Ped)
                local DistancePlaces = #(CoordPlaces - vector3(Blip.x,Blip.y,Blip.z))

                if not BlipMarker then
                    BlipMarker = AddBlipForCoord(Blip.x, Blip.y, Blip.z)
                    SetBlipSprite(BlipMarker, 280)
                    SetBlipColour(BlipMarker, 5)
                    SetBlipScale(BlipMarker, 0.7)
                    SetBlipRoute(BlipMarker, true)
                    SetBlipAsShortRange(BlipMarker, false)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString("Coleta")
                    EndTextCommandSetBlipName(BlipMarker)
                    Blips[InitBlip] = BlipMarker
                end

                if DistancePlaces < 25 then
                    DrawMarker(1, Blip.x,Blip.y,Blip.z -1, 0,0,0, 0,0,0, 1.3,1.3,1.3, 255,255,0,155, false,false,2,false)
                    if DistancePlaces <= 1 then
                        if IsControlJustPressed(0, 38) then
                            src.PaymentItens()
                            InitBlip = InitBlip + 1
                            RemoveBlip(BlipMarker)
                            if InitBlip > #Config.InWork then
                                InitBlip = 1
                                TriggerEvent("Notify", "aviso", "Suas Rota Foi Reniciada", 8000)
                                Blips = {}   
                            end
                        end
                    end
                end
            end
            Citizen.Wait(5)
        end
    end)    
end
function ExitWork()
    CreateThread(function()
        while InService do
            if IsControlJustPressed(0, 168) then
                InService = false
                ClearPedTasks(PlayerPedId())
                for _, BlipMarker in pairs(Blips) do
                    if DoesBlipExist(BlipMarker) then
                        RemoveBlip(BlipMarker)
                    end
                end
                Blips = {}
                TriggerEvent("Notify", "aviso", "Serviço Finalizado", 8000)
                return
            end   
            Citizen.Wait(5)
        end
    end)
end