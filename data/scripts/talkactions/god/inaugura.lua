local inauguraOt = TalkAction("/inaugura")

function inauguraOt.onSay(player, words, param)
	local config = {
		[1543] = { -- STAIRS DAWNPORT
			Position(32074, 31899, 6),
			Position(32074, 31900, 6),
			Position(32074, 31901, 6),
			Position(32074, 31902, 6),
	},
		[9486] = { -- GATE ROOK
			Position(32096, 32215, 7),
			Position(32097, 32215, 7),
			Position(32098, 32215, 7)} 
	}
	
	
	local escada = config[1543]
	local gates = config[9486]
	
	if param == 'fechado' then
		for i = 1, #escada do
			local position = escada[i]
			Game.createItem(1543, 1, position)
			--doRemoveItem(getTileItemById(position, 1543).uid, 1)
		end
		
		for i = 1, #gates do
			local position = gates[i]
			Game.createItem(9486, 1, position)
		end
	end
	
	if param == 'aberto' then
		for i = 1, #escada do
			local position = escada[i]
			doRemoveItem(getTileItemById(position, 1543).uid, 1)
		end
		
		for i = 1, #gates do
			local position = gates[i]
			doRemoveItem(getTileItemById(position, 9486).uid, 1)
		end
	end
	
	
	
	return false
end
inauguraOt:separator(" ")
inauguraOt:register()