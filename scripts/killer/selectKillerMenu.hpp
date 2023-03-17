#define ST_CENTER     0x02

class SelectKillerMenu {
    idd = -1;
    movingEnable = false;
    enableSimulation = true;
    onLoad = "escKeyEH = (_this select 0) displayAddEventHandler [""KeyDown"", ""if (((_this select 1) == 1)) then {true};""];";
    onUnLoad = "";
	class controlsBackground {	
		class MainBackground : RscText {
            idc = -1;
            x = 0.349479166666667 * safezoneW + safezoneX;
            y = 0.311301081612586 * safezoneH + safezoneY;
            h = 0.266578171091445 * safezoneH;
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
            y = 0.572379547689282 * safezoneH + safezoneY;
            h = 0.00549999999999995 * safezoneH;
            w = 0.3 * safezoneW;
            colorbackground[] = {0.7,0.13,0.13,1};
		};
	};
	
    class controls {	
		class KillerTitle : RscText {
            idc = -1;
		    text = "$STR_GAME_SelectKiller";
			font = PuristaBold;
            x = 0.349479166666667 * safezoneW + safezoneX;
            y = 0.319625038348083 * safezoneH + safezoneY;
            w = 0.3 * safezoneW;
            h = 0.039216 * safezoneH;
			style = ST_CENTER;
            colorbackground[] = {0.7,0.13,0.13,1};
        };
		
		//KILLER 1
		class SelectKiller_1 : RscButtonMenu {
			idc = -1;
			font = PuristaBold;	
            x = 0.349479166666667 * safezoneW + safezoneX;
            y = 0.36283185840708 * safezoneH + safezoneY;
			w = 0.094 * safezoneW;
			h = 0.03 * safezoneH;
			style = ST_CENTER;
			colorBackground[] = {0.7,0.13,0.13,1};
			onButtonClick = "playSound ""Click1""; [1] call gonzka_fnc_selectKiller;";
			text = "$STR_GAME_Select";
		};
		
		class KillerFrame_1 : RscText {
			idc = -1;
            x = 0.349479166666667 * safezoneW + safezoneX;
            y = 0.39283185840708 * safezoneH + safezoneY;
			w = 0.094 * safezoneW;
			h = 0.168 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		
		class KillerPicture_1 : RscPictureKeepAspect {
			idc = -1;
            x = 0.349479166666667 * safezoneW + safezoneX;
            y = 0.39283185840708 * safezoneH + safezoneY;
			w = 0.094 * safezoneW;
			h = 0.168 * safezoneH;
			text = "\intruders_mod\textures\portraits\ico_wendigo.paa";
			tooltip = "$STR_GAME_WendigoTooltip";
		};
		
		//KILLER 2
		class SelectKiller_2 : RscButtonMenu {
			idc = -1;
			font = PuristaBold;	
            x = 0.4525 * safezoneW + safezoneX;
            y = 0.36283185840708 * safezoneH + safezoneY;
			w = 0.094 * safezoneW;
			h = 0.03 * safezoneH;
			style = ST_CENTER;
			colorBackground[] = {0.7,0.13,0.13,1};
			onButtonClick = "playSound ""Click1""; [2] call gonzka_fnc_selectKiller;";
			text = "$STR_GAME_Select";
		};
		
		class KillerFrame_2 : RscText {
			idc = -1;
            x = 0.4525 * safezoneW + safezoneX;
            y = 0.39283185840708 * safezoneH + safezoneY;
			w = 0.094 * safezoneW;
			h = 0.168 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		
		class KillerPicture_2 : RscPictureKeepAspect {
			idc = -1;
            x = 0.4525 * safezoneW + safezoneX;
            y = 0.39283185840708 * safezoneH + safezoneY;
			w = 0.094 * safezoneW;
			h = 0.168 * safezoneH;
			text = "\intruders_mod\textures\portraits\ico_buckethead.paa";
			tooltip = "$STR_GAME_BucketheadTooltip";
		};
		
		//KILLER 3
		class SelectKiller_3 : RscButtonMenu {
			idc = -1;
			font = PuristaBold;	
            x = 0.5555 * safezoneW + safezoneX;
            y = 0.36283185840708 * safezoneH + safezoneY;
			w = 0.094 * safezoneW;
			h = 0.03 * safezoneH;
			style = ST_CENTER;
			colorBackground[] = {0.7,0.13,0.13,1};
			onButtonClick = "playSound ""Click1""; [3] call gonzka_fnc_selectKiller;";
			text = "$STR_GAME_Select";
		};
		
		class KillerFrame_3 : RscText {
			idc = -1;
            x = 0.5555 * safezoneW + safezoneX;
            y = 0.39283185840708 * safezoneH + safezoneY;
			w = 0.094 * safezoneW;
			h = 0.168 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		
		class KillerPicture_3 : RscPictureKeepAspect {
			idc = -1;
            x = 0.5555 * safezoneW + safezoneX;
            y = 0.39283185840708 * safezoneH + safezoneY;
			w = 0.094 * safezoneW;
			h = 0.168 * safezoneH;
			text = "\intruders_mod\textures\portraits\ico_trapper.paa";
			tooltip = "$STR_GAME_TrapperTooltip";
		};
    };
};