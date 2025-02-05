-- author: Cesar Manuel Paz Guzman

pauseWindow = nil

HUDPause = 
{
	ataque = "Attack: ",
	velocidad_movimiento = "Speed: ",
	velocidad_ataque = "Att. Speed: ",
	vida = "Health: ",
	habilidadesVisibles = 	{
								--Nombre de la habilidad = tabla que contiene la posicion en el hud, y la cantidad
							},
	numeroHabilidadesVisibles = 0,

	potenciadoresVisibles = {},
	numeroPotenciadoresVisibles = 0,
}

function HUDPause.agregarPotenciador(nombrePotenciador, icono)
	if HUDPause.potenciadoresVisibles[nombrePotenciador] == nil then

		--ESTO LO HAGO PORQUE SINO, EL SCROLLBAR IRIA HASTA MUY ABAJO AUN SIN HABER NI UN SOLO ICONO, ENTONCES
		--MODIFICO CADA POCO, PARA QUE SEA PROGRESIVO
		if HUDPause.numeroPotenciadoresVisibles == 8 then

			pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/background"):setProperty("Area",
				"{{0,0},{0,0},{1,0},{1.2,0}}")
			pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/Potenciador9"):setProperty("Area",
				"{{0.045,0},{0.80,0},{0.265,0},{1.10,0}}")
			pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/Potenciador10"):setProperty("Area",
				"{{0.275,0},{0.80,0},{0.495,0},{1.10,0}}")
			pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/Potenciador11"):setProperty("Area",
				"{{0.505,0},{0.80,0},{0.725,0},{1.10,0}}")
			pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/Potenciador12"):setProperty("Area",
				"{{0.735,0},{0.80,0},{0.955,0},{1.10,0}}")

		elseif HUDPause.numeroPotenciadoresVisibles == 12 then

			pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/background"):setProperty("Area",
				"{{0,0},{0,0},{1,0},{1.55,0}}")
			pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/Potenciador13"):setProperty("Area",
				"{{0.045,0},{1.15,0},{0.265,0},{1.45,0}}")
			pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/Potenciador14"):setProperty("Area",
				"{{0.275,0},{1.15,0},{0.495,0},{1.45,0}}")
			pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/Potenciador15"):setProperty("Area",
				"{{0.505,0},{1.15,0},{0.725,0},{1.45,0}}")
			pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/Potenciador16"):setProperty("Area",
				"{{0.735,0},{1.15,0},{0.955,0},{1.45,0}}")

		elseif HUDPause.numeroPotenciadoresVisibles == 16 then

			pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/background"):setProperty("Area",
				"{{0,0},{0,0},{1,0},{1.9,0}}")
			pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/Potenciador17"):setProperty("Area",
				"{{0.045,0},{1.50,0},{0.265,0},{1.80,0}}")
			pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/Potenciador18"):setProperty("Area",
				"{{0.275,0},{1.50,0},{0.495,0},{1.80,0}}")
			pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/Potenciador19"):setProperty("Area",
				"{{0.505,0},{1.50,0},{0.725,0},{1.80,0}}")
			pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/Potenciador20"):setProperty("Area",
				"{{0.735,0},{1.50,0},{0.955,0},{1.80,0}}")

		elseif HUDPause.numeroPotenciadoresVisibles == 20 then

			pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/background"):setProperty("Area",
				"{{0,0},{0,0},{1,0},{2.25,0}}")
			pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/Potenciador21"):setProperty("Area",
				"{{0.045,0},{1.85,0},{0.265,0},{2.15,0}}")
			pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/Potenciador22"):setProperty("Area",
				"{{0.275,0},{1.85,0},{0.495,0},{2.15,0}}")
			pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/Potenciador23"):setProperty("Area",
				"{{0.505,0},{1.85,0},{0.725,0},{2.15,0}}")
			pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/Potenciador24"):setProperty("Area",
				"{{0.735,0},{1.85,0},{0.955,0},{2.15,0}}")
		end

		HUDPause.numeroPotenciadoresVisibles = HUDPause.numeroPotenciadoresVisibles + 1
		HUDPause.potenciadoresVisibles[nombrePotenciador] = {HUDPause.numeroPotenciadoresVisibles,1}
		pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/Potenciador"..HUDPause.numeroPotenciadoresVisibles):
		setVisible(true)
	else
		HUDPause.potenciadoresVisibles[nombrePotenciador][2] = HUDPause.potenciadoresVisibles[nombrePotenciador][2] +1
	end

	local pos = HUDPause.potenciadoresVisibles[nombrePotenciador][1]
	pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/Potenciador"..pos.."/cantidad"):
	setProperty("Text", "x"..HUDPause.potenciadoresVisibles[nombrePotenciador][2])
	pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/Potenciador"..pos):setProperty("Image",icono)

