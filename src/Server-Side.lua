local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface(GetCurrentResourceName(), src)

function src.CheckPerm()
    local source = source
    local user_id = vRP.getUserId(source)
    return vRP.hasPermission(user_id, Config.Permission)
end
function src.PaymentItens()
    local source = source
    local user_id = vRP.getUserId(source)

    vRPclient._playAnim(source, false, {{ "amb@medic@standing@tendtodead@idle_a", 'idle_a' }}, true)
    SetTimeout(5000, function()
        vRPclient._stopAnim(source, false)
        for k, v in pairs(Config.Itens) do
            local RandomQtd = math.random(v.Qtd.Min, v.Qtd.Max)
            
            vRP.giveInventoryItem(user_id, v.Item, RandomQtd)
            TriggerClientEvent("Notify", source, "sucesso", "Foi Encontrado <b>".. RandomQtd .."</b> ".. v.Item .. "")
        end
    end)
end
print('^2SCRIPT TOTALMENTE FREE ^1BY R4PHAEL FIORE^0')