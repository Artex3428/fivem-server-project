local config = require 'config.client'
local defaultSpawn = require 'config.shared'.defaultSpawn

if config.characters.useExternalCharacters then return end

local previewCam
local randomLocation = config.characters.locations[math.random(1, #config.characters.locations)]

local randomPeds = {
    {
        model = `mp_m_freemode_01`,
        headBlend = {
            skinSecond = 0,
            shapeSecond = 0,
            shapeThird = 0,
            shapeFirst = 1,
            skinThird = 0,
            thirdMix = 0.0,
            skinMix = 0.0,
            skinFirst = 0,
            shapeMix = 0,
        },
        hair = {
            texture = 0,
            style = 19,
            color = 3,
            highlight = 0,
        },
        headOverlays = {
            chestHair = {opacity = 0, secondColor = 0, color = 0, style = 0},
            moleAndFreckles = {opacity = 0, secondColor = 0, color = 0, style = 0},
            bodyBlemishes = {opacity = 0, secondColor = 0, color = 0, style = 0},
            blemishes = {opacity = 0, secondColor = 0, color = 0, style = 0},
            lipstick = {opacity = 0, secondColor = 0, color = 0, style = 0},
            ageing = {opacity = 0, secondColor = 0, color = 0, style = 0},
            makeUp = {opacity = 0, secondColor = 0, color = 0, style = 0},
            blush = {opacity = 0, secondColor = 0, color = 0, style = 0},
            sunDamage = {opacity = 0, secondColor = 0, color = 0, style = 0},
            eyebrows = {opacity = 1.0, secondColor = 0, color = 3, style = 2},
            beard = {opacity = 0, secondColor = 0, color = 0, style = 0},
            complexion = {opacity = 0, secondColor = 0, color = 0, style = 0},
        },
        faceFeatures = {
            eyeBrownHigh = 0.0,
            noseWidth = 0.0,
            cheeksWidth = 0.0,
            neckThickness = 0.0,
            chinBoneLenght = 0.0,
            nosePeakHigh = 0.0,
            eyeBrownForward = 0.0,
            eyesOpening = 0.0,
            chinBoneSize = 0.0,
            jawBoneBackSize = 0.0,
            lipsThickness = 0.0,
            chinBoneLowering = 0.0,
            noseBoneHigh = 0.0,
            jawBoneWidth = 0.0,
            cheeksBoneHigh = 0.0,
            cheeksBoneWidth = 0.0,
            nosePeakLowering = 0.0,
            noseBoneTwist = 0.0,
            chinHole = 0.0,
            nosePeakSize = 0.0,
        },
        components = {
            {texture = 0, component_id = 0, drawable = 0},
            {texture = 0, component_id = 1, drawable = 0},
            {texture = 0, component_id = 2, drawable = 19},
            {texture = 0, component_id = 3, drawable = 1},
            {texture = 1, component_id = 4, drawable = 0},
            {texture = 0, component_id = 5, drawable = 0},
            {texture = 0, component_id = 6, drawable = 1},
            {texture = 0, component_id = 7, drawable = 0},
            {texture = 2, component_id = 8, drawable = 0},
            {texture = 0, component_id = 9, drawable = 0},
            {texture = 0, component_id = 10, drawable = 0},
            {texture = 2, component_id = 11, drawable = 7},
        },
        props = {
            {texture = -1, prop_id = 0, drawable = -1},
            {texture = -1, prop_id = 1, drawable = -1},
            {texture = -1, prop_id = 2, drawable = -1},
            {texture = -1, prop_id = 6, drawable = -1},
            {texture = -1, prop_id = 7, drawable = -1},
        },
        tattoos = {},
        eyeColor = -1,
    },
    {
        model = `mp_f_freemode_01`,
        headBlend = {
            shapeThird = 21,
            shapeMix = 1,
            skinSecond = 0,
            skinFirst = 21,
            shapeFirst = 1,
            thirdMix = 0.69,
            shapeSecond = 32,
            skinMix = 0.89,
            skinThird = 20,
        },
        hair = {
            color = 3,
            texture = 0,
            style = 4,
            highlight = 0,
        },
        headOverlays = {
            beard = {opacity = 0, style = 0, secondColor = 0, color = 0},
            eyebrows = {opacity = 1.0, style = 13, secondColor = 0, color = 3},
            chestHair = {opacity = 0, style = 0, secondColor = 0, color = 0},
            bodyBlemishes = {opacity = 0, style = 0, secondColor = 0, color = 0},
            blush = {opacity = 0, style = 0, secondColor = 0, color = 0},
            lipstick = {opacity = 0, style = 0, secondColor = 0, color = 0},
            ageing = {opacity = 0, style = 0, secondColor = 0, color = 0},
            sunDamage = {opacity = 0, style = 0, secondColor = 0, color = 0},
            blemishes = {opacity = 0, style = 0, secondColor = 0, color = 0},
            makeUp = {opacity = 0, style = 0, secondColor = 0, color = 0},
            complexion = {opacity = 0, style = 0, secondColor = 0, color = 0},
            moleAndFreckles = {opacity = 0, style = 0, secondColor = 0, color = 0},
        },
        faceFeatures = {
            nosePeakLowering = 0.0,
            eyeBrownForward = 0.0,
            chinBoneSize = 0.0,
            lipsThickness = 0.0,
            noseWidth = 0.0,
            chinBoneLenght = 0.0,
            noseBoneHigh = 0.0,
            nosePeakHigh = 0.0,
            neckThickness = 0.0,
            noseBoneTwist = 0.0,
            cheeksWidth = 0.0,
            eyeBrownHigh = 0.0,
            jawBoneBackSize = 0.0,
            cheeksBoneHigh = 0.0,
            eyesOpening = 0.0,
            jawBoneWidth = 0.0,
            chinHole = 0.0,
            cheeksBoneWidth = 0.0,
            nosePeakSize = 0.0,
            chinBoneLowering = 0.0,
        },
        components = {
            {component_id = 0, drawable = 0, texture = 0},
            {component_id = 1, drawable = 0, texture = 0},
            {component_id = 2, drawable = 4, texture = 0},
            {component_id = 3, drawable = 5, texture = 0},
            {component_id = 4, drawable = 0, texture = 0},
            {component_id = 5, drawable = 0, texture = 0},
            {component_id = 6, drawable = 1, texture = 0},
            {component_id = 7, drawable = 0, texture = 0},
            {component_id = 8, drawable = 26, texture = 0},
            {component_id = 9, drawable = 0, texture = 0},
            {component_id = 10, drawable = 0, texture = 0},
            {component_id = 11, drawable = 1, texture = 0},
        },
        props = {
            {prop_id = 0, drawable = -1, texture = -1},
            {prop_id = 1, drawable = -1, texture = -1},
            {prop_id = 2, drawable = -1, texture = -1},
            {prop_id = 6, drawable = -1, texture = -1},
            {prop_id = 7, drawable = -1, texture = -1},
        },
        tattoos = {},
        eyeColor = -1,
    }
}

NetworkStartSoloTutorialSession()

local nationalities = {}

if config.characters.limitNationalities then
    local nationalityList = lib.load('data.nationalities')

    CreateThread(function()
        for i = 1, #nationalityList do
            nationalities[#nationalities + 1] = { value = nationalityList[i] }
        end
    end)
end

local function setupPreviewCam()
    DoScreenFadeIn(1000)
    SetTimecycleModifier('hud_def_blur')
    SetTimecycleModifierStrength(1.0)
    FreezeEntityPosition(cache.ped, false)
    previewCam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', randomLocation.camCoords.x, randomLocation.camCoords.y, randomLocation.camCoords.z, -6.0, 0.0, randomLocation.camCoords.w, 40.0, false, 0)
    SetCamActive(previewCam, true)
    SetCamUseShallowDofMode(previewCam, true)
    SetCamNearDof(previewCam, 0.4)
    SetCamFarDof(previewCam, 1.8)
    SetCamDofStrength(previewCam, 0.7)
    RenderScriptCams(true, false, 1, true, true)
    CreateThread(function()
        while DoesCamExist(previewCam) do
            SetUseHiDof()
            Wait(0)
        end
    end)
end

local function destroyPreviewCam()
    if not previewCam then return end

    SetTimecycleModifier('default')
    SetCamActive(previewCam, false)
    DestroyCam(previewCam, true)
    RenderScriptCams(false, false, 1, true, true)
    FreezeEntityPosition(cache.ped, false)
    DisplayRadar(true)
    previewCam = nil
end

local function randomPed()
    local ped = randomPeds[math.random(1, #randomPeds)]
    lib.requestModel(ped.model, config.loadingModelsTimeout)
    SetPlayerModel(cache.playerId, ped.model)
    pcall(function() exports['illenium-appearance']:setPedAppearance(PlayerPedId(), ped) end)
    SetModelAsNoLongerNeeded(ped.model)
end

---@param citizenId? string
local function previewPed(citizenId)
    if not citizenId then randomPed() return end

    local clothing, model = lib.callback.await('qbx_core:server:getPreviewPedData', false, citizenId)
    if model and clothing then
        lib.requestModel(model, config.loadingModelsTimeout)
        SetPlayerModel(cache.playerId, model)
        pcall(function() exports['illenium-appearance']:setPedAppearance(PlayerPedId(), json.decode(clothing)) end)
        SetModelAsNoLongerNeeded(model)
    else
        randomPed()
    end
end

---@return CharacterRegistration?
local function characterDialog()
    local nationalityOption = config.characters.limitNationalities and {
        type = 'select',
        required = true,
        icon = 'user-shield',
        label = locale('info.nationality'),
        default = 'American',
        searchable = true,
        options = nationalities
    } or {
        type = 'input',
        required = true,
        icon = 'user-shield',
        label = locale('info.nationality'),
        placeholder = 'Duck'
    }

    return lib.inputDialog(locale('info.character_registration_title'), {
        {
            type = 'input',
            required = true,
            icon = 'user-pen',
            label = locale('info.first_name'),
            placeholder = 'Hank'
        },
        {
            type = 'input',
            required = true,
            icon = 'user-pen',
            label = locale('info.last_name'),
            placeholder = 'Jordan'
        },
        nationalityOption,
        {
            type = 'select',
            required = true,
            icon = 'circle-user',
            label = locale('info.gender'),
            placeholder = locale('info.select_gender'),
            options = {
                {
                    value = locale('info.char_male')
                },
                {
                    value = locale('info.char_female')
                }
            }
        },
        {
            type = 'date',
            required = true,
            icon = 'calendar-days',
            label = locale('info.birth_date'),
            format = config.characters.dateFormat,
            returnString = true,
            min = config.characters.dateMin,
            max = config.characters.dateMax,
            default = config.characters.dateMax
        }
    })
end

---@param dialog string[]
---@param input integer
---@return boolean
local function checkStrings(dialog, input)
    local str = dialog[input]
    if config.characters.profanityWords[str:lower()] then return false end

    local split = {string.strsplit(' ', str)}
    if #split > 5 then return false end

    for i = 1, #split do
        local word = split[i]
        if config.characters.profanityWords[word:lower()] then return false end
    end

    return true
end

-- @param str string
-- @return string?
local function capString(str)
    return str:gsub("(%w)([%w']*)", function(first, rest)
        return first:upper() .. rest:lower()
    end)
end

---@param coords vector4
local function spawnAt(coords)
    DoScreenFadeOut(500)

    while not IsScreenFadedOut() do
        Wait(0)
    end

    destroyPreviewCam()

    pcall(function() exports.spawnmanager:spawnPlayer({
        x = coords.x,
        y = coords.y,
        z = coords.z,
        heading = coords.w
    }) end)

    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')
    TriggerServerEvent('qb-houses:server:SetInsideMeta', 0, false)
    TriggerServerEvent('qb-apartments:server:SetInsideMeta', 0, 0, false)

    while not IsScreenFadedIn() do
        Wait(0)
    end
end

local function spawnDefault() -- We use a callback to make the server wait on this to be done
    spawnAt(defaultSpawn)
    TriggerEvent('qb-clothes:client:CreateFirstCharacter')
end

local function spawnLastLocation()
    spawnAt(QBX.PlayerData.position)
end

---@param cid integer
---@return boolean
local function createCharacter(cid)
    previewPed()

    :: noMatch ::

    local dialog = characterDialog()

    if not dialog then return false end

    for input = 1, 3 do -- Run through first 3 inputs, aka first name, last name and nationality
        if not checkStrings(dialog, input) then
            Notify(locale('error.no_match_character_registration'), 'error', 10000)
            goto noMatch
            break
        end
    end

    DoScreenFadeOut(150)
    local newData = lib.callback.await('qbx_core:server:createCharacter', false, {
        firstname = capString(dialog[1]),
        lastname = capString(dialog[2]),
        nationality = capString(dialog[3]),
        gender = dialog[4] == locale('info.char_male') and 0 or 1,
        birthdate = dialog[5],
        cid = cid
    })

    if GetResourceState('qbx_spawn') == 'missing' then
        spawnDefault()
    else
        if config.characters.startingApartment then
            TriggerEvent('apartments:client:setupSpawnUI', newData)
        else
            TriggerEvent('qbx_core:client:spawnNoApartments')
        end
    end

    destroyPreviewCam()
    return true
end

local function chooseCharacter()
    ---@type PlayerEntity[], integer
    local characters, amount = lib.callback.await('qbx_core:server:getCharacters')
    local firstCharacterCitizenId = characters[1] and characters[1].citizenid
    previewPed(firstCharacterCitizenId)

    randomLocation = config.characters.locations[math.random(1, #config.characters.locations)]
    SetFollowPedCamViewMode(2)
    DisplayRadar(false)

    DoScreenFadeOut(500)

    while not IsScreenFadedOut() and cache.ped ~= PlayerPedId()  do
        Wait(0)
    end

    FreezeEntityPosition(cache.ped, true)
    Wait(1000)
    SetEntityCoords(cache.ped, randomLocation.pedCoords.x, randomLocation.pedCoords.y, randomLocation.pedCoords.z, false, false, false, false)
    SetEntityHeading(cache.ped, randomLocation.pedCoords.w)

    NetworkStartSoloTutorialSession()

    while not NetworkIsInTutorialSession() do
        Wait(0)
    end

    Wait(1500)
    ShutdownLoadingScreen()
    ShutdownLoadingScreenNui()
    setupPreviewCam()

    local options = {}
    for i = 1, amount do
        local character = characters[i]
        local name = character and ('%s %s'):format(character.charinfo.firstname, character.charinfo.lastname)
        options[i] = {
            title = character and ('%s %s - %s'):format(character.charinfo.firstname, character.charinfo.lastname, character.citizenid) or locale('info.multichar_new_character', i),
            metadata = character and {
                Name = name,
                Gender = character.charinfo.gender == 0 and locale('info.char_male') or locale('info.char_female'),
                Birthdate = character.charinfo.birthdate,
                Nationality = character.charinfo.nationality,
                ['Account Number'] = character.charinfo.account,
                Bank = lib.math.groupdigits(character.money.bank),
                Cash = lib.math.groupdigits(character.money.cash),
                Job = character.job.label,
                ['Job Grade'] = character.job.grade.name,
                Gang = character.gang.label,
                ['Gang Grade'] = character.gang.grade.name,
                ['Phone Number'] = character.charinfo.phone
            } or nil,
            icon = 'user',
            onSelect = function()
                if character then
                    lib.showContext('qbx_core_multichar_character_'..i)
                    previewPed(character.citizenid)
                else
                    local success = createCharacter(i)
                    if success then return end

                    previewPed(firstCharacterCitizenId)
                    lib.showContext('qbx_core_multichar_characters')
                end
            end
        }

        if character then
            lib.registerContext({
                id = 'qbx_core_multichar_character_'..i,
                title = ('%s %s - %s'):format(character.charinfo.firstname, character.charinfo.lastname, character.citizenid),
                canClose = false,
                menu = 'qbx_core_multichar_characters',
                options = {
                    {
                        title = locale('info.play'),
                        description = locale('info.play_description', name),
                        icon = 'play',
                        onSelect = function()
                            DoScreenFadeOut(10)
                            lib.callback.await('qbx_core:server:loadCharacter', false, character.citizenid)
                            if GetResourceState('qbx_apartments'):find('start') then
                                TriggerEvent('apartments:client:setupSpawnUI', character.citizenid)
                            elseif GetResourceState('qbx_spawn'):find('start') then
                                TriggerEvent('qb-spawn:client:setupSpawns', character.citizenid)
                                TriggerEvent('qb-spawn:client:openUI', true)
                            else
                                spawnLastLocation()
                            end
                            destroyPreviewCam()
                        end
                    },
                    config.characters.enableDeleteButton and {
                        title = locale('info.delete_character'),
                        description = locale('info.delete_character_description', name),
                        icon = 'trash',
                        onSelect = function()
                            local alert = lib.alertDialog({
                                header = locale('info.delete_character'),
                                content = locale('info.confirm_delete'),
                                centered = true,
                                cancel = true
                            })
                            if alert == 'confirm' then
                                local success = lib.callback.await('qbx_core:server:deleteCharacter', false, character.citizenid)
                                Notify(success and locale('success.character_deleted') or locale('error.character_delete_failed'), success and 'success' or 'error')

                                destroyPreviewCam()
                                chooseCharacter()
                            else
                                lib.showContext('qbx_core_multichar_character_'..i)
                            end
                        end
                    } or nil
                }
            })
        end
    end

    lib.registerContext({
        id = 'qbx_core_multichar_characters',
        title = locale('info.multichar_title'),
        canClose = false,
        options = options
    })

    SetTimecycleModifier('default')
    lib.showContext('qbx_core_multichar_characters')
end

RegisterNetEvent('qbx_core:client:spawnNoApartments', function() -- This event is only for no starting apartments
    DoScreenFadeOut(500)
    Wait(2000)
    SetEntityCoords(cache.ped, defaultSpawn.x, defaultSpawn.y, defaultSpawn.z, false, false, false, false)
    SetEntityHeading(cache.ped, defaultSpawn.w)
    Wait(500)
    destroyPreviewCam()
    SetEntityVisible(cache.ped, true, false)
    Wait(500)
    DoScreenFadeIn(250)
    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')
    TriggerServerEvent('qb-houses:server:SetInsideMeta', 0, false)
    TriggerServerEvent('qb-apartments:server:SetInsideMeta', 0, 0, false)
    TriggerEvent('qb-weathersync:client:EnableSync')
    TriggerEvent('qb-clothes:client:CreateFirstCharacter')
end)

RegisterNetEvent('qbx_core:client:playerLoggedOut', function()
    if GetInvokingResource() then return end -- Make sure this can only be triggered from the server
    chooseCharacter()
end)

CreateThread(function()
    while true do
        Wait(0)
        if NetworkIsSessionStarted() then
            pcall(function() exports.spawnmanager:setAutoSpawn(false) end)
            Wait(250)
            chooseCharacter()
            break
        end
    end
    -- since people apparently die during char select. Since SetEntityInvincible is notoriously unreliable, we'll just loop it to be safe. shrug
    while NetworkIsInTutorialSession() do
        SetEntityInvincible(PlayerPedId(), true)
        Wait(250)
    end
    SetEntityInvincible(PlayerPedId(), false)
end)