local ausenteAfk = TalkAction("!afk")
local mensagens = {"AFK!", "Ausente!", "Dando um 10", "Legalizando"}
local segundos = 20

local function doSendAutoMessage(cid, pos)
if (isCreature(cid) == true) then
 local cid = Player (cid)
	npos = cid:getPosition()
	if (pos.x == npos.x) and (pos.y == npos.y) and (pos.z == npos.z) then
		cid:say(mensagens[math.random(#mensagens)], TALKTYPE_MONSTER_SAY)
		doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
		addEvent(doSendAutoMessage, segundos*1000, cid.uid, npos)
		end
	end
end

function ausenteAfk.onSay(cid, words, param)
local stgTime = 481024

	pos = getThingPos(cid)
	cid:say(mensagens[math.random(#mensagens)], TALKTYPE_MONSTER_SAY)
	doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
	doCreatureSay(cid, "Ausente ativado.", TALKTYPE_ORANGE_1)
	doPlayerPopupFYI(cid, "Você está ausente. Ande para desativar o comando.")
addEvent(doSendAutoMessage, segundos*1000, cid.uid, pos)
return false
end

ausenteAfk:register()
