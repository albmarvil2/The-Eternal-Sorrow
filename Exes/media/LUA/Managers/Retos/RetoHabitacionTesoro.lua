--author: Cesar Manuel Paz Guzman

Reto =
{
	--variables del reto


	informacionReto = "Treasure room",
	completed = false,

	

	life = 1000,

	activarHUD = function()

		---activar musica en el SoundTrackMgr
		SoundtrackMgr.ActivarHabTesoro()

		scriptMgr:loadScript(Paths.luaGUIPath.."CartelCentralGUI.lua")
		CartelCentralHUD.Activate(0, Reto.informacionReto)
		
	end,

	tick = function ( msecs )
		-- body
		--AQUI DEBERÍAMOS HACER LAS COSAS DEL RETO
		
		if Reto.life <= 0 then
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
		--abrimos la puerta
		ChangeCollisionGroup(GameMgr.exit_door)
	end,

	ActivarEventoAvalancha = function ()
		return false
	end,

	PorcentajeObjetivo = function ()
		return 0
	end,
	
	UpdateLife = function(life, damage)
		Reto.life = life - damage
	end,

	




	-----------CONFIGURACION DE LA MOCHILA POR RETO-------------

	refreshTime = 1000000, --cada mucho tiempo


	--función que devuelve los parámetros a, b y c de la fórmula atendiendo al número de salas
	parameters = function ( nSalas )
		-- La mochila no crece en ese reto
		local a = 0
		local b = 0
		local c = 0
		return a, b, c
	end,
	
	
	------------------CONFIGURACIÓN DEL SPAWNER POR RETO--------------------------
	
	SpawnParams = function(salas)
		--Prob 0% para todos
		
		local T1, T2, T3, T4, T5
		T1 = 0
		T2 = 0
		T3 = 0
		T4 = 0
		T5 = 0
		return T1, T2, T3, T4, T5
	end,
}