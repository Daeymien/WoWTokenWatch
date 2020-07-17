if ( GetLocale() ~= "ruRU" ) then
	return;
end
local ns = select( 2, ... );
ns.L = 
{
	["COMMAND_CONFIG"] = "config|r показать окно настроек",
	["COMMAND_LIST"] = "Список команд WoW Token Watch",
	["COMMAND_PAUSE"] = "pause|r не показывать всплывающее окно до введения команды resume или пока не закончится игровая сессия, цены будут обновляться",
	["COMMAND_RESUME"] = "resume|r показывать всплывающее окно при изменении цены",
	["COMMAND_SHOW_WINDOW"] = "show|r показать окно",
	["COMMAND_WINDOW_PAUSED"] = "Отображение всплывающего окна приостановлено",
	["COMMAND_WINDOW_RESUMED"] = "Отображение всплывающего окна возобновлено",
	["CONFIG_DELAY_COMBAT"] = "Отложить показ всплывающего окна в бою до его завершения",
	["CONFIG_DISABLE_POPUP"] = "Не показывать всплывающее окно",
	["CONFIG_DISABLE_POPUP_EXPLAIN"] = "Всплывающее окно не будет отображаться пока включена данная опция",
	["CONFIG_GOLD_THRESHOLD_BUYER"] = "Режим Покупателя. Если цена выше указанной, всплывающее окно не будет показано при изменении цены. Оставьте значение равное 0 если не хотите использовать эту функцию.",
	["CONFIG_GOLD_THRESHOLD_SELLER"] = "Режим Торговца. Если цена ниже указанной, всплывающее окно не будет показано при изменении цены. Оставьте значение равное 0 если не хотите использовать эту функцию.",
	["CONFIG_INVERT_COLORS"] = "Обратить Цвета",
	["CONFIG_INVERT_COLORS_EXPLAIN"] = "Данная опция предназначена для тех, кто хочет продавать WoW Token. Если цена увеличится, процент будет отображен зеленым. Если цена упадет - красным",
	["LDB_TOOLTIP"] = [=[Левый клик - выкупить жетон
Правый клик - открыть настройки]=],
	["PRICE"] = "цена"
}

--[===[@debug@ 
{}
--@end-debug@]===]