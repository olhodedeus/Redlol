-- # Requer que o bot tenha acesso à todas as mensagens
-- # Verifique no @BotFather

local config = require 'config'
local u = require 'utilities'
local api = require 'methods'

local plugin = {}

function plugin.onTextMessage(msg, blocks)
	msg.from.id = tostring(msg.from.id)
	msg.chat.id = tostring(msg.chat.id)

	local rkgdat = u.load_data('data/ranking/' .. msg.chat.id .. '.json')

	if not msg.from.last_name then
		msg.from.last_name = ''
	end

	if not rkgdat[msg.from.id] then
		rkgdat[msg.from.id] = {
			['primeiro_nome'] = msg.from.first_name .. ' ' .. msg.from.last_name,
			['mensagens'] 	  = 1
		}

		u.save_data('data/ranking/' .. msg.chat.id .. '.json', rkgdat)
	else
		rkgdat[msg.from.id] = {
			['primeiro_nome'] = msg.from.first_name .. ' ' .. msg.from.last_name,
			['mensagens'] 	  = rkgdat[msg.from.id]['mensagens'] + 1
		}

		u.save_data('data/ranking/' .. msg.chat.id .. '.json', rkgdat)
	end

	return true
end

plugin.triggers = {
	onTextMessage = {
		'(.*)$'
	}
}

return plugin
