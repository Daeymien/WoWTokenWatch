local ns = select( 2, ... )
local f  = CreateFrame("frame",nil,UIParent);
f:SetWidth(250)
f:SetHeight(63)
	local backdrop = 
	{
		bgFile = "Interface/DialogFrame/UI-DialogBox-Background", 
		edgeFile = "Interface/DialogFrame/UI-DialogBox-Border", 
		tile = false,
		tileSize = 32,
		edgeSize = 16,
		insets = { left = 4, right = 4, top = 4, bottom = 4 }
	}
f:SetBackdrop(backdrop) --StaticPopup1:GetBackdrop())
f.tokenprice = f:CreateFontString(nil, "BACKGROUND", "GameFontHighlight")
f.tokenprice:SetPoint("TOPLEFT",15,-15)
f.buytoken =  CreateFrame("button",nil,f,"OptionsButtonTemplate");
f.buytoken:SetText("Buy Token");
f.buytoken:SetWidth(f.buytoken:GetTextWidth()+20);
f.buytoken:SetPoint("BOTTOMLEFT",f,10,10);
f.buytoken:Show();
f.buytoken:SetScript("onclick",function () f:Buyout(); end);
f.closewindow =  CreateFrame("button",nil,f,"OptionsButtonTemplate");
f.closewindow:SetText("Close");
f.closewindow:SetWidth(f.closewindow:GetTextWidth()+20);
f.closewindow:SetPoint("BOTTOMRIGHT",f,-10,10);
f.closewindow:Show()
f.closewindow:SetScript("onclick",function () f:Hide() end);
L = ns.L;
f:Hide()
local lwin = LibStub("LibWindow-1.1")
local ldb =  LibStub:GetLibrary("LibDataBroker-1.1");
local save;
local ticker;
local pause=false;
local combat_watch = false;

local function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

function f:Buyout()
	LoadAddOn("Blizzard_AuctionUI"); 
	BrowseWowTokenResultsBuyout_OnClick();
end

SLASH_WOWTOKENWATCH1, SLASH_WOWTOKENWATCH2 = '/wtw', '/wowtokenwatch';
function f:CmdHandler(msg, editbox)
  if msg == "show" then
	f:Show();
  elseif msg == "pause" then
	print ("|cFF00FF00 WoW Token Watch|r "..L.COMMAND_WINDOW_PAUSED)
	pause = true;
  elseif msg == "resume" then
	print ("|cFF00FF00 WoW Token Watch|r "..L.COMMAND_WINDOW_RESUMED)
	pause = false;
  elseif msg == "config" then
  --for some reason only works if called twice
	InterfaceOptionsFrame_OpenToCategory("WoW Token Watch")
	InterfaceOptionsFrame_OpenToCategory("WoW Token Watch")
  else
	print ("|cFF00FF00"..L.COMMAND_LIST);
	print ("|cFF00FF00"..L.COMMAND_SHOW_WINDOW)
	print ("|cFF00FF00 "..L.COMMAND_PAUSE)
	print ("|cFF00FF00 "..L.COMMAND_RESUME)
	print ("|cFF00FF00 "..L.COMMAND_CONFIG)
	
  end
end
SlashCmdList["WOWTOKENWATCH"] = function(message, editbox) f:CmdHandler(message, editbox) end

function f:OnLoad()
    f:SetScript("OnEvent",f.EventHandler);
	f:RegisterEvent("TOKEN_MARKET_PRICE_UPDATED");
	f:RegisterEvent("ADDON_LOADED");
end


function f:UpdatePrice()
	local curprice =  C_WowTokenPublic.GetCurrentMarketPrice();
			local pricediff_string = "";
			if (curprice > 0 and curprice ~= save.lastprice) then
				if save.lastprice ~=nil and save.lastprice>0 then
					local pricediff = round((curprice/save.lastprice)*100-100,2)
					local color = "";
					if pricediff>0 then
						if ns.config["ColorInvert"] == true then
							color = "|cFF00FF00"
						else
							color = "|cFFFF0000"
						end
						pricediff = "+"..pricediff
					else
						if ns.config["ColorInvert"] == true then
							color = "|cFFFF0000"
						else
							color = "|cFF00FF00"
						end
						
					end
					pricediff_string = " ("..color..pricediff.."%|r)"
				end
				save.lastprice = curprice
				f.tokenprice:SetText("WoW Token price: "..GetMoneyString(curprice)..pricediff_string)
				self.databroker.text = GetMoneyString(curprice)..pricediff_string
				if pause == true or ns.config["DisablePopup"] == true then return end
				if ns.config["GoldThreshold"]>0 and ns.config["GoldThresholdSeller"]>0 then
					if curprice > ns.config["GoldThreshold"]*100*100 and curprice < ns.config["GoldThresholdSeller"]*100*100 then
						
						return
					end
				elseif ns.config["GoldThreshold"]>0 then
					if curprice > ns.config["GoldThreshold"]*100*100 then
						
						return
					end
				
				elseif ns.config["GoldThresholdSeller"]>0 then
					if curprice < ns.config["GoldThresholdSeller"]*100*100 then
						
						return
					end
				end
				--curprice>ns.config["GoldThreshold"]*100*100
				if ns.config["DelayInCombat"] == true and InCombatLockdown() == true then
					if combat_watch == false then
						f:RegisterEvent("PLAYER_REGEN_ENABLED");
						combat_watch = true
					end
					return;
				end
				f:Show();
			else
				
				--only do this if there is no current price
				if f.tokenprice:GetText()== nil then
					f.tokenprice:SetText("WoW Token"..L.PRICE..": "..GetMoneyString(curprice))
					self.databroker.text = GetMoneyString(curprice)
				end
			end
	
end

function f:LDBClick(button)
	--print(button);
	if(button=="RightButton") then
		InterfaceOptionsFrame_OpenToCategory("WoW Token Watch")
	InterfaceOptionsFrame_OpenToCategory("WoW Token Watch")
	else
		f.Buyout();
	end

end

function f:EventHandler(event,...)
	if (event == "TOKEN_MARKET_PRICE_UPDATED") then
		f:UpdatePrice();
	elseif (event == "PLAYER_REGEN_ENABLED") then
		f:UnregisterEvent("PLAYER_REGEN_ENABLED");
		combat_watch = false;
		C_Timer.After(2,function () f:Show() end);
	
	elseif(event=="ADDON_LOADED") then
		local addonname = ...;
		if(addonname=="WoWTokenWatch") then
			
			if not WoWTokenSave then
				
				WoWTokenSave = {}
			end
			save = WoWTokenSave
			if not(save.npoints) then
				
				save.npoints = {}
			end
			ns.cframe:Init();
			lwin.RegisterConfig(f, save.npoints)
			lwin.RestorePosition(f)  -- restores scale also
			C_WowTokenPublic.UpdateMarketPrice();
			ticker = C_Timer.NewTicker(60, function () C_WowTokenPublic.UpdateMarketPrice(); end)
			self.databroker = ldb:NewDataObject("WoW Token Watch", { type = "data source", text = "", icon = "Interface\\Icons\\WoW_Token01", OnTooltipShow = function (self) self:AddLine(L.LDB_TOOLTIP) end, OnClick = f.LDBClick });
		end
		
	end
end

--f:Hide();
f:EnableMouse(true)
f:RegisterForDrag("LeftButton");
f:SetMovable(true);
f:SetScript("OnDragStart", function(self)  self:StartMoving() end)
f:SetScript("OnDragStop", function(self)  self:StopMovingOrSizing(); lwin.SavePosition(self); end);
f:OnLoad();
