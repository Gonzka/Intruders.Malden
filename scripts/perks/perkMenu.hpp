#define ST_CENTER     0x02

class PerkMenu {
    idd = 9999;
    movingEnable = false;
    enableSimulation = true;
    onLoad = "[] spawn gonzka_fnc_updatePerkMenu";
    onUnLoad = "";
	class controlsBackground {	
		class MainBackground : RscText {
            idc = -1;
            x = 0.349479166666667 * safezoneW + safezoneX;
            y = 0.311701081612586 * safezoneH + safezoneY;
            h = 0.436578171091445 * safezoneH;
            w = 0.3 * safezoneW;
            colorbackground[] = {-1,-1,-1,0.7};
        };
		
		class RedBGTop: RscText {
			idc = -1;
            x = 0.349479166666667 * safezoneW + safezoneX;
            y = 0.311701081612586 * safezoneH + safezoneY;
            h = 0.00549999999999995 * safezoneH;
            w = 0.3 * safezoneW;
            colorbackground[] = {0.7,0.13,0.13,1};
		};
		
	   	class RedBGBottom: RscText {
			idc = -1;
			x = 0.349479166666667 * safezoneW + safezoneX;
            y = 0.742379547689282 * safezoneH + safezoneY;
            h = 0.00549999999999995 * safezoneH;
            w = 0.3 * safezoneW;
            colorbackground[] = {0.7,0.13,0.13,1};
		};
	};
	
    class controls {	
		class List: RscListbox {
			idc = 1500;
			sizeEx = 0.05;
            x = 0.349479166666667 * safezoneW + safezoneX;
            y = 0.523 * safezoneH + safezoneY;
            w = 0.3 * safezoneW;
			h = 0.219 * safezoneH;
		};
		
		class PerkTitle : RscText {
            idc = -1;
		    text = "$STR_GAME_SelectedPerks";
			font = PuristaBold;
            x = 0.349479166666667 * safezoneW + safezoneX;
            y = 0.319625038348083 * safezoneH + safezoneY;
            w = 0.3 * safezoneW;
            h = 0.039216 * safezoneH;
			style = ST_CENTER;
            colorbackground[] = {0.7,0.13,0.13,1};
        };
		
		//PERK 1
		class Background_1 : RscText {
			idc = -1;
            x = 0.349479166666667 * safezoneW + safezoneX;
            y = 0.39283185840708 * safezoneH + safezoneY;
			w = 0.0705 * safezoneW;
			h = 0.126 * safezoneH;
			colorBackground[] = {0.7,0.13,0.13,0.3};
		};
		class Picture_1 : RscPictureKeepAspect {
			idc = 1502;
            x = 0.349479166666667 * safezoneW + safezoneX;
            y = 0.39283185840708 * safezoneH + safezoneY;
			w = 0.0705 * safezoneW;
			h = 0.126 * safezoneH;
			text = "";
			tooltip = "";
		};
		class Button_1 : RscButtonMenu {
			idc = -1;
			sizeEx = 0.035;
			font = PuristaBold;	
            x = 0.349479166666667 * safezoneW + safezoneX;
            y = 0.36283185840708 * safezoneH + safezoneY;
			w = 0.0705 * safezoneW;
			h = 0.03 * safezoneH;
			style = ST_CENTER;
			colorBackground[] = {0.7,0.13,0.13,1};
			onButtonClick = "playSound ""Click1""; [1] call gonzka_fnc_selectPerk;";
			text = "$STR_GAME_Select";
			
			class Attributes {
				align="center";
			};
		};
		
