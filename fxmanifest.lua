fx_version "cerulean"
game "gta5"
lua54 "yes"

shared_scripts {
    "@es_extended/imports.lua",
    "@ox_lib/init.lua"
}

client_scripts {
    "config.lua",
    "client/main.lua"
}

dependencies {
    "es_extended",
    "ox_lib"
}