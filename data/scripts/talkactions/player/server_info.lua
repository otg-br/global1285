local serverInfo = TalkAction("!serverinfo")

function serverInfo.onSay(player, words, param)
	local configRateSkill =  configManager.getNumber(configKeys.RATE_SKILL)
	local a, b, c, d, e, f, g, h, i
	
	if player:getStoreXpBoost() > 0 then
		a = "\nExp rate: " .. (getRateFromTable(experienceStages, player:getLevel(), configManager.getNumber(configKeys.RATE_EXP)))*2 .. " Store Boost"
	else
		a = "\nExp rate: " .. getRateFromTable(experienceStages, player:getLevel(), configManager.getNumber(configKeys.RATE_EXP)) .. ""
	end
	
	local check = player:getStorageValue(25897)
	local skilltime = check - os.time()
	if skilltime > 0 then
		b = "\nSword Skill rate: " .. (getRateFromTable(skillsStages, player:getEffectiveSkillLevel(SKILL_SWORD), configRateSkill))*2 .. " Store Boost"
		c = "\nClub Skill rate: " .. (getRateFromTable(skillsStages, player:getEffectiveSkillLevel(SKILL_CLUB), configRateSkill))*2 .. " Store Boost"
		d = "\nAxe Skill rate: " .. (getRateFromTable(skillsStages, player:getEffectiveSkillLevel(SKILL_AXE), configRateSkill))*2 .. " Store Boost"
		e = "\nDistance Skill rate: " .. (getRateFromTable(skillsStages, player:getEffectiveSkillLevel(SKILL_DISTANCE), configRateSkill))*2 .. " Store Boost"
		f = "\nShield Skill rate: " .. (getRateFromTable(skillsStages, player:getEffectiveSkillLevel(SKILL_SHIELD), configRateSkill))*2 .. " Store Boost"
		g = "\nFist Skill rate: " .. (getRateFromTable(skillsStages, player:getEffectiveSkillLevel(SKILL_FIST), configRateSkill))*2 .. " Store Boost"
		h = "\nMagic rate: " .. (getRateFromTable(magicLevelStages, player:getMagicLevel(), configManager.getNumber(configKeys.RATE_MAGIC)))*2 .. " Store Boost"
	else
		b = "\nSword Skill rate: " .. getRateFromTable(skillsStages, player:getEffectiveSkillLevel(SKILL_SWORD), configRateSkill) .. ""
		c = "\nClub Skill rate: " .. getRateFromTable(skillsStages, player:getEffectiveSkillLevel(SKILL_CLUB), configRateSkill) .. ""
		d = "\nAxe Skill rate: " .. getRateFromTable(skillsStages, player:getEffectiveSkillLevel(SKILL_AXE), configRateSkill) .. ""
		e = "\nDistance Skill rate: " .. getRateFromTable(skillsStages, player:getEffectiveSkillLevel(SKILL_DISTANCE), configRateSkill) .. ""
		f = "\nShield Skill rate: " .. getRateFromTable(skillsStages, player:getEffectiveSkillLevel(SKILL_SHIELD), configRateSkill) .. ""
		g = "\nFist Skill rate: " .. getRateFromTable(skillsStages, player:getEffectiveSkillLevel(SKILL_FIST), configRateSkill) .. ""
		h = "\nMagic rate: " .. getRateFromTable(magicLevelStages, player:getMagicLevel(), configManager.getNumber(configKeys.RATE_MAGIC)) .. ""
	end
	
	local i = "\nLoot rate: " .. configManager.getNumber(configKeys.RATE_LOOT) .. ""
		
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Server Info: "..a..""..b..""..c..""..d..""..e..""..f..""..g..""..h..""..i.."")
	return false
end

serverInfo:separator(" ")
serverInfo:register()
