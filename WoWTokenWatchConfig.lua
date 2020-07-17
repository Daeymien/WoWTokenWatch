local config = CreateFrame("Frame");
local defaultconf = {["DelayInCombat"]=false,["GoldThreshold"]=0,["DisablePopup"]=false,["GoldThresholdSeller"]=0,["ColorInvert"]=false,}

local ns = select( 2, ... )
ns.config = {};
local lastattached={};
ns.cframe = config;
local metatable = {};
L = ns.L;
metatable.__index = function( inTable, inKey )
  value = defaultconf[inKey];
  inTable[ inKey ] = value;
  return value;
end

local function CreateCheckbox(wframe,button_name,button_text,frametype,inheritframe,button_helper_text)
	 local newcheckbox = CreateFrame( frametype, "WoWTokenWatch_"..button_name, wframe, inheritframe );
	 wframe[button_name] = newcheckbox;
	 newcheckbox.id = button_name;
	 if( not lastattached[wframe.name]) then
		newcheckbox:SetPoint( "TOPLEFT", 16, -16 );
	else
		newcheckbox:SetPoint("TOPLEFT", lastattached[wframe.name],"BOTTOMLEFT", 0, -15);
	end
	
	 if frametype == "CheckButton" then
		newcheckbox:SetScript("onClick",config.ChangeState);
	
		_G[ newcheckbox:GetName().."Text" ]:SetText( "|c00dfb802"..button_text );
	elseif frametype == "EditBox" then
		--print(frametype);
		--newcheckbox:SetScript("OnChar",config.EditBoxChanged);
		newcheckbox.gold:SetScript("OnChar",config.EditBoxChanged);
	end 
	 lastattached[wframe.name] = newcheckbox;
	 
	 if(button_helper_text) then
		local newcheckboxexplain = wframe:CreateFontString( nil, "OVERLAY", "GameFontHighlight" );
		wframe[button_name.."Explain"] = newcheckboxexplain;
		newcheckboxexplain:SetPoint("TOPLEFT", lastattached[wframe.name],"BOTTOMLEFT", 0, 0)
		newcheckboxexplain:SetWidth(InterfaceOptionsFramePanelContainer:GetRight() - InterfaceOptionsFramePanelContainer:GetLeft() - 30);
		newcheckboxexplain:SetJustifyH("LEFT");
		newcheckboxexplain:SetText( button_helper_text);
		lastattached[wframe.name] = newcheckboxexplain;
	 end

end


function config:Init()

	config.name = "WoW Token Watch";
		
	CreateCheckbox(config,"DelayInCombat",L.CONFIG_DELAY_COMBAT,"CheckButton","InterfaceOptionsCheckButtonTemplate");
	CreateCheckbox(config,"DisablePopup",L.CONFIG_DISABLE_POPUP,"CheckButton","InterfaceOptionsCheckButtonTemplate",L.CONFIG_DISABLE_POPUP_EXPLAIN);
	CreateCheckbox(config,"GoldThreshold","","EditBox","MoneyInputFrameTemplate", L.CONFIG_GOLD_THRESHOLD_BUYER);

	CreateCheckbox(config,"GoldThresholdSeller","","EditBox","MoneyInputFrameTemplate", L.CONFIG_GOLD_THRESHOLD_SELLER);
	CreateCheckbox(config,"ColorInvert",L.CONFIG_INVERT_COLORS,"CheckButton","InterfaceOptionsCheckButtonTemplate",L.CONFIG_INVERT_COLORS_EXPLAIN);
	InterfaceOptions_AddCategory(config);

	if not(WoWTokenSave.config) then
		WoWTokenSave.config = defaultconf
	end
	
	
	setmetatable(WoWTokenSave.config,metatable);
	ns.config = WoWTokenSave.config		
	config:SetCurrentConfig();
	
end


function config:SetCurrentConfig()
	for key, _ in pairs(defaultconf) do
		if _G["WoWTokenWatch_"..key] and _G["WoWTokenWatch_"..key]:GetObjectType() == "CheckButton" then
			_G["WoWTokenWatch_"..key]:SetChecked(ns.config[key]);
		elseif (key == "GoldThreshold" or key == "GoldThresholdSeller") then
		
			--_G["WoWTokenWatch_"..key].gold:SetWidth(150);
			_G["WoWTokenWatch_"..key].silver:Hide();
			_G["WoWTokenWatch_"..key].copper:Hide();
			
			_G["WoWTokenWatch_"..key]:ClearFocus()
			_G["WoWTokenWatch_"..key]:SetAutoFocus(false)
			_G["WoWTokenWatch_"..key].gold:SetNumber(ns.config[key]);
			_G["WoWTokenWatch_"..key].gold:SetCursorPosition(0)
		end
	end
end

function config:EditBoxChanged()
	ns.config[self:GetParent().id] = self:GetNumber()
end


function config:ChangeState()
	
		ns.config[self.id] = self:GetChecked();

end
