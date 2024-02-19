local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	local itemid = 2160
	
	if msgcontains(msg, "verificar") or msgcontains(msg, "trocar") then
		if msgcontains(msg, "verificar") then
		if player:getStorageValue(Storage.Verified) < 2 then
			if (player:getItemCount(itemid) >= 1) then	
				npcHandler:say("Vi que voce possui o item, Hehehe! Diga {Yes} para prosseguir.", cid)
				npcHandler.topic[cid] = 1
			else
				npcHandler:say("Volte quando possuir o item!", cid)
				npcHandler.topic[cid] = 0
				
			end
			
		else
			npcHandler:say("Voce estava verificado, nao precisa verificar novamente. aproveite os beneficios!", cid)
			npcHandler.topic[cid] = 0
		end
		elseif msgcontains(msg, "trocar") then
			if player:getItemCount(itemid) >= 1 then
			npcHandler:say("Vi que voce possui o item, diga {yes} para prosseguir!", cid)
			npcHandler.topic[cid] = 2
			else
			npcHandler:say("Volte novemente assim que possuir o item!", cid)
			end
		end
		
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 1 then
		npcHandler:say("Muito bem, agora voce esta verificado, aproveite os beneficios!", cid)
		
		if (player:getItemCount(itemid) >= 1) then
			player:removeItem(itemid, 1)
			player:setStorageValue(Storage.Verified, 2)
		else
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 2 then
		npcHandler:say("Muito bem, agora escreva a sua wallet!", cid)
		npcHandler.topic[cid] = 3
	elseif npcHandler.topic[cid] == 3 then
		if not WALLETS_CACHE then
		WALLETS_CACHE = {}
		end
		WALLETS_CACHE[player:getGuid()] = msg
		npcHandler:say("Muito bem, a key digitada foi '"..WALLETS_CACHE[player:getGuid()].."', confirme com {yes} ou {no}.", cid)
		npcHandler.topic[cid] = 4
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 4 then
		if (player:getItemCount(itemid) >= 1) then
			player:removeItem(itemid, 1)
			db.storeQuery("UPDATE `accounts` set `wallet` = '"..WALLETS_CACHE[player:getGuid()].."' WHERE `id` = " .. db.escapeString(player:getAccountId()))
			npcHandler:say("Parabens, sua wallet foi atualizada com sucesso, veja em !wallet.", cid)
		else
			npcHandler:say("Ocorreu um erro, tente novamente mais tarde", cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 4 then
		npcHandler:say("Como a chave estava incorreta, reincie o processo dizendo {trocar}", cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "Espera! Nao saia! Eu quero te falar sobre o drop rate.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Proxima vez nos podemos falar sobre o aumento de drop rate.")
npcHandler:setMessage(MESSAGE_GREET, "Ahn? O que? Ah sim, estou vendo! Uau! Voce gostaria de fazer a sua verificacao? Diga {verificar}. Tambem posso liberar a troca de wallet, basta ter o item e dizer {trocar}.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
