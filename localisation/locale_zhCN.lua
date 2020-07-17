if ( GetLocale() ~= "zhCN" ) then
	return;
end
local ns = select( 2, ... );
ns.L = 
{
	--[[Translation missing --]]
	["COMMAND_CONFIG"] = "config|r show the configuration window",
	--[[Translation missing --]]
	["COMMAND_LIST"] = "WoW Token Watch Command List",
	--[[Translation missing --]]
	["COMMAND_PAUSE"] = "pause|r don't show the window until you either use resume or the session ends, the prices will still be updated",
	--[[Translation missing --]]
	["COMMAND_RESUME"] = "resume|r show the window again on price change",
	--[[Translation missing --]]
	["COMMAND_SHOW_WINDOW"] = "show|r show the window",
	--[[Translation missing --]]
	["COMMAND_WINDOW_PAUSED"] = "window showing paused",
	--[[Translation missing --]]
	["COMMAND_WINDOW_RESUMED"] = "window showing resumed",
	--[[Translation missing --]]
	["CONFIG_DELAY_COMBAT"] = "Delay showing the window in combat until it ended",
	--[[Translation missing --]]
	["CONFIG_DISABLE_POPUP"] = "Disable the window popup",
	--[[Translation missing --]]
	["CONFIG_DISABLE_POPUP_EXPLAIN"] = "The window wont popup on price change as long this is active",
	--[[Translation missing --]]
	["CONFIG_GOLD_THRESHOLD_BUYER"] = "Gold threshold (buyer mode), if the price is over this the window wont popup on price change, set it to 0 to not use this feature",
	--[[Translation missing --]]
	["CONFIG_GOLD_THRESHOLD_SELLER"] = [=[Gold threshold (seller mode), if the price is under this the window wont popup on price change, leave it to 0 to not use this feature
If both thresholds are set to 0 the window will always popup]=],
	--[[Translation missing --]]
	["CONFIG_INVERT_COLORS"] = "Invert the colors",
	--[[Translation missing --]]
	["CONFIG_INVERT_COLORS_EXPLAIN"] = "This is for those who wanna sell WoW Tokens, if the price increase the percentage will be green and red on decrease",
	--[[Translation missing --]]
	["LDB_TOOLTIP"] = [=[Left click to buyout an token
Right click to open config]=],
	--[[Translation missing --]]
	["PRICE"] = "price"
}

--[===[@debug@ 
{}
--@end-debug@]===]
