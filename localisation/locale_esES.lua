if ( GetLocale() ~= "esES" ) then
	return;
end
local ns = select( 2, ... );
ns.L = 
{
	["COMMAND_CONFIG"] = "config | r mostrar la ventana de configuración",
	["COMMAND_LIST"] = "WoW Lista de comandos reloj simbólico",
	["COMMAND_PAUSE"] = "pausar | r no muestran la ventana hasta que ya sea el uso currículum o finaliza la sesión, todavía será informado de los precios",
	["COMMAND_RESUME"] = "reanudar | r mostrar la ventana de nuevo sobre el cambio de precio",
	["COMMAND_SHOW_WINDOW"] = "espectáculo | r mostrar la ventana",
	["COMMAND_WINDOW_PAUSED"] = "ventana que muestra una pausa",
	["COMMAND_WINDOW_RESUMED"] = "ventana que muestra reanudó",
	["CONFIG_DELAY_COMBAT"] = "Delay que muestra la ventana en combate hasta que terminó",
	["CONFIG_DISABLE_POPUP"] = "Desactivar la ventana emergente",
	["CONFIG_DISABLE_POPUP_EXPLAIN"] = "La ventana emergente planteo sobre el cambio de precio, siempre y esto es activa",
	["CONFIG_GOLD_THRESHOLD_BUYER"] = "Umbral de Oro (modo comprador), si el precio es más de esto, el emergente ventana de costumbre sobre el cambio de precio, ajustado a 0 para no utilizar esta función",
	["CONFIG_GOLD_THRESHOLD_SELLER"] = "Umbral de Oro (modo de Francia), si el precio es bajo esta la costumbre ventana emergente en la variación de los precios, lo deja en 0 para no utilizar esta función Si ambos umbrales se establecen en 0 la ventana siempre emergente",
	["CONFIG_INVERT_COLORS"] = "Invertir los colores",
	["CONFIG_INVERT_COLORS_EXPLAIN"] = "Esto es para los que quieren vender WoW Tokens, si el precio aumenta el porcentaje será verde y rojo en disminución",
	["LDB_TOOLTIP"] = "Izquierda haga clic para compra de participaciones un token de clic derecho para abrir config",
	["PRICE"] = "precio"
}

--[===[@debug@ 
{}
--@end-debug@]===]

