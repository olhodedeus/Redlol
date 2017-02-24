local config = require 'config'
local u = require 'utilities'
local api = require 'methods'

local plugin = {}

function plugin.onTextMessage(msg, blocks)
if blocks[1] == 'mark' then
		local res, code = api.sendMessage(msg.chat.id, blocks[2], true)
		if not res then
			api.sendMessage(msg.chat.id, u.get_sm_error_string(code), true)
		end
	end
		-- inicio
	if blocks[1] == 'markp' then
		local res, code = api.sendMessage(msg.chat.id, blocks[2], true, false, false, true)
		if not res then
			api.sendMessage(msg.chat.id, u.get_sm_error_string(code), true, false, false, true)
		end
    end
end
	plugin.triggers = {
	onTextMessage = {
		config.cmd..'(mark) (.*)$',
		config.cmd..'(markp) (.*)$',
	}
}

return plugin
