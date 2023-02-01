#define ST_CENTER     0x02

class ShopMenu {
	idd = 100;
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn gonzka_fnc_updateShopMenu";
	onUnLoad = "";
	class controlsBackground {
		class HeaderText : RscStructuredText {
			idc = 99;
			text = "$STR_MM_SHOP";
			font = PuristaLight;
			x = 0.349479166666667 * safezoneW + safezoneX;
			y = 0.289501966568338 * safezoneH + safezoneY;
			h = 0.035 * safezoneH;
			w = 0.3 * safezoneW;
		};
		
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
		
		class BloodpointsInfo : RscText {
			idc = 101;
			text = "";
			font = PuristaBold;
			x = 0.349479166666667 * safezoneW + safezoneX;
			y = 0.319625038348083 * safezoneH + safezoneY;
			w = 0.3 * safezoneW;
			h = 0.039216 * safezoneH;
			style = ST_CENTER;
			colorbackground[] = {0.7,0.13,0.13,1};
		};
		
		class ControlsGroup : RscControlsGroup {
			x = 0.349479166666667 * safezoneW + safezoneX;
			y = 0.36283185840708 * safezoneH + safezoneY;
			w = 0.3 * safezoneW;
			h = 0.38 * safezoneH;
			class Controls {
				class Background_Featured : RscText {
					idc = -1;
					text = "";
					x = 0 * safezoneX;
					y = -0.137 * safezoneY;
					w = 0.123375 * safezoneW;
					h = 0.29 * safezoneH;
					colorBackground[] = {0.7,0.13,0.13,0.3};
				};
				class Picture_Featured : RscPictureKeepAspect {
					idc = 102;
					x = 0 * safezoneX;
					y = -0.137 * safezoneY;
					w = 0.123375 * safezoneW;
					h = 0.29 * safezoneH;
					text = "";
				};
				class Info_Featured : RscText {
					idc = -1;
					text = "$STR_GAME_FeaturedItem";
					font = PuristaBold;
					x = 0 * safezoneX;
					y = 0 * safezoneY;
					w = 0.123375 * safezoneW;
					h = 0.03 * safezoneH;
					style = ST_CENTER;
					colorBackground[] = {0.7,0.13,0.13,1};
				};
				class Button_Featured : RscButtonMenu {
					idc = 103;
					sizeEx = 0.035;
					font = PuristaBold;	
					x = 0 * safezoneX;
					y = -1.42 * safezoneY;
					w = 0.123375 * safezoneW;
					h = 0.03 * safezoneH;
					style = ST_CENTER;
					colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
						align="center";
					};
				};
				
				class Background_1 : RscText {
					idc = -1;
					text = "";
					x = -0.47 * safezoneX;
					y = 0 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.126 * safezoneH;
					colorBackground[] = {0.7,0.13,0.13,0.3};
				};
				class Picture_1 : RscPictureKeepAspect {
					idc = 104;
					x = -0.47 * safezoneX;
					y = 0 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.126 * safezoneH;
					text = "";
				};
				class Button_1 : RscButtonMenu {
					idc = 105;
					sizeEx = 0.035;
					font = PuristaBold;	
					x = -0.47 * safezoneX;
					y = -0.56 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.03 * safezoneH;
					style = ST_CENTER;
					colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
						align="center";
					};
				};
				class Background_2 : RscText {
					idc = -1;
					text = "";
					x = -0.47 * safezoneX;
					y = -0.86 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.126 * safezoneH;
					colorBackground[] = {0.7,0.13,0.13,0.3};
				};
				class Picture_2 : RscPictureKeepAspect {
					idc = 106;
					x = -0.47 * safezoneX;
					y = -0.86 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.126 * safezoneH;
					text = "";
				};
				class Button_2 : RscButtonMenu {
					idc = 107;
					sizeEx = 0.035;
					font = PuristaBold;	
					x = -0.47 * safezoneX;
					y = -1.42 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.03 * safezoneH;
					style = ST_CENTER;
					colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
						align="center";
					};
				};
				
