local config = require 'config'
local u = require 'utilities'
local api = require 'methods'

local plugin = {}

function plugin.onTextMessage(msg, blocks)
  if blocks[1] == 'doar' then
         local message = [[
📢 Seja um apoiador da *RedeTelezap*, contamos com vários canais e grupos ^^ com conteúdo *livre de pornografia, carders, lammers, netfree etc.*
Mantenha o nosso amigo 🤖 @RedlolBot no ar ^^

⬇️⬇️⬇️⬇️
[😀 Doar a partir de R$ 1,00️](apoia.se/redetelezap)
⬆️⬆️⬆️⬆️


 🏆 @RedeTelezap 🏆

🌐 @MusicasTops 🎵
🌐 @MundoDaMusica 🎶
🌐 @HomensRomanticos 🌹
🌐 @StickersTops 🐉
🌐 @LivrosEmPDF 📚
🌐 @HistoriaParalela 📜
🌐 @Redlol 🤖
🌐 @Telezap 📢
🌐 @PiadasClassicas 😂
🌐 @Bodegaiato 🐑


*Administrador de grupos:* 🤖 @RedlolBot 🤖


⬇️⬇️⬇️⬇️
[😀 Doar a partir de R$ 1,00️](apoia.se/redetelezap)
⬆️⬆️⬆️⬆️
]]
    if msg.from.username ~= nil then
      referencia = msg.from.username
    else
      referencia = msg.from.id
    end

    referencia = string.gsub(referencia, '_', '')
    referencia = string.gsub(referencia, '*', '')

    if msg.chat.type == 'private' then
      api.sendMessage(msg.from.id, message, true)
    elseif not(msg.chat.type == 'private') then
      local res = api.sendMessage(msg.from.id, message, true)

      if res then
        api.sendMessage(msg.chat.id, 'Confira nosso informativo no seu privado!', true)
      else
        api.sendMessage(msg.chat.id, '*' .. msg.from.first_name ..'*'.. ' (@' .. referencia ..') ' .. '[clique aqui](http://telegram.me/' .. bot.username .. '?start=start)' ..  ' para enviar uma mensagem no meu privado e tente clicar em /doar novamente.', true)
      end
    end
end
end
plugin.triggers = {
	onTextMessage = {
		config.cmd..'(doar)$',
		
		
	}
}

return plugin