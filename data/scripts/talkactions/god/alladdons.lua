local allAddons = TalkAction("/addons")
local looktypes = {
	128, 136, 129, 137, 130, 138, 131, 139, 132, 140, 133, 141, 134, 142,
	143, 147, 144, 148, 145, 149, 146, 150, 151, 155, 152, 156, 153, 157,
	154, 158, 251, 252, 268, 269, 273, 270, 278, 279, 289, 288, 325, 324,
	335, 336, 366, 367, 328, 329, 430, 431, 432, 433, 463, 464, 465, 466,
	471, 472, 512, 513, 514, 516, 541, 542, 574, 575, 577, 578,
	
	
	618,620,632,635,636,664,666,683,694,696,698,724,732,745,749,759,845,852,874,885,900,909,929,956,958,963,965,967,969,971,973,975,1020,1024,1043,1050,1057,1070,1095,1103,1128,1147,1162,1174,1187,1203,1205,1207,1211,1244,1246,1252,1271,1280,1283,1289,1293,1323,1332,1339,1372,1383,
	610,619,633,634,637,665,667,684,695,697,699,725,733,746,750,760,846,853,873,884,899,908,931,955,957,962,964,966,968,970,972,974,1021,1023,1042,1051,1056,1069,1094,1102,1127,1146,1161,1173,1186,1202,1204,1206,1210,1243,1245,1251,1270,1279,1282,1288,1292,1322,1331,1338,1371,1382
	
	
}

function allAddons.onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	local target
	if param == '' then
		target = player:getTarget()
		if not target then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Gives players the ability to wear all addons. Usage: /addons <player name>')
			return false
		end
	else
		target = Player(param)
	end

	if not target then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Player ' .. param .. ' is currently not online.')
		return false
	end

	if target:getAccountType() > player:getAccountType() then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Cannot perform action.')
		return false
	end

	for i = 1, #looktypes do
		target:addOutfitAddon(looktypes[i], 3)
	end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'All addons unlocked for ' .. target:getName() .. '.')
	target:sendTextMessage(MESSAGE_EVENT_ADVANCE, '[Server] All addons unlocked.')
	return false
end
allAddons:separator(" ")
allAddons:register()
