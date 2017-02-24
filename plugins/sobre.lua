local config = require 'config'
local u = require 'utilities'
local api = require 'methods'

local plugin = {}

function plugin.onTextMessage(msg, blocks)
  if blocks[1] == 'sossobr' then

		local message = [[
Comandos do usuário:
/regras - Ver regras do grupo
/addregras - Adicionar regras ao grupo
]]

		sendMessage(msg.chat.id, message, true, msg.message_id, true)
		return

end
	if blocks[1] == 'sobre' then
		if not msg.chat.title then
			return 'Este comando funciona somente em grupos!'
		end

		local sobredat = u.load_data('data/sobre/' .. msg.chat.id .. '.json')

		message = sobredat

		if not message then
			return '*Sem descrição para este grupo*. Ainda não definidas!\nUse /setsobre [descrição] para definir uma nova descrição'  .. msg.chat.title
		else
			return message .. '\n\nUse /lista para conhecer mais grupos'
		end

		return nil

	end
	if blocks[1] == 'setsobre' then
		if not u.is_mod(msg) then
    		return 'Você não é admin. Para de Floodar Infeliz'
    	end
		if not msg.chat.title then
			return 'Este comando funciona somente em grupos!'
		end
		local sobredat = u.load_data('data/regras/' .. msg.chat.id .. '.json')
		
			local input = msg.text
			local sobre = msg.text

			if not sobre then
				return 'Regras devem ser adicionadas especificando um texto!'
			else
				sobredat = sobre
				u.save_data('data/regras/' .. msg.chat.id .. '.json', sobredat)
				return 'As regras deste grupo foram definidas com sucesso!'
		end

end
end
plugin.triggers = {
	onTextMessage = {
		config.cmd..'(sossobr)$',
		config.cmd..'(setsobre)$',
		config.cmd..'(setsobre) (.*)$',
		config.cmd..'(sobre)$'
	
	}
}

return plugin