end

function HUDPause.agregarHabilidad(nombreHabilidad, icono) 
	if HUDPause.habilidadesVisibles[nombreHabilidad] == nil then --Si esa habilidad no esta en el HUD, entonces la meto 
		
		if HUDPause.numeroHabilidadesVisibles == 6 then
			pauseWindow:getChild("Root/TabControl/PageItems/ScrollablePane/background"):setProperty("Area",
				"{{0,0},{0,0},{1,0},{1.3,0}}")

			pauseWindow:getChild("Root/TabControl/PageItems/ScrollablePane/hab7"):setProperty("Area",
				"{{0.0673701,0},{0.90,0},{0.312136,0},{1.20,0}}")
			pauseWindow:getChild("Root/TabControl/PageItems/ScrollablePane/hab8"):setProperty("Area",
				"{{0.371214,0},{0.90,0},{0.61598,0},{1.20,0}}")
			pauseWindow:getChild("Root/TabControl/PageItems/ScrollablePane/hab9"):setProperty("Area",
				"{{0.677674,0},{0.90,0},{0.92244,0},{1.20,0}}")
		end

		HUDPause.numeroHabilidadesVisibles = HUDPause.numeroHabilidadesVisibles + 1
		HUDPause.habilidadesVisibles[nombreHabilidad] = {HUDPause.numeroHabilidadesVisibles, 1}
		pauseWindow:getChild("Root/TabControl/PageItems/ScrollablePane/hab"..HUDPause.numeroHabilidadesVisibles):setVisible(true)
	else
		HUDPause.habilidadesVisibles[nombreHabilidad][2] = HUDPause.habilidadesVisibles[nombreHabilidad][2] +1 
	end

	local pos = HUDPause.habilidadesVisibles[nombreHabilidad][1]
	pauseWindow:getChild("Root/TabControl/PageItems/ScrollablePane/hab"..pos.."/cantidad"):setProperty("Text", "x"..HUDPause.habilidadesVisibles[nombreHabilidad][2])

	pauseWindow:getChild("Root/TabControl/PageItems/ScrollablePane/hab"..pos):setProperty("Image", icono)
end

function HUDPause.agregarTooltipHabilidad(nombreHabilidad, texto)
	local pos = HUDPause.habilidadesVisibles[nombreHabilidad][1]
	pauseWindow:getChild("Root/TabControl/PageItems/ScrollablePane/hab"..pos):setProperty("TooltipText", texto)
end

function HUDPause.actualizarStats(nombreStat, valor)
	if nombreStat == "vida" then
		pauseWindow:getChild("Root/TabControl/TabEstad/Estadisticas/"..nombreStat):setProperty("Text",HUDPause[nombreStat]..toString(math.floor(Data_Player.player_info.vidaActual)).."/"..valor)
	elseif nombreStat == "velocidad_movimiento" then
		pauseWindow:getChild("Root/TabControl/TabEstad/Estadisticas/"..nombreStat):setProperty("Text",HUDPause[nombreStat]..math.floor(valor/10))
	else
		pauseWindow:getChild("Root/TabControl/TabEstad/Estadisticas/"..nombreStat):setProperty("Text",HUDPause[nombreStat]..math.floor(valor))
	end
end

function HUDPause.agregarArma(brazo, icono, descripcion)
	if brazo == "Right" then
		pauseWindow:getChild("Root/TabControl/PageItems/ArmaDer"):setProperty("Image", icono)
		pauseWindow:getChild("Root/TabControl/PageItems/ArmaDer"):setProperty("TooltipText", descripcion)
	elseif brazo == "Left" then
		pauseWindow:getChild("Root/TabControl/PageItems/ArmaIzq"):setProperty("Image", icono)
		pauseWindow:getChild("Root/TabControl/PageItems/ArmaIzq"):setProperty("TooltipText", descripcion)
	end
end

