local config = require 'config'
local u = require 'utilities'
local api = require 'methods'
local h = require'socket.http'

if not config.thecatapi_key then
	print('Valor de configuração ausente: thecatapi_key.')
	print('cats.lua será habilitado, mas há mais recursos com uma chave')
end

local plugin = {}

function plugin.onTextMessage(msg, blocks)
	api.sendChatAction(msg.chat.id, 'upload_photo')

	local url = 'http://thecatapi.com/api/images/get?format=html&type=jpg'

	if config.thecatapi_key then
		url = url .. '&api_key=' .. config.thecatapi_key
	end

	local str, res = h.request(url)

	if res ~= 200 then
		return api.sendReply(msg, config.errors.connection)
	end

	str = str:match('<img src="(.*)">')

	strnome = str:gsub('/', '_')

	u.download_file(str, strnome)

	api.sendPhoto(msg.chat.id, '/tmp/' .. strnome, '😻',msg.message_id)
end

plugin.triggers = {
	onTextMessage = {
		config.cmd..'(gatos)(.*)$',
  	}
}

return plugin
