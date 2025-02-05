--author: Cesar Manuel Paz Guman

Reto =
{
	--variables del reto

	--tiempo para completar el objetivo
	tiempo_objetivo = 79000,

	informacionReto = "Survive 1:15 minutes",

	completed = false,


	activarHUD = function()
		--actualizacion de variables del reto antes de mostrar el GUI

		scriptMgr:loadScript(Paths.luaGUIPath.."CartelCentralGUI.lua")
		CartelCentralHUD.Activate(1,Reto.informacionReto) --Dos objetivos, matar enemigos en tantos segundos, y la info a mostrar
		CartelCentralHUD.cambiarColorTexto("rojo")
		CartelCentralHUD.insertarTexto(1, "Time", Reto.tiempo_objetivo)
		
	end,

	tick = function ( msecs )

		local minuto = CartelCentralHUD.transformarHora(math.floor((Reto.tiempo_objetivo - GameMgr.tiempo_en_sala)*0.001))
		CartelCentralHUD.insertarTexto(1, "Time", minuto)

		if math.floor((Reto.tiempo_objetivo - GameMgr.tiempo_en_sala)*0.001) == 0 then
			Reto.Success()
		end
	end,

	--funcion de finalizacion del reto
	Fail = function ()
		RetoMgr.is_reto = false
		Reto.completed = false
	end,
	
	Success = function()
		RetoMgr.is_reto = false
		Reto.completed = true

		CartelCentralHUD.cambiarColorTexto("verde")
		local minuto = CartelCentralHUD.transformarHora(math.floor((Reto.tiempo_objetivo - GameMgr.tiempo_en_sala)*0.001))
		CartelCentralHUD.insertarTexto(1, "Time", minuto)

		entityfactory:createEntityByType("ParticulaPuertaAbierta", GameMgr.exit_door:getPosition(), GameMgr.map)
		ChangeCollisionGroup(GameMgr.exit_door)
	end,

	ActivarEventoAvalancha = function ()
		return Reto.completed
	end,

	PorcentajeObjetivo = function ()
		--Vamos a devolver el % de tiempo
		return GameMgr.tiempo_en_sala / Reto.tiempo_objetivo
	end,

	
	-----------CONFIGURACION DE LA MOCHILA POR RETO-------------

	refreshTime = 15000, --cada 10s

	-- tam_inicial_mochila = 6, --tamaño inicial

	--función que devuelve los parámetros a, b y c de la fórmula atendiendo al número de salas
	parameters = function ( nSalas )
		-- body
		local a = 0.2
		local b = 0.3
		local c = 0

		if nSalas > 3 then
			a = 0.1
			b = 0.5
			c = 0
		end
		return a, b, c
	end,
	
	
	------------------CONFIGURACIÓN DEL SPAWNER POR RETO--------------------------
	
	SpawnParams = function(salas)
		local m1, m2, n1, n2, m3, n3, m4, n4, m5, n5
		m1 = -2
		n1 = 40
		m2 = 1
		n2 = 25
		m3 = 1
		n3 = 10
		m4 = 0.1
		n4 = 1
		m5 = 0.1
		n5 = 1
		

		----para las priemras 5 salas anulamos la prob de aparicion de los 3 ultimos tiers

		if salas < 5 then
			m2 = 0
			n2 = 0
			m3 = 0
			n3 = 0
			-- m4 = 0
			-- n4 = 0
			m5 = 0
			n5 = 0
		end
		
		local T1, T2, T3, T4, T5
		T1 = math.max(math.ceil(salas * m1 + n1), 10)
		T2 = math.ceil(salas * m2 + n2)
		T3 = math.ceil(salas * m3 + n3)
		T4 = math.ceil(salas * m4 + n4)
		T5 = math.ceil(salas * m5 + n5)
		return T1, T2, T3, T4, T5
	end,
}