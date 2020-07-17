if ( GetLocale() ~= "deDE" ) then
	return;
end
local ns = select( 2, ... );
ns.L = 
{
	["COMMAND_CONFIG"] = "config|r Optionen",
	["COMMAND_LIST"] = "WoW Token Watch – WoW Token Watch",
	["COMMAND_PAUSE"] = "pause|r Zeigt das Fenster solange nicht, bis du den Befehl \"resume\" verwendest oder die Sitzung endet; der Preis wird trotzdem aktualisiert",
	["COMMAND_RESUME"] = "resume|r Zeigt das Fenster bei einer Preisänderung erneut",
	["COMMAND_SHOW_WINDOW"] = "show|r Zeigt das Fenster",
	["COMMAND_WINDOW_PAUSED"] = "Anzeige des Fensters pausiert",
	["COMMAND_WINDOW_RESUMED"] = "Anzeige des Fensters fortgesetzt",
	["CONFIG_DELAY_COMBAT"] = "Die Anzeige des Fensters bis zum Kampfende verzögern",
	["CONFIG_DISABLE_POPUP"] = "Das Aufpoppen des Fensters deaktivieren",
	["CONFIG_DISABLE_POPUP_EXPLAIN"] = "Wenn diese Option aktiviert ist, poppt das Fenster bei einer Preisänderung nicht auf",
	["CONFIG_GOLD_THRESHOLD_BUYER"] = "Goldgrenze (Kaufmodus): Wenn der Preis die Grenze überschreitet, wird kein popup Fenster angezeigt. Setze es auf 0 um dieses Feature zu deaktivieren.",
	["CONFIG_GOLD_THRESHOLD_SELLER"] = "Goldgrenze (Verkaufsmodus): Wenn der Preis unter der Grenze ist, wird kein popup Fenster angezeigt. Setze es auf 0 um dieses Feature zu deaktivieren. Wenn beide Modi auf 0 gesetzt werden ist das Fenster dauerhaft aktiv.",
	["CONFIG_INVERT_COLORS"] = "Farben umkehren",
	["CONFIG_INVERT_COLORS_EXPLAIN"] = "Dies ist für diejenigen, die WoW-Marken verkaufen wollen; bei einer Preissteigerung wird der Prozentwert grün und bei einer Preissenkung rot.",
	["LDB_TOOLTIP"] = [=[Linksklick, um eine Marke zu kaufen.
Rechtsklick, um die Konfiguration zu öffnen.]=],
	["PRICE"] = "Preis"
}

--[===[@debug@ 
{}
--@end-debug@]===]