function HUDPause.swapArmas()
	local iconoDer = pauseWindow:getChild("Root/TabControl/PageItems/ArmaDer"):getProperty("Image")
	local iconoIzq = pauseWindow:getChild("Root/TabControl/PageItems/ArmaIzq"):getProperty("Image")
	pauseWindow:getChild("Root/TabControl/PageItems/ArmaIzq"):setProperty("Image", iconoDer)
	pauseWindow:getChild("Root/TabControl/PageItems/ArmaDer"):setProperty("Image", iconoIzq)

	local descripcionDer = pauseWindow:getChild("Root/TabControl/PageItems/ArmaDer"):getProperty("TooltipText")
	local descripcionIzq = pauseWindow:getChild("Root/TabControl/PageItems/ArmaIzq"):getProperty("TooltipText")
	pauseWindow:getChild("Root/TabControl/PageItems/ArmaIzq"):setProperty("TooltipText", descripcionDer)
	pauseWindow:getChild("Root/TabControl/PageItems/ArmaDer"):setProperty("TooltipText", descripcionIzq)
end

function HUDPause.agregarTooltipPotenciadores(tipoGeneral, tipoEspecifico)

	local texto = ""

	--Log.Debug("Potenciador: "..tipoPotenciador.." tipogeneral: "..tipoGeneral.." tipoEspecifico: "..tipoEspecifico.." texto: "..texto)
	for key, value in pairs(Potenciadores[tipoGeneral].lista[tipoEspecifico].estadisticas) do 
		if value > 0 then
			texto = texto.."[colour='FF00FF00']"
			texto = texto.."+"..value
		elseif value < 0 then
			texto = texto.."[colour='FFFF0000']"
			texto = texto..value
		end

		if value ~= 0 then
			if key == "vida" then
				texto = texto.." Health\n"
			elseif key == "ataque" then
				texto = texto.." Attack\n"
			elseif key == "velocidad_movimiento" then
				texto = texto.." Speed\n"
			elseif key == "velocidad_ataque" then
				texto = texto.." Attack Speed\n"
			end
		end

		local pos = HUDPause.potenciadoresVisibles[tipoEspecifico][1]
		pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/Potenciador"..pos):setProperty(
				"TooltipText", texto)
	end

end

function GUIPauseInit()
	pauseWindow = GUI.Windows:loadLayoutFromFile("Pause.layout");

	local bOption = pauseWindow:getChild("Root/Option")
	bOption:subscribeEvent("Clicked", "GuiGoOption")

	local bMenu = pauseWindow:getChild("Root/menu")
	bMenu:subscribeEvent("Clicked", "GuiGoMenu")

	local bLogros = pauseWindow:getChild("Root/logros")
	bLogros:subscribeEvent("Clicked", "GuiGoLogros")

	local bReintentar = pauseWindow:getChild("Root/Reintentar")
	bReintentar:subscribeEvent("Clicked", "guiReintentar")
end

function GUIPauseRelease()

end

function HUDPause.nuevoJuego()

	--Log.Debug("Nueva")
	
	local numeroHabilidadesVisibles = HUDPause.numeroHabilidadesVisibles

	while numeroHabilidadesVisibles~=0 do
		--Log.Debug("Desactivando: "..pauseWindow:getChild("ScrollablePane/hab"..numeroHabilidadesVisibles):getName())
		pauseWindow:getChild("Root/TabControl/PageItems/ScrollablePane/hab"..numeroHabilidadesVisibles):setVisible(false)
		numeroHabilidadesVisibles = numeroHabilidadesVisibles - 1
	end

	HUDPause.habilidadesVisibles = {}
	HUDPause.numeroHabilidadesVisibles = 0

	local numeroPotenciadoresVisibles = HUDPause.numeroPotenciadoresVisibles

	while numeroPotenciadoresVisibles~=0 do
		--Log.Debug("Desactivando: "..pauseWindow:getChild("ScrollablePane/hab"..numeroHabilidadesVisibles):getName())
		pauseWindow:getChild("Root/TabControl/TabEstad/ScrollablePane/Potenciador"..numeroPotenciadoresVisibles):setVisible(false)
		numeroPotenciadoresVisibles = numeroPotenciadoresVisibles - 1
	end

	HUDPause.potenciadoresVisibles = {}
	HUDPause.numeroPotenciadoresVisibles = 0

	pauseWindow:getChild("Root/TabControl/PageItems/ArmaDer"):setProperty("Image", "")
	pauseWindow:getChild("Root/TabControl/PageItems/ArmaIzq"):setProperty("Image", "")

	GameMgr.estadisticasPartida.puntuacionTotal = 0

	pauseWindow:getChild("Root/TabControl/TabEstad/statPartida/puntuacion"):setProperty("Text",
		"  PUNTUACIÓN: "..math.floor(GameMgr.estadisticasPartida.puntuacionTotal))


end


