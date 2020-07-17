local ns = select( 2, ... );

ns.L = {
	COMMAND_LIST = "WoW Token Watch Command List",
	COMMAND_SHOW_WINDOW = "show|r show the window",
	COMMAND_PAUSE = "pause|r don't show the window until you either use resume or the session ends, the prices will still be updated",
	COMMAND_RESUME = "resume|r show the window again on price change",
	COMMAND_CONFIG = "config|r show the configuration window",
	COMMAND_WINDOW_PAUSED = "window showing paused",
	COMMAND_WINDOW_RESUMED = "window showing resumed",
	PRICE = "price",
	LDB_TOOLTIP = "Left click to buyout an token\nRight click to open config",
	CONFIG_DELAY_COMBAT = "Delay showing the window in combat until it ended",
	CONFIG_DISABLE_POPUP = "Disable the window popup",
	CONFIG_DISABLE_POPUP_EXPLAIN = "The window wont popup on price change as long this is active",
	CONFIG_GOLD_THRESHOLD_BUYER = "Gold threshold (buyer mode), if the price is over this the window wont popup on price change, set it to 0 to not use this feature",
	CONFIG_GOLD_THRESHOLD_SELLER = "Gold threshold (seller mode), if the price is under this the window wont popup on price change, leave it to 0 to not use this feature\nIf both thresholds are set to 0 the window will always popup",
	CONFIG_INVERT_COLORS = "Invert the colors",
	CONFIG_INVERT_COLORS_EXPLAIN = "This is for those who wanna sell WoW Tokens, if the price increase the percentage will be green and red on decrease",
}
