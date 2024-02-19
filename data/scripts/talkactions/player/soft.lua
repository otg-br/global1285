local onSay = TalkAction("!soft", "!repair")


function onSay (cid, words, param, channel)
        local preco = 30000  -- gold coins
        local wornId = 10021 -- id da worn soft boots, bota descarregada
        local newId = 6132 -- id da nova soft boots, bota carregada
	
        if getPlayerItemCount(cid, wornId) >= 1 and getPlayerMoney(cid) >= preco then
        doSendMagicEffect(getPlayerPosition(cid), 12)
        doPlayerAddItem(cid, newId)
		doPlayerRemoveItem(cid, wornId, 1)
        doPlayerRemoveMoney(cid, preco)
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce recarregou sua Soft Boots por "..preco.." gps.")
else

        doSendMagicEffect(getPlayerPosition(cid), 2)
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce nao tem "..preco.." gps ou uma Worn para poder recarregar.")
return TRUE

        end
end