				class Background_3 : RscText {
					idc = -1;
					text = "";
					x = -0.73 * safezoneX;
					y = 0 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.126 * safezoneH;
					colorBackground[] = {0.7,0.13,0.13,0.3};
				};
				class Picture_3 : RscPictureKeepAspect {
					idc = 108;
					x = -0.73 * safezoneX;
					y = 0 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.126 * safezoneH;
					text = "";
				};
				class Button_3 : RscButtonMenu {
					idc = 109;
					sizeEx = 0.035;
					font = PuristaBold;	
					x = -0.73 * safezoneX;
					y = -0.56 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.03 * safezoneH;
					style = ST_CENTER;
					colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
						align="center";
					};
				};
				class Background_4 : RscText {
					idc = -1;
					text = "";
					x = -0.73 * safezoneX;
					y = -0.86 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.126 * safezoneH;
					colorBackground[] = {0.7,0.13,0.13,0.3};
				};
				class Picture_4 : RscPictureKeepAspect {
					idc = 110;
					x = -0.73 * safezoneX;
					y = -0.86 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.126 * safezoneH;
					text = "";
				};
				class Button_4 : RscButtonMenu {
					idc = 111;
					sizeEx = 0.035;
					font = PuristaBold;	
					x = -0.73 * safezoneX;
					y = -1.42 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.03 * safezoneH;
					style = ST_CENTER;
					colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
						align="center";
					};
				};
				
				class Background_5 : RscText {
					idc = -1;
					text = "";
					x = -0.99 * safezoneX;
					y = 0 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.126 * safezoneH;
					colorBackground[] = {0.7,0.13,0.13,0.3};
				};
				class Picture_5 : RscPictureKeepAspect {
					idc = 112;
					x = -0.99 * safezoneX;
					y = 0 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.126 * safezoneH;
					text = "";
				};
				class Button_5 : RscButtonMenu {
					idc = 113;
					sizeEx = 0.035;
					font = PuristaBold;	
					x = -0.99 * safezoneX;
					y = -0.56 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.03 * safezoneH;
					style = ST_CENTER;
					colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
						align="center";
					};
				};
				class Background_6 : RscText {
					idc = -1;
					text = "";
					x = -0.99 * safezoneX;
					y = -0.86 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.126 * safezoneH;
					colorBackground[] = {0.7,0.13,0.13,0.3};
				};
				class Picture_6 : RscPictureKeepAspect {
					idc = 114;
					x = -0.99 * safezoneX;
					y = -0.86 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.126 * safezoneH;
					text = "";
				};
				class Button_6 : RscButtonMenu {
					idc = 115;
					sizeEx = 0.035;
					font = PuristaBold;	
					x = -0.99 * safezoneX;
					y = -1.42 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.03 * safezoneH;
					style = ST_CENTER;
					colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
						align="center";
					};
				};
				
				class Background_7 : RscText {
					idc = -1;
					text = "";
					x = -1.25 * safezoneX;
					y = 0 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.126 * safezoneH;
					colorBackground[] = {0.7,0.13,0.13,0.3};
				};
				class Picture_7 : RscPictureKeepAspect {
					idc = 116;
					x = -1.25 * safezoneX;
					y = 0 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.126 * safezoneH;
					text = "";
				};
				class Button_7 : RscButtonMenu {
					idc = 117;
					sizeEx = 0.035;
					font = PuristaBold;	
					x = -1.25 * safezoneX;
					y = -0.56 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.03 * safezoneH;
					style = ST_CENTER;
					colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
						align="center";
					};
				};
				class Background_8 : RscText {
					idc = -1;
					text = "";
					x = -1.25 * safezoneX;
					y = -0.86 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.126 * safezoneH;
					colorBackground[] = {0.7,0.13,0.13,0.3};
				};
				class Picture_8 : RscPictureKeepAspect {
					idc = 118;
					x = -1.25 * safezoneX;
					y = -0.86 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.126 * safezoneH;
					text = "";
				};
				class Button_8 : RscButtonMenu {
					idc = 119;
					sizeEx = 0.035;
					font = PuristaBold;	
					x = -1.25 * safezoneX;
					y = -1.42 * safezoneY;
					w = 0.0705 * safezoneW;
					h = 0.03 * safezoneH;
					style = ST_CENTER;
					colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
						align="center";
					};
				};
			};
		};
	};
};