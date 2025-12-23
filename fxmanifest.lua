fx_version 'cerulean'
game 'gta5'

author '𝙂𝙤𝙬𝙬𝙖𝙣𝙐𝙣𝙙𝙚𝙧𝙨𝙖𝙪𝙘𝙚'
description 'Backpack system for ox_inventory'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
    'locales.lua',
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

dependency {
    'ox_lib',
    'ox_inventory',
    'es_extended'
}

lua54 'yes'
