local shareXp = TalkAction("!pt")

function shareXp.onSay(player, levels, party)
	
	local players = {}
	local levels = {}
	local party = player:getParty()
	
	if not party then
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Seu nivel é '.. player:getLevel() ..'. Você pode sharear com players de level '.. math.floor(player:getLevel()*0.67) ..' até level '.. math.floor(player:getLevel()*1.67) ..'.')
	return false
	end
	
	local vocationId = party:getLeader():getVocation():getBase():getId()
		
	if vocationId ~= VOCATION_NONE then
		table.insert(players, party:getLeader():getGuid())
		table.insert(levels, party:getLeader():getLevel())
		
	end
	for _, member in ipairs(party:getMembers()) do
		vocationId = member:getVocation():getBase():getId()
		if vocationId ~= VOCATION_NONE then
			table.insert(players, member:getGuid())
			table.insert(levels, member:getLevel())
		end
	end
	
	local topLevel, topPlayer = 0, 0
	
	for i = 1, #players do
	local check = Player(players[i])
	local level = check:getLevel()
	if level >= topLevel then
		topLevel = level
		topPlayer = check:getGuid()
	end		
	end
	
	for i = 1, #players do
	local check = Player(players[i])
	check:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'O membro com maior nivel na sua party e o '..Player(topPlayer):getName()..', level '..topLevel..'. Para sharear o level minimo e '.. math.floor(topLevel*0.67) ..' e o maximo '.. math.floor(topLevel*1.67) ..'.')
	end
end

shareXp:separator(" ")
shareXp:register()