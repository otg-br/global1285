local recompensa = TalkAction("!recompensa")
local recom = {
[1] = {8922, 8900}, -- Sorcerer
[2] = {8910, 8900}, -- Druid
[3] = {2160, 7366}, -- Paladin
[4] = {2430, 2516, 7408,7430}, -- Knight 
[5] = {8922, 8900},-- Master Sorcerer
[6] = {8910, 8900}, -- Elder Druid
[7] = {2160, 7366}, -- Royal Paladin
[8] = {2430, 2516, 7408,7430}, -- Elite Knight
 
}

function recompensa.onSay(cid)
if getPlayerStorageValue(cid, 171) > 0 then
		doSendMagicEffect(getPlayerPosition(cid), 32)
return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,  "Você já recebeu sua recompensa.")
end

if getPlayerLevel(cid, 50) <= 49 then
		doSendMagicEffect(getPlayerPosition(cid), 6)
return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você não possuí level para receber a recompensa.")
end
 
local rec = recom[getPlayerVocation(cid)]
 
if not rec then
return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,  "Sua vocação não está configurada para receber recompensas.")
end
 
for _, v in pairs(rec) do
doPlayerAddItem(cid, v)
end
doSendMagicEffect(getPlayerPosition(cid), 7)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,  "Você recebeu sua recompensa!")
setPlayerStorageValue(cid, 171, 1)
return true
end

recompensa:separator(" ")
recompensa:register()