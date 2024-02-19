local onlineTournamentCoins = GlobalEvent("onlineTournamentCoins")

function onlineTournamentCoins.onThink(interval)
	
	
	if not tournamentCoinsTable then
		tournamentCoinsTable = {}
	end
	
	for _, online in ipairs(Game.getPlayers()) do
		if online:isPlayer() then
			local guid = online:getGuid()
			
			if not tournamentCoinsTable[guid] then
				tournamentCoinsTable[guid] = {timer = 0}
			end
			
			tournamentCoinsTable[guid].timer = tournamentCoinsTable[guid].timer + 1
			if tournamentCoinsTable[guid].timer == 1 then
				online:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Permaneça online para ganhar 100 Tournament coins, por hora.")
			end
			if tournamentCoinsTable[guid].timer == 30 then
				online:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Permaneça online mais 30 minutos, para ganhar 100 Tournament coins.")
			end
			
			if tournamentCoinsTable[guid].timer >= 60 then
				tournamentCoinsTable[guid].timer = tournamentCoinsTable[guid].timer - 60
				
				local tournamentCoins = online:getStorageValue(Storage.TournamentCoins)
				if tournamentCoins < 0 then
					online:setStorageValue(Storage.TournamentCoins, 100)
					else
					online:setStorageValue(Storage.TournamentCoins, tournamentCoins+100)
				end
				online:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Parabéns. Você ganhou 100 Tournament coins por ficar uma hora online. Continue online para ganhar mais.")
			end
			
		end
	end
	
	return true
end
onlineTournamentCoins:interval(60000) --
onlineTournamentCoins:register()


