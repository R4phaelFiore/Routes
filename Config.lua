Config = {}

-- NOME DA PERMISSAO PARA INICIAR A ROTA
Config.Permission = "nomedaperm.permissao" 

-- LOCAL AONDE PEGA A ROTA
Config.GetWork = { x = 722.68, y = -2016.35, z = 29.3 }

-- LOCAL DAS ROTAS
Config.InWork = {
    { x = 746.86,  y = -1399.93, z = 26.59 },
    { x = 1185.53, y = -1394.86, z = 35.14 },
    { x = 1144.98, y = -1008.43, z = 44.92 },
    { x = 1217.63, y = -416.44,  z = 67.76 },
    { x = 1044.48, y =  191.64,  z = 81.00 },
    { x = 1218.88, y =  1848.46, z = 78.95 },
    { x = 803.06,  y =  2175.30, z = 53.08 },
    { x = 201.83,  y = 2461.93,  z = 55.69 },
    { x = 1413.2,  y = 3663.99,  z = 34.41 },
    { x = 1888.62, y = 3892.83,  z = 33.18 },
    { x = 2553.98, y = 4668.53,  z = 33.99 },
    { x = 2335.92, y = 4859.52,  z = 41.81 },
    { x = 2251.87, y = 5155.23,  z = 57.89 },
    { x = 2931.99, y = 4624.32,  z = 48.73 },
    { x = 2521.38, y = 2629.80,  z = 37.96 },
    { x = 2559.69, y = 373.76,   z = 108.63},
    { x = 1890.87, y = -1019.36, z = 78.54 },
    { x = 1423.3,  y = -1502.16, z = 60.93 }

}

-- ITENS QUE SERAO PEGOS NA ROTA
Config.Itens = {
    { Item = 'Nome do Item', Qtd = { Min = 3, Max = 5 } },
    { Item = 'Nome do Item',  Qtd = { Min = 2, Max = 4 } },
    { Item = 'Nome do Item',   Qtd = { Min = 1, Max = 2 } }
}

return Config