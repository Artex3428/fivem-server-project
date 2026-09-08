return {
    serverName = 'Server',
    defaultSpawn = vec4(-1037.92, -2738.03, 20.17, 3314),
    notifyPosition = 'top-right', -- 'top' | 'top-right' | 'top-left' | 'bottom' | 'bottom-right' | 'bottom-left'
    ---@type { name: string, amount: integer, metadata: fun(source: number): table }[]
    starterItems = { -- Character starting items
        { name = 'id_card', amount = 1, metadata = function(source)
                assert(GetResourceState('qbx_idcard') == 'started', 'qbx_idcard resource not found. Required to give an id_card as a starting item')
                return exports.qbx_idcard:GetMetaLicense(source, {'id_card'})
            end
        },
    }
}
