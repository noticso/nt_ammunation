fx_version 'adamant'

game 'gta5'
author 'noticso'
version '1.1.0'
description 'Ammunation'
lua54 'yes'
shared_script '@es_extended/imports.lua'
client_scripts { 'client.lua', 'config.lua'}
server_scripts {'server.lua', 'config.lua'}
ui_page 'nui/index.html'
dependencies {
    'gridsystem',
}
files {
    'nui/index.html',
    'nui/js/*.js',
    'nui/css/*.css',
    'nui/img/*',
    'nui/fonts/*',
}
