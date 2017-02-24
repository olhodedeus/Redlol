local config = require 'config'
local u = require 'utilities'
local api = require 'methods'
local h = require'socket.http'
local UTF8 = require'lua-utf8'

-- Colocar esta absolutamente no final, mesmo após greetings.lua

local plugin = {}
function plugin.onTextMessage(msg, blocks)

	local chatterdat = u.load_data('data/chatter/chatter.json')

	if msg.text == 'Fica calado Red' then
		if not u.is_mod(msg) then
			api.sendMessage(msg.chat.id, 'Você não é admin. Me deixa em paz.', true)
      return
    end
		chatterdat[tostring(msg.chat.id)] = false

		u.save_data('data/chatter/chatter.json', chatterdat)
		api.sendMessage(msg.chat.id, 'Vou ficar na minha', true)

		return
	end

	if msg.text == 'Pode falar Red' then
		if not u.is_mod(msg) then
			api.sendMessage(msg.chat.id, 'Você não é admin. Me deixa em paz.', true)
      return
    end
		chatterdat[tostring(msg.chat.id)] = true

		u.save_data('data/chatter/chatter.json', chatterdat)
		api.sendMessage(msg.chat.id, 'Vou tagarelar', true)

		return
	end

	chatterdat = u.load_data('data/chatter/chatter.json')

    if chatterdat[tostring(msg.chat.id)] == nil then
		chatterdat[tostring(msg.chat.id)] = true

		u.save_data('data/chatter/chatter.json', chatterdat)
		api.sendMessage(msg.chat.id, 'Olá, estou de volta, já conhece o canal @Telezap? se possui duvidas sobre mim, entre em contato com o @OlhoDeDeus', true)

		return
	end

	if chatterdat[tostring(msg.chat.id)] == false then
		return
	end

	msg.text = string.lower(msg.text)
	palavrachave, j = string.find(msg.text, 'redlol')

	if msg.text == '' then return end

	-- Isso é estranho, mas se você tiver uma maneira melhor, por favor, compartilhe
	if msg.text:match('^' .. bot.first_name) then
	elseif msg.text:match('^@' .. bot.username) then
	elseif msg.text:match('^/') then return true
	elseif msg.reply_to_message and msg.reply_to_message.from.id == bot.id then
	elseif msg.from.id == msg.chat.id then
	elseif palavrachave ~= nil then
	else return true end

	api.sendChatAction(msg.chat.id, 'typing')

	local input = msg.text
	input = input:gsub('@' .. bot.username, 'ed')
	input = input:gsub('redlol', 'ed')
	input = input:gsub('173.255.000.65','104.236.255.40')

	--local url = 'http://www.ed.conpet.gov.br/mod_perl/bot_gateway.cgi?server=0.0.0.0:8085&charset=utf-8&pure=1&js=0&msg=' .. URL.escape(input)

	--local resposta, res = h.request(url)

	--if res ~= 200 then
		--api.sendReply(msg, config.errors.chatter_response)
		--return
	--end

	local command = 'curl -s -X POST http://www.ed.conpet.gov.br/mod_perl/bot_gateway.cgi -F server=0.0.0.0:8085 -F charset=utf-8 -F pure=1 -F js=0 -F msg="' .. input .. '"'
	
	local handle = io.popen(command)
	local resposta = handle:read("*a")
	handle:close()

	local cleaner = {
		{ "&amp;", "&" }, -- decode ampersands
		{ "&#151;", "-" }, -- em dash
		{ "&#146;", "'" }, -- right single quote
		{ "&#147;", "\"" }, -- left double quote
		{ "&#148;", "\"" }, -- right double quote
		{ "&#150;", "-" }, -- en dash
		{ "&#160;", " " }, -- non-breaking space
		{ "<br ?/?>", "\n" }, -- all <br> tags whether terminated or not (<br> <br/> <br />) become new lines
		{ "</p>", "\n" }, -- ends of paragraphs become new lines
		{ "(%b<>)", "" }, -- all other html elements are completely removed (must be done last)
		{ "\r", "\n" }, -- return carriage become new lines
		{ "[\n\n]+", "\n" }, -- reduce all multiple new lines with a single new line
		{ "^\n*", "" }, -- trim new lines from the start...
		{ "\n*$", "" },
		{ "<a href=\"#", ""}-- ... and end
	}
	
	-- clean html from the string
	for i=1, #cleaner do
		local cleans = cleaner[i]
		resposta = string.gsub( resposta, cleans[1], cleans[2] )
	end

	-- # ÍNICIO DO QUE VOCÊ DEVE MODIFICAR
	var1, j = string.find(resposta, 'ED')  -- # Procura certas palavras-chave na resposta

	if var1 ~= nil then  -- # Se a palavra-chave existir faça isso abaixo
		resposta = 'Meu nome representa a cor vermelha ou coisas semelhante :]' -- # Troca a resposta pelo que você quiser
	end

	var2, j = string.find(resposta, 'Sigla de Energia e Desenvolvimento')  -- # Procura certas palavras-chave na resposta

	if var2 ~= nil then  -- # Se a palavra-chave existir faça isso abaixo
		resposta = 'Legal o meu nome né?!' -- # Troca a resposta pelo que você quiser
	end

	resposta = string.gsub(resposta, 'Ed ', 'Redlol ') -- # Troca o nome 'Ed ' por 'WoW'. Altere 'WoW' para o que desejar
	resposta = string.gsub(resposta, 'Ed.', 'Redlol.') -- # Troca o nome 'Ed ' por 'WoW'. Altere 'WoW' para o que desejar
	resposta = string.gsub(resposta, '104.236.255.40', '173.255.000.65') -- # Troca o nome 'Ed ' por 'WoW'. Altere 'WoW' para o que desejar
	-- # FIM DO QUE VOCÊ DEVE MODIFICAR

	local message = UTF8.escape(resposta)

	if message:match('^I HAVE NO RESPONSE.') then
		message = config.errors.chatter_response
	end

	-- Vamos limpar a resposta um pouco (mais). Capitalização e pontuação
	local filter = {
		['%aimi?%aimi?'] = bot.first_name,
		['^%s*(.-)%s*$'] = '%1',
		['^%l'] = string.upper,
		['USER'] = msg.from.first_name
	}

	for k,v in pairs(filter) do
		message = string.gsub(message, k, v)
	end

	if not string.match(message, '%p$') then
		message = message .. '.'
	end

	api.sendReply(msg, message)

end

plugin.triggers = {
  onTextMessage = {
    '(.*)$'
  }
}
return plugin
