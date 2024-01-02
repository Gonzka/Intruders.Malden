class AlkWheel {
	idd = -1;
	duration = 99999;
	onLoad = "uiNamespace setVariable ['AlkWheel_HUD', _this select 0]";
	class controls {
		class mouseCursor {
			idc = 9275;
			x = "( safeZoneX + ( safeZoneWAbs / 2 )) - ( 0.15 / 2 )";
			y = "( safeZoneY + (safeZoneH / 2)) - (0.15 / 2)";
			w = 0.15000001;
			h = 0.15000001;
			colorBackground[] = {0,0,0,1};
			font = "PuristaLight";
			colorText[] = {1,1,1,1};
			sizeEx = "safezoneW / 40";
			type = 0;
			style = "2048 + 48";
			text = "\intruders_mod\textures\gui\logo.paa";
		};
	};
};