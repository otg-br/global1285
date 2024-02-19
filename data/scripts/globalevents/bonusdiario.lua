-- Sistema de Bônus Diário
-- Marson 13/10/2021

config = {
	--TIPOS
	--1 = Bonus de exp
	--2 = Bonus de loot
	--3 = Bonus de skill e ml
	--4 = Bonus de Double Coins (bonus.ammount = 2 --aqui será usado um numero para multiplicar . 2 = Em dobro 1.5 = +50%)
	--5 = Bonus no Treiner com Exercise 
		
	["Monday"] = {
		tipo = 1,
		ammount = 50,
		sstring = "Bonus de Exp"
	},
	["Tuesday"] = {
		tipo = 2,
		ammount = 50,
		sstring = "Bonus de Loot"
	},
	["Wednesday"] = {
		tipo = 3,
		ammount = 50,
		sstring = "Bonus de Skill e ML 50%"
	},
	["Thursday"] = {
		tipo = 4,
		ammount = 2, --aqui será usado um numero para multiplicar . 2 = Em dobro 1.5 = +50%
		sstring = "Bonus de Coins em Dobro"
	},
	["Friday"] = {
		tipo = 5,
		ammount = 1.5, -- 1.5 = 50%
		sstring = "Bonus no Treiner com exercise"
	},
	["Saturday"] = {
		tipo = 1,
		ammount = 45,
		sstring = "Bonus de Exp 45%"
	},
	["Sunday"] = {
		tipo = 1,
		ammount = 50,
		sstring = "Bonus de Exp 50%"
	}
	
}


local bonusTestWeek = GlobalEvent("bonusTestWeek")
function bonusTestWeek.onThink(interval)
	
	local weekday =os.date("%A")
	local info = config[weekday]
		
	--CRIAR váriavel global para acionar os gatinhos
	BONUS_DIARIO_TIPO = info.tipo
	BONUS_DIARIO_MSG = info.sstring
	BONUS_DIARIO_AMMOUNT = info.ammount
	
	
	print("hoje é dia de "..BONUS_DIARIO_MSG..", "..BONUS_DIARIO_TIPO..", "..BONUS_DIARIO_AMMOUNT.."")
	return true
end

print("BONUSDAILY")
bonusTestWeek:interval(6000)
bonusTestWeek:register()
