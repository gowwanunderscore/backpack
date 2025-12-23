-- server.lua


-- Configuration defaults
if not Config then
	print('[Warning] config.lua not found, loading default configuration.')
	Config = {}

	Config.BackpackLimit = 10 -- Maximum number of items in the backpack
	Config.backpackWeightLimit = 10000 -- Maximum weight (in grams) the backpack can hold
	Config.locale = 'en' -- Language setting (e.g., 'en' for English, 'fr' for French, 'de' for German or 'es' for Spanish)
end

if not Strings[Config.locale] then
	print('[Warning] Locale \''..Config.locale..'\' not found, defaulting to \'en\'')
	Config.locale = 'en' -- Fallback to English if the specified locale does not exist
end

print('[Info] Backpack system loaded with locale: ' .. Config.locale)

-- Registering ox_inventory export
local ox_inventory = exports.ox_inventory

-- Table to keep track of player entities
local entities = {}


-- Prevent players from dropping backpacks when they disconnect
AddEventHandler('esx:playerDropped', function (playerid)
    local netId = entities[playerid]
    if netId then
        local entity = NetworkGetEntityFromNetworkId(netId)
        if DoesEntityExist(entity) then
            DeleteEntity(entity)
        end
        entities[playerid] = nil
    end
end)
-- End of disconnect handler



-- Function to generate a unique serial for backpacks
local function GenerateText(num)
	local str
	repeat str = {}
		for i = 1, num do str[i] = string.char(math.random(65, 90)) end
		str = table.concat(str)
	until str ~= 'POL' and str ~= 'EMS'
	return str
end

local function GenerateSerial(text)
	if text and text:len() > 3 then
		return text
	end
	return ('%s%s%s'):format(math.random(100000,999999), text == nil and GenerateText(3) or text, math.random(100000,999999))
end
-- End of unique serial function



-- Registering network event to set entity
RegisterNetEvent('backpack:SetEntity', function(netId)
	if netId == nil then
		local existingNetId = entities[source]
		if existingNetId then
			local entity = NetworkGetEntityFromNetworkId(existingNetId)
			if DoesEntityExist(entity) then
				DeleteEntity(entity)
			end
			entities[source] = nil
		end
		return
	else
		entities[source] = netId
	end
end)
-- End of network event



-- Create new backpack (then create unique serial number and stash)
lib.callback.register('backpack:getIdentifier', function(src, slot)
    local newId = GenerateSerial()
    ox_inventory:SetMetadata(src, slot, { identifier = newId })
    ox_inventory:RegisterStash('bag_'..newId, Strings[Config.locale].backpack_label, Config.BackpackLimit, Config.backpackWeightLimit, false)
    return newId
end)
-- End of backpack registration



-- Registering backpack before opening then returning identifier
lib.callback.register('backpack:openBackpack', function(src, identifier)
    if identifier then
    	ox_inventory:RegisterStash('bag_'..identifier, Strings[Config.locale].backpack_label, Config.BackpackLimit, Config.backpackWeightLimit, false)
    end
    return identifier
end)
-- End of backpack registration



-- Preventing backpacks from being put into other backpacks
CreateThread(function()
	while GetResourceState('ox_inventory') ~= 'started' do Wait(500) end
	local swapHook = ox_inventory:registerHook('swapItems', function(payload)
		local start, destination, move_type = payload.fromInventory, payload.toInventory, payload.toType
		local count_bagpacks = ox_inventory:GetItem(payload.source, 'backpack', nil, true)
	
		if string.find(destination, 'bag_') then
			TriggerClientEvent('ox_lib:notify', payload.source, {type = 'error', title = Strings[Config.locale].action_incomplete, description =  Strings[Config.locale].backpack_in_backpack}) 
			return false
		end
		
		return true
	end, {
		print = false,
		itemFilter = {
			backpack = true,
		},
	})
	
	AddEventHandler('onResourceStop', function()
		ox_inventory:removeHooks(swapHook)
	end)
end)
-- End of backpack-in-backpack prevention