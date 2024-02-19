local broadcastAnonimamente = TalkAction("/bc")
local typesConfig = {
	["white"] = MESSAGE_EVENT_ADVANCE,
	["green"] = MESSAGE_INFO_DESCR,
	["red"] = MESSAGE_STATUS_WARNING,
}

function broadcastAnonimamente.onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if param == "" then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Utilize /bc type, falar.')
		return false
	end

	local split = param:split(",")
	if not split[2] then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Utilize /bc type, falar.')
		return false
	end

	local typeMessage = split[1]:trim()
	local message = split[2]:trim()

	local messageType = typesConfig[typeMessage]
	if not messageType then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Por favor defina um tipo de type exemplo: /bc white, fala')
		return false
	end

	if message:len() < 1 or message:len() > 200 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'A sua fala é curta demais, ou longa demais. Precisa ter no mínimo 1 letra e no máximo 200 letras.')
		return false
	end

	for _, tmpPlayer in pairs(Game.getPlayers()) do
		tmpPlayer:sendTextMessage(messageType, message)
	end

	return false
end

broadcastAnonimamente:separator(" ")
broadcastAnonimamente:register()