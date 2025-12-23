-- client.lua

-- Backpack props
local props = 'p_michael_backpack_s'


-- Entities Variables
local bag = nil
local lastPed = nil

-- ox_inventory Export
local ox_inventory = exports.ox_inventory



-- Backpack creation
function PutOnBag()
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
    RequestModel(GetHashKey(props))
    while not HasModelLoaded(GetHashKey(props)) do
        Citizen.Wait(100)
    end
    bag = CreateObject(GetHashKey(props), x, y, z + 0.2, true, true)
    while not DoesEntityExist(bag) do
        Citizen.Wait(100)
    end
    AttachEntityToEntity(bag, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 24818), 0.07, -0.11, -0.05, 0.0, 90.0, 175.0, true, true, false, true, 1, true)
    TriggerServerEvent('backpack:SetEntity', NetworkGetNetworkIdFromEntity(bag))
    SetModelAsNoLongerNeeded(GetHashKey(props))
    lastPed = PlayerPedId()
    CreateThread(function() -- Note: This thread checks if the player has changed ped (e.g. respawned) and removes the bag if so
        while bag do
            Citizen.Wait(500)
            if lastPed ~= PlayerPedId() then
                RemoveBag()
                Wait(100)
                if ox_inventory:GetItemCount('backpack') > 0 then
                    if not bag then
                        PutOnBag()
                    end
                end
            end
        end
    end)
end
-- End of backpack creation



-- Backpack removal
function RemoveBag()
    if bag then
        DetachEntity(bag, true, true)
        DeleteObject(bag)
        TriggerServerEvent('backpack:SetEntity', nil)
        bag = nil
        lastPed = nil
    end
end
-- End of backpack removal



-- ox_inventory update handler
AddEventHandler('ox_inventory:updateInventory', function(changes)
    if ox_inventory:GetItemCount('backpack') > 0 then
        if not bag then
            PutOnBag()
        end
    else
        RemoveBag()
    end
end)
-- End of ox_inventory update handler


-- Exported function to open backpack
exports('openBackpack', function(data, slot)
    if not slot?.metadata?.identifier then
        local identifier = lib.callback.await('backpack:getIdentifier', false, data.slot)
        ox_inventory:openInventory('stash', 'bag_'..identifier)
    else
        local identifier = lib.callback.await('backpack:openBackpack', false, slot.metadata.identifier)
        ox_inventory:openInventory('stash', 'bag_'..identifier)
    end
end)
-- End of exported function