Reto =
{
	--variables del reto

	multiplicador_enemigos = 2.5,
	informacionReto = "Se modifica abajo en activarHUD",

	completed = false,

	
	enemigos_muertos_rango = 0,
	
	distance = false,


	activarHUD = function()
		--actualizacion de variables del reto antes de mostrar el GUI
		
		Reto.num_enemigos = math.min(10, math.floor(RetoMgr.tam_total_mochila * Reto.multiplicador_enemigos))

		Reto.informacionReto = "Kill "..Reto.num_enemigos.." enemies near the Altar"
		-- Reto.informacionReto = RetoMgr.tam_total_mochila.." - "..RetoMgr.tam_libre_mochila

		scriptMgr:loadScript(Paths.luaGUIPath.."CartelCentralGUI.lua")
		CartelCentralHUD.Activate(1,Reto.informacionReto) --Dos objetivos, matar enemigos en tantos segundos, y la info a mostrar
		CartelCentralHUD.cambiarColorTexto("rojo")
		CartelCentralHUD.insertarTexto(1, "Sacrifices", "0/"..Reto.num_enemigos)
		
	end,

	tick = function ( msecs )
		-- body
		--AQUI DEBERÍAMOS HACER LAS COSAS DEL RETO
		CartelCentralHUD.insertarTexto(1, "Sacrifices", Reto.enemigos_muertos_rango.."/"..Reto.num_enemigos)

		--Comprobación de finalización del reto
		if Reto.enemigos_muertos_rango >= Reto.num_enemigos then
			Reto.Success()
		end		
	end,

	--funcion de finalizacion del reto
	Fail = function ()
		RetoMgr.is_reto = false
		Reto.completed = false
		app:push("gameOver")
	end,
	
	Success = function()
		RetoMgr.is_reto = false
		Reto.completed = true
		--Cambiamos el color del texto a verde
		CartelCentralHUD.cambiarColorTexto("verde")
		GameMgr.enemigos_muertos = Reto.num_enemigos
		
		CartelCentralHUD.insertarTexto(1, "Sacrifices", Reto.enemigos_muertos_rango.."/"..Reto.num_enemigos)

		entityfactory:createEntityByType("ParticulaPuertaAbierta", GameMgr.exit_door:getPosition(), GameMgr.map)
		--hacemos que la puerta NO colisione con el player para que la pueda atravesar
		ChangeCollisionGroup(GameMgr.exit_door)
	end,

	ActivarEventoAvalancha = function ()
		return Reto.completed
	end,

	PorcentajeObjetivo = function ()
		--vamos a devolver el % de enemigos cuantificados
		return Reto.enemigos_muertos_rango / Reto.num_enemigos
	end,


	EnemyDie = function(pos)
		--comprobamos la distancia entre la posición del altar y la posición del enemigo
		local dis2 = (math.pow(Altar.posAltar.x - pos.x, 2)) + (math.pow(Altar.posAltar.y - pos.y, 2)) + (math.pow(Altar.posAltar.z - pos.z, 2))
		
		if dis2 <= Altar.radio then
			Reto.enemigos_muertos_rango = Reto.enemigos_muertos_rango + 1
			
			--instanciamos el feedback del altar
			Altar.posAltar.z = 0
			InstantiateAltarSoul(Altar.posAltar, pos, GameMgr.map)
			Reto.distance = false
		else
			Reto.distance = true
		end
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