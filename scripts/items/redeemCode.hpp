class RedeemCodeMenu {
   idd = 8990;
   name = "RedeemCodeMenu";
   movingenable = 0;
   enablesimulation = 1;
   onload = "";
   class controlsBackground
   {
       class MainBackground : RscText
       {
			idc = 1002;
			text = "";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.264 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
       };
	   
		class RedBGTop: RscText
		{
			idc = -1;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.0055 * safezoneH;
			colorBackground[] = {0.7,0.13,0.13,1};
		};

		class RedBGBottom: RscText
		{
			idc = -1;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.0055 * safezoneH;
			colorBackground[] = {0.7,0.13,0.13,1};
		};

		class TextDescription: RscText
		{
			idc = -1;
			text = "$STR_GAME_EnterCode";
			font = PuristaLight;
			x = 0.446 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
			
			class Attributes {
				align="center";
			};
		};
   };
   
   class controls
   {
       class Baresearch : RscEdit
       {
			idc = 1003;
			text = "$STR_GAME_EnterCodeHere";
			x = 0.42875 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.1425 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
       };
	   
       class RedeemCode : RscButtonMenu
       {
			idc = -1;
			text = "$STR_GAME_Redeem";
			font = PuristaLight;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.7,0.13,0.13,1};
			onButtonClick = "playSound ""Click1""; [] spawn gonzka_fnc_redeemCode;";
			onMouseEnter = "playSound ""Click2"";";
			
			class Attributes {
				align="center";
			};
       };
	   
	   class ButtonClose: RscButtonMenu
		{
			idc = -1;
			text = "$STR_GAME_Close"; //--- ToDo: Localize;
			font = PuristaLight;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			onButtonClick = "playSound ""Click1""; closedialog 0;";
			onMouseEnter = "playSound ""Click2"";";
			
			class Attributes {
				align="center";
			};
		};
   };
};