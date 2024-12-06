Config = {}

Config.Jobs = {
    saloon = {
        coords = vector3(7358.51, 350.95, 58.88), -- Coordenadas del punto
        label = "Fichar",       -- Texto del target
        menuTitle = "Gestión de Servicio", -- Título del menú para el trabajo
        webhook = "https://discord.com/api/webhooks/1314643910290571375/cEgdjLyMnYf_XwxlAQSxkTE9tWoEZyHcwHhNbs2YQVWWUSj9hJbclDBRNO_rH7Fx0oyO" -- Webhook específica para saloon
    },
    burgershot = {
        coords = vector3(6876.05, 431.73, 58.58),
        label = "Fichar",
        menuTitle = "Gestión de Servicio EMS",
        webhook = "https://discord.com/api/webhooks/1314641837700550696/l5gSmjjn702--X3H63zh3dVjNiJ-d72luDhAv5-QiHWChE-lZFmTPDXm9AZwIvlbnRrd"
    }
}

Config.Options = {
    onDuty = "Entrar en servicio",
    offDuty = "Salir de servicio"
}
