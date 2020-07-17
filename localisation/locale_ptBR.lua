if ( GetLocale() ~= "ptBR" ) then
	return;
end
local ns = select( 2, ... );
ns.L = 
{
	["COMMAND_CONFIG"] = "config|r mostra a janela de configuração",
	["COMMAND_LIST"] = "WoW Token veja lista de comando",
	["COMMAND_PAUSE"] = "pause|r não mostra a janela até que você solicite ou a instância acabe, os preços continuaram a ser atualizados.",
	["COMMAND_RESUME"] = "resume|r mostrar a janela novamente na mudança de preço",
	["COMMAND_SHOW_WINDOW"] = "show|r Mostrar a janela",
	["COMMAND_WINDOW_PAUSED"] = "janela de exibição em pausa",
	["COMMAND_WINDOW_RESUMED"] = "Mostrando janela resumida",
	["CONFIG_DELAY_COMBAT"] = "Delay mostrando a janela em combate até que acabe.",
	["CONFIG_DISABLE_POPUP"] = "Desabilita a janela popup",
	["CONFIG_DISABLE_POPUP_EXPLAIN"] = "A janela não mostra o preço se isso estiver ativo.",
	["CONFIG_GOLD_THRESHOLD_BUYER"] = "Limite de Gold (modo comprador) se o preço estiver acima desse valor, a janela não aparece com alterações de preço, deixe 0 para não usar isso",
	["CONFIG_GOLD_THRESHOLD_SELLER"] = "Limite Gold (modo vendedor) se o preço está abaixo desse valor, a janela não aparece com alterações de preço, se ambos são definidos como 0 a janela sempre aparecerá.",
	["CONFIG_INVERT_COLORS"] = "Inverter as cores",
	["CONFIG_INVERT_COLORS_EXPLAIN"] = "Isto é para aqueles que querem vender WoW Tokens, se o preço aumentar o percentual será verde e vermelho em queda",
	["LDB_TOOLTIP"] = [=[Clique Esquerdo para comprar um Token
Clique Direito para abrir configurações]=],
	["PRICE"] = "preço"
}

--[===[@debug@ 
{}
--@end-debug@]===]
