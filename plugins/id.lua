local config = require 'config'
local u = require 'utilities'
local api = require 'methods'

local plugin = {}

function plugin.onTextMessage(msg, blocks)
	if blocks[1] == 'id' then
	if msg.reply_to_message then
		msg = msg.reply_to_message
	end

	local from_name = 'Seu nome é ' .. msg.from.first_name
	if msg.from.last_name then
		from_name = from_name .. ' ' .. msg.from.last_name
	end

	if msg.from.username then
		from_name = from_name .. '\nUsuário: @' .. msg.from.username
	end
	from_name = from_name .. '\nID: ' .. msg.from.id

	local to_name
	local message
	if msg.chat.title then
		to_name = msg.chat.title .. ' (ID: -' .. math.abs(msg.chat.id) .. ')'
		message = from_name .. '\n\nVocê está no Grupo ' .. to_name
	else
		message = from_name .. '\n\nVocê está no meu privado.'
	end

	msg.from.id = tostring(msg.from.id)
	msg.chat.id = tostring(msg.chat.id)

	local rkgdat = u.load_data('data/ranking/' .. msg.chat.id .. '.json')

	print(rkgdat[msg.from.id]['mensagens'])

	message = message .. '\n\nVocê já enviou ' .. rkgdat[msg.from.id]['mensagens'] .. ' mensagens aqui!'

	api.sendReply(msg, message)

end
	if blocks[1] == 'idfoto' then

		if msg.reply_to_message then
			msg = msg.reply_to_message
		end

		local from_name = 'Seu nome é ' .. msg.from.first_name

		if msg.from.last_name then
			from_name = from_name .. ' ' .. msg.from.last_name
		end


		if msg.from.username then
			from_name = from_name .. '\nUsuário: @' .. msg.from.username
		end

		from_name = from_name .. '\nID: ' .. msg.from.id

		local to_name
		local message

		if msg.chat.title then
			to_name = msg.chat.title .. ' (ID: -' .. math.abs(msg.chat.id) .. ')'
			message = from_name .. '\n\nVocê está no Grupo ' .. to_name
		else
			message = from_name .. '\n\nVocê está no meu privado.'
		end

		msg.from.id = tostring(msg.from.id)
		msg.chat.id = tostring(msg.chat.id)

		local fotos = api.getUserProfilePhotos(msg.from.id)

		local rkgdat = u.load_data('data/ranking/' .. msg.chat.id .. '.json')

		message = message .. '\n\nVocê já enviou ' .. rkgdat[msg.from.id]['mensagens'] .. ' mensagens aqui!'

		local fotoID
		local fotos = api.getUserProfilePhotos(msg.from.id)

		if fotos.result.total_count ~= 0 then
			print(message)
			api.sendPhotoId(msg.chat.id, fotos.result.photos[1][1].file_id, u.urlencode(message))
		else
			api.sendPhoto(msg.chat.id, message)
		end
	end
end

plugin.triggers = {
	onTextMessage = {
		config.cmd..'(idfoto)(.*)$',
		config.cmd..'(id)(.*)$'
	}
}

return plugin
