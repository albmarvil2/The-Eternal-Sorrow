
-------------------------------TABLA EnemApprKami---------------------------
EnemApprKami = {
	--variables del enemigo

	id = 1,
	tier = 1,
	Archetype = "EnemApprKami",
	
	vida = function (x)
		return 5 * x + 70
	end,

	ataque = function (x)
		return x + 6
	end,

	vel_mov = function (x)
		return x / 20
	end,

	vel_ataque = function (x)
		return -2 * x + 1002
	end,
	
	GetNextID = function (  )
		local id = EnemApprKami.id + 1
		EnemApprKami.id = id
		return id
	end,
}

-----------------DATOS DEL DROP---------------------

EnemApprKamiContenedor = { 
			---Se usan tablas sin claves para que se iteren siempre de la misma forma
	pesos = {
		{name = "Nada", peso = 10}, --Esto sirve para indicar que no debe caer nada
		{name = "Almas", peso = 2},
		{name = "Habilidad1", peso = 1},
		{name = "Habilidad2", peso = 0}, --2
		{name = "Habilidad3", peso = 0}, --1
		{name = "Potenciador", peso = 2},
		{name = "Arma1", peso = 1},
		{name = "Arma2", peso = 0}, --1
		{name = "Arma3", peso = 0},
	},

	rangoPotenciadores = {min = 1, max = 1},
	rangoAlmas = {min = 1, max = 5}, --son porcentajes
	rangoDineroBase = {min = 50, max = 100},

	--esta funcion devuelve la cantidad de dinero, tanto el limite superior como inferior
	CrecimientoDinero = function (level)
		local min, max = 0

		min = 2 * level + EnemApprKamiContenedor.rangoDineroBase.min
		max = 2 * level + EnemApprKamiContenedor.rangoDineroBase.max

		return min, max
	end,
}
----------------------Damos de alta el contenedor en el drop manager -------------------

Drop.Contenedores[EnemApprKami.Archetype] = EnemApprKamiContenedor

-------------------------APUNTADO EN LA TABLA-----------------------

if SpawnerMgr.tiers["Tier"..EnemApprKami.tier] == nil then
	SpawnerMgr.tiers["Tier"..EnemApprKami.tier] = {Enemigos = {},}
end

table.insert(SpawnerMgr.tiers["Tier"..EnemApprKami.tier].Enemigos, EnemApprKami)