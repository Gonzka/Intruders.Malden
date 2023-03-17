////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Gonzka, v1.063, #Lozovo)
////////////////////////////////////////////////////////

class statusBar
{
	idd = -1;
	name = "statusBar";
	movingEnable = 0;
	duration = 99999999;
	onLoad = "with uiNameSpace do { statusBar = _this select 0 }";

    class controlsBackground {
        class Menu: RscPictureKeepAspect {
            idc = 4000;
            text = "\intruders_mod\textures\gui\hud_0.paa";
            x = 0.008 * safezoneW + safezoneX;
            y = 0.56 * safezoneH + safezoneY;
            w = 0.324 * safezoneW;
            h = 0.55 * safezoneH;
        };
		
		class Perks: RscPictureKeepAspect {
            idc = 4013;
            text = "\intruders_mod\textures\gui\hud_perks.paa";
            x = 0.76 * safezoneW + safezoneX;
            y = 0.6 * safezoneH + safezoneY;
            w = 0.324 * safezoneW;
            h = 0.55 * safezoneH;
        };
	};
	
	class controls 
	{
		class Survivor1Pic: RscPictureKeepAspect {
			idc = 4001;
			text = "";
			x = 0.060750 * safezoneW + safezoneX;
			y = 0.894037 * safezoneH + safezoneY;
			w = 0.030080 * safezoneW;
			h = 0.058414 * safezoneH;
		};
		
		class Survivor2Pic: RscPictureKeepAspect {
			idc = 4002;
			text = "";
			x = 0.120750 * safezoneW + safezoneX;
			y = 0.894037 * safezoneH + safezoneY;
			w = 0.030080 * safezoneW;
			h = 0.058414 * safezoneH;
		};
		
		class Survivor3Pic: RscPictureKeepAspect {
			idc = 4003;
			text = "";
			x = 0.180750 * safezoneW + safezoneX;
			y = 0.894037 * safezoneH + safezoneY;
			w = 0.030080 * safezoneW;
			h = 0.058414 * safezoneH;
		};
		
		class Survivor4Pic: RscPictureKeepAspect {
			idc = 4004;
			text = "";
			x = 0.240750 * safezoneW + safezoneX;
			y = 0.894037 * safezoneH + safezoneY;
			w = 0.030080 * safezoneW;
			h = 0.058414 * safezoneH;
		};
		
		class Survivor1Name: RscText {
			idc = 4005;
			text = "";
			x = 0.057 * safezoneW + safezoneX;
			y = 0.953208 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.021428 * safezoneH;
			sizeEx = 0.03;
		};
		
		class Survivor2Name: RscText {
			idc = 4006;
			text = "";
			x = 0.117 * safezoneW + safezoneX;
			y = 0.953208 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.021428 * safezoneH;
			sizeEx = 0.03;
		};
		
		class Survivor3Name: RscText {
			idc = 4007;
			text = "";
			x = 0.177 * safezoneW + safezoneX;
			y = 0.953208 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.021428 * safezoneH;
			sizeEx = 0.03;
		};
		
		class Survivor4Name: RscText {
			idc = 4008;
			text = "";
			x = 0.237 * safezoneW + safezoneX;
			y = 0.953208 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.021428 * safezoneH;
			sizeEx = 0.03;
		};
		
		class Perk1: RscPictureKeepAspect {
			idc = 4009;
			text = "";
			x = 0.8835 * safezoneW + safezoneX;
			y = 0.802 * safezoneH + safezoneY;
			w = 0.030080 * safezoneW;
			h = 0.058414 * safezoneH;
		};
		
		class Perk2: RscPictureKeepAspect {
			idc = 4010;
			text = "";
			x = 0.9295 * safezoneW + safezoneX;
			y = 0.802 * safezoneH + safezoneY;
			w = 0.030080 * safezoneW;
			h = 0.058414 * safezoneH;
		};
		
		class Perk3: RscPictureKeepAspect {
			idc = 4011;
			text = "";
			x = 0.8835 * safezoneW + safezoneX;
			y = 0.89 * safezoneH + safezoneY;
			w = 0.030080 * safezoneW;
			h = 0.058414 * safezoneH;
		};
		
		class Perk4: RscPictureKeepAspect {
			idc = 4012;
			text = "";
			x = 0.9295 * safezoneW + safezoneX;
			y = 0.89 * safezoneH + safezoneY;
			w = 0.030080 * safezoneW;
			h = 0.058414 * safezoneH;
		};
	};
};