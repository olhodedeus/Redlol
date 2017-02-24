local config = require 'config'
local u = require 'utilities'
local api = require 'methods'

local plugin = {}

function plugin.onTextMessage(msg, blocks)
	if blocks[1] == 'ranking' then
		if not u.is_mod(msg) then

	      	local message =  'Você não é admin. Para de Floodar Infeliz. 😠😜'
           		 api.sendMessage(msg.chat.id, message, false)
          	return message
    		end
			
			local rkgdat = u.load_data('data/ranking/' .. msg.chat.id .. '.json')

			local vetor1 = {}
			local vetor2 = {}
			local cont1 = 0
			local cont2 = 0

			for i in pairs(rkgdat) do

				for j, k in pairs(rkgdat[i]) do

					if j == 'mensagens' then
						vetor1[cont1] = k
						cont1 = cont1 + 1
					end

					if k == 'mensagens' then
						vetor1[cont1] = j
						cont1 = cont1 + 1
					end

				end

				for l, m in pairs(rkgdat[i]) do

					if l == 'primeiro_nome' then
						vetor2[cont2] = m
						cont2 = cont2 + 1
					end

					if m == 'primeiro_nome' then
						vetor2[cont2] = l
						cont2 = cont2 + 1
					end

				end

			end

			local vetor3 = {}
			for i=0, cont2-1 do
				vetor3[vetor2[i]] = vetor1[i]
			end

			local i = 0
			local message = '📈 Ranking de Mensagens 📈\n\n'
	    for k,v in u.spairs(vetor3, function(t,a,b) return t[b] < t[a] end) do
	      i = i + 1

	      if i == 1 then
	            message = message ..  '🏆' .. i .. 'º) ' .. v .. ' => ' .. k .. '\n'
	      elseif i == 2 then
	            message = message ..  '🎖' .. i .. 'º) ' .. v .. ' => ' .. k .. '\n'
	      elseif i == 3 then
	            message = message ..  '🏅' .. i .. 'º) ' .. v .. ' => ' .. k .. '\n'
	      else
	            message = message .. '🕴' .. i .. 'º) ' .. v .. ' => ' .. k .. '\n'
	      end

	      if i == 30 then
	        return api.sendMessage(msg.chat.id, message)
	      end
	    end

			api.sendMessage(msg.chat.id, message)

	end

	if blocks[1] == 'rkgsorteio' then
		if not u.is_mod(msg) then
	      			 return 'Você não é admin. Para de Floodar Infeliz.'
			end
			local rkgdat = u.load_data('data/ranking/' .. msg.chat.id .. '.json')

			local vetor1 = {}
			local vetor2 = {}
			local cont1 = 0
			local cont2 = 0

			for i in pairs(rkgdat) do

				for j, k in pairs(rkgdat[i]) do

					if j == 'mensagens' then
						vetor1[cont1] = k
						cont1 = cont1 + 1
					end

					if k == 'mensagens' then
						vetor1[cont1] = j
						cont1 = cont1 + 1
					end

				end

				for l, m in pairs(rkgdat[i]) do

					if l == 'primeiro_nome' then
						vetor2[cont2] = m
						cont2 = cont2 + 1
					end

					if m == 'primeiro_nome' then
						vetor2[cont2] = l
						cont2 = cont2 + 1
					end

				end

			end

			local sorteado = math.random(1,cont2)

			local vetor3 = {}
			for i=0, cont2-1 do
				vetor3[vetor2[i]] = vetor1[i]
			end

			local i = 0
			local message = '🏆 -> O sorteado foi: '

	    for k,v in u.spairs(vetor3, function(t,a,b) return t[b] < t[a] end) do
	      if i == sorteado then
	        message = message .. k
	      end
				i = i + 1
	    end

			api.sendMessage(msg.chat.id, message, false)

		end

	if blocks[1] == 'zerar' then
		    if not u.is_owner(msg) then
		        local message = 'Você não é o Dono. Para de tentar bagunçar o ranking, irei te entregar pro dono 😑😈.'
            api.sendMessage(msg.chat.id, message, false)
          return message
    end
		    local ranking = io.open('data/ranking/' .. msg.chat.id .. '.json',"r")

		    if ranking == nil then
		    	return 'Não existe Ranking neste grupo para ser zerado!'
		    end

		    os.remove('data/ranking/' .. msg.chat.id .. '.json')

		    local message = 'Ranking *ZERADO*!'
				
		    api.sendMessage(msg.chat.id, message, true)

	  end
end

plugin.triggers = {
	onTextMessage = {
		config.cmd..'(ranking)(.*)$',
		config.cmd..'(zerar)(.*)$',
		config.cmd..'(rkgsorteio)(.*)$'
	}
}

return plugin