function GUIPauseResume()
	GUI.GUIContext:setRootWindow(pauseWindow)

	pauseWindow:setVisible(true)

	pauseWindow:activate()

	HUDPause.actualizarStats("vida", Data_Player.player_stats.vida)
	HUDPause.actualizarStats("ataque", Data_Player.player_stats.ataque)
	HUDPause.actualizarStats("velocidad_ataque", Data_Player.player_stats.velocidad_ataque)
	HUDPause.actualizarStats("velocidad_movimiento", Data_Player.player_stats.velocidad_movimiento)

	GUI.Mouse:show()
end

function GUIPausePause()
	pauseWindow:deactivate()
	pauseWindow:setVisible(false)
end

function GUIPauseActivate()

	GUI.GUIContext:setRootWindow(pauseWindow)

	pauseWindow:setVisible(true)

	pauseWindow:activate()

	HUDPause.actualizarStats("vida", Data_Player.player_stats.vida)
	HUDPause.actualizarStats("ataque", Data_Player.player_stats.ataque)
	HUDPause.actualizarStats("velocidad_ataque", Data_Player.player_stats.velocidad_ataque)
	HUDPause.actualizarStats("velocidad_movimiento", Data_Player.player_stats.velocidad_movimiento)

	GUI.Mouse:show()

	HUDPause.actualizarEstadisticasPartida()

	if gameOverWindow.enabled == false then
		pauseWindow:getChild("Root/Reintentar"):setProperty("Visible", "false")
		pauseWindow:getChild("Root/titulo"):setProperty("Text", "PAUSE")
		pauseWindow:getChild("Root/Option"):setProperty("Visible", "true")
	else
		pauseWindow:getChild("Root/Reintentar"):setProperty("Visible", "true")
		pauseWindow:getChild("Root/Option"):setProperty("Visible", "false")
		pauseWindow:getChild("Root/titulo"):setProperty("Text", "GAME OVER")
	end

end

function GUIPauseDeactivate()

	pauseWindow:deactivate()
	pauseWindow:setVisible(false)

	--GUI.GUIContext:setRootWindow(HUD.hudWindow);

end

function GuiGoOption()
	app:push("option")
end

function GuiGoMenu()
	musicManager:stopAllSounds()
	app:ChangeToState("menu")
	FuncionesTrophyManager.juegoNuevo()
end

function GuiGoLogros()
	app:push("trophy")
end

function HUDPause.actualizarEstadisticasPartida()
	pauseWindow:getChild("Root/TabControl/TabEstad/statPartida/DineroActual"):setProperty("Text",
		"  COINS:   "..Data_Player.player_info.money)

	pauseWindow:getChild("Root/TabControl/TabEstad/statPartida/DineroTotal"):setProperty("Text",
		"  TOTAL COINS:   "..GameMgr.estadisticasPartida.dineroConseguido)

	pauseWindow:getChild("Root/TabControl/TabEstad/statPartida/DineroGastado"):setProperty("Text",
		"  SPENT COINS:   "..GameMgr.estadisticasPartida.dineroGastado)

	pauseWindow:getChild("Root/TabControl/TabEstad/statPartida/Salas"):setProperty("Text",
		"  DUNGEONS COMPLETED:   "..GameMgr.salas_totales)

	pauseWindow:getChild("Root/TabControl/TabEstad/statPartida/Enemigos"):setProperty("Text",
		"  ENEMIES KILLED:   "..GameMgr.estadisticasPartida.enemigosMuertosTotales)

	pauseWindow:getChild("Root/TabControl/TabEstad/statPartida/EnemigosSala"):setProperty("Text",
		"  ENEMIES KILLED/DUNGEON:   "..GameMgr.enemigos_muertos)

	pauseWindow:getChild("Root/TabControl/TabEstad/statPartida/Cofres"):setProperty("Text",
		"  CHESTS OPENED:   "..GameMgr.estadisticasPartida.numeroCofresAbiertos)

	pauseWindow:getChild("Root/TabControl/TabEstad/statPartida/Potenciadores"):setProperty("Text",
		"  TOTAL POWER UPS:   "..GameMgr.estadisticasPartida.numeroPotenciadoresCogidos)

	pauseWindow:getChild("Root/TabControl/TabEstad/statPartida/habilidades"):setProperty("Text",
		"  TOTAL SKILLS:   "..GameMgr.estadisticasPartida.numeroHabilidadesCogidas)

	pauseWindow:getChild("Root/TabControl/TabEstad/statPartida/puntuacion"):setProperty("Text",
		"  TOTAL SCORE: "..math.floor(GameMgr.estadisticasPartida.puntuacionTotal))

end

function guiReintentar()
	app:clearStates()
	app:ChangeToState("game")
	FuncionesTrophyManager.juegoNuevo()
end