		//PERK 2
		class Background_2 : RscText {
			idc = -1;
            x = 0.426 * safezoneW + safezoneX;
            y = 0.39283185840708 * safezoneH + safezoneY;
			w = 0.0705 * safezoneW;
			h = 0.126 * safezoneH;
			colorBackground[] = {0.7,0.13,0.13,0.3};
		};
		class Picture_2 : RscPictureKeepAspect {
			idc = 1503;
            x = 0.426 * safezoneW + safezoneX;
            y = 0.39283185840708 * safezoneH + safezoneY;
			w = 0.0705 * safezoneW;
			h = 0.126 * safezoneH;
			text = "";
			tooltip = "";
		};
		class Button_2 : RscButtonMenu {
			idc = -1;
			sizeEx = 0.035;
			font = PuristaBold;	
            x = 0.426 * safezoneW + safezoneX;
            y = 0.36283185840708 * safezoneH + safezoneY;
			w = 0.0705 * safezoneW;
			h = 0.03 * safezoneH;
			style = ST_CENTER;
			colorBackground[] = {0.7,0.13,0.13,1};
			onButtonClick = "playSound ""Click1""; [2] call gonzka_fnc_selectPerk;";
			text = "$STR_GAME_Select";
			
			class Attributes {
				align="center";
			};
		};
		
		//PERK 3
		class Background_3 : RscText {
			idc = -1;
            x = 0.5028 * safezoneW + safezoneX;
            y = 0.39283185840708 * safezoneH + safezoneY;
			w = 0.0705 * safezoneW;
			h = 0.126 * safezoneH;
			colorBackground[] = {0.7,0.13,0.13,0.3};
		};
		class Picture_3 : RscPictureKeepAspect {
			idc = 1504;
            x = 0.5028 * safezoneW + safezoneX;
            y = 0.39283185840708 * safezoneH + safezoneY;
			w = 0.0705 * safezoneW;
			h = 0.126 * safezoneH;
			text = "";
			tooltip = "";
		};
		class Button_3 : RscButtonMenu {
			idc = -1;
			sizeEx = 0.035;
			font = PuristaBold;	
            x = 0.5028 * safezoneW + safezoneX;
            y = 0.36283185840708 * safezoneH + safezoneY;
			w = 0.0705 * safezoneW;
			h = 0.03 * safezoneH;
			style = ST_CENTER;
			colorBackground[] = {0.7,0.13,0.13,1};
			onButtonClick = "playSound ""Click1""; [3] call gonzka_fnc_selectPerk;";
			text = "$STR_GAME_Select";
			
			class Attributes {
				align="center";
			};
		};

		//PERK 4
		class Background_4 : RscText {
			idc = -1;
            x = 0.5793 * safezoneW + safezoneX;
            y = 0.39283185840708 * safezoneH + safezoneY;
			w = 0.0705 * safezoneW;
			h = 0.126 * safezoneH;
			colorBackground[] = {0.7,0.13,0.13,0.3};
		};
		class Picture_4 : RscPictureKeepAspect {
			idc = 1505;
            x = 0.5793 * safezoneW + safezoneX;
            y = 0.39283185840708 * safezoneH + safezoneY;
			w = 0.0705 * safezoneW;
			h = 0.126 * safezoneH;
			text = "";
			tooltip = "";
		};
		class Button_4 : RscButtonMenu {
			idc = -1;
			sizeEx = 0.035;
			font = PuristaBold;	
            x = 0.5793 * safezoneW + safezoneX;
            y = 0.36283185840708 * safezoneH + safezoneY;
			w = 0.0705 * safezoneW;
			h = 0.03 * safezoneH;
			style = ST_CENTER;
			colorBackground[] = {0.7,0.13,0.13,1};
			onButtonClick = "playSound ""Click1""; [4] call gonzka_fnc_selectPerk;";
			text = "$STR_GAME_Select";
			
			class Attributes {
				align="center";
			};
		};
		
		class Close : RscButtonMenu {
		   	idc = -1;
			text = "$STR_GAME_Close";
			font = PuristaLight;
            x = 0.4525 * safezoneW + safezoneX;
            y = 0.75 * safezoneH + safezoneY;
            w = 0.094 * safezoneW;
            h = 0.03 * safezoneH;
			style = ST_CENTER;
			colorBackground[] = {-1,-1,-1,1};
			onButtonClick = "playSound ""Click1""; closedialog 0;";
			onMouseEnter = "playSound ""Click2"";";
			
			class Attributes {
				align="center";
			};
        };
    };
};