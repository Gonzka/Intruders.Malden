#define ST_CENTER     0x02

class ShopMenu {
    idd = 100;
    movingEnable = false;
    enableSimulation = true;
    onLoad = "[] spawn gonzka_fnc_updateShopMenu";
    onUnLoad = "";
	class controlsBackground {
		class HeaderText : RscStructuredText {
            idc = -1;
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
			    class Frame_1 : RscFrame {
			    	idc = -1;
			    	x = -0.001 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_1 : RscPictureKeepAspect {
			    	idc = 102;
			    	x = 0 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_1 : RscButtonMenu {
			    	idc = 103;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = 0 * safezoneX;
			    	y = 0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.03 * safezoneH;
					style = ST_CENTER;
			    	colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
				        align="center";
			        };
			    };
				class Frame_2 : RscFrame {
			    	idc = -1;
			    	x = -0.001 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_2 : RscPictureKeepAspect {
			    	idc = 104;
			    	x = 0 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_2 : RscButtonMenu {
			    	idc = 105;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = 0 * safezoneX;
			    	y = -0.865 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.03 * safezoneH;
					style = ST_CENTER;
				    colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
				        align="center";
			        };
			    };
				
				class Frame_3 : RscFrame {
			    	idc = -1;
			    	x = -0.3 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_3 : RscPictureKeepAspect {
			    	idc = 106;
			    	x = -0.3 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_3 : RscButtonMenu {
			    	idc = 107;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = -0.3 * safezoneX;
			    	y = 0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.03 * safezoneH;
					style = ST_CENTER;
			    	colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
				        align="center";
			        };
			    };
				class Frame_4 : RscFrame {
			    	idc = -1;
			    	x = -0.3 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_4 : RscPictureKeepAspect {
			    	idc = 108;
			    	x = -0.3 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_4 : RscButtonMenu {
			    	idc = 109;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = -0.3 * safezoneX;
			    	y = -0.865 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.03 * safezoneH;
					style = ST_CENTER;
				    colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
				        align="center";
			        };
			    };
				
				class Frame_5 : RscFrame {
			    	idc = -1;
			    	x = -0.6 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_5 : RscPictureKeepAspect {
			    	idc = 110;
			    	x = -0.6 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_5 : RscButtonMenu {
			    	idc = 111;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = -0.6 * safezoneX;
			    	y = 0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.03 * safezoneH;
					style = ST_CENTER;
			    	colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
				        align="center";
			        };
			    };
				class Frame_6 : RscFrame {
			    	idc = -1;
			    	x = -0.6 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_6 : RscPictureKeepAspect {
			    	idc = 112;
			    	x = -0.6 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_6 : RscButtonMenu {
			    	idc = 113;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = -0.6 * safezoneX;
			    	y = -0.865 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.03 * safezoneH;
					style = ST_CENTER;
				    colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
				        align="center";
			        };
			    };
				
				class Frame_7 : RscFrame {
			    	idc = -1;
			    	x = -0.9 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_7 : RscPictureKeepAspect {
			    	idc = 114;
			    	x = -0.9 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_7 : RscButtonMenu {
			    	idc = 115;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = -0.9 * safezoneX;
			    	y = 0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.03 * safezoneH;
					style = ST_CENTER;
			    	colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
				        align="center";
			        };
			    };
				class Frame_8 : RscFrame {
			    	idc = -1;
			    	x = -0.9 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_8 : RscPictureKeepAspect {
			    	idc = 116;
			    	x = -0.9 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_8 : RscButtonMenu {
			    	idc = 117;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = -0.9 * safezoneX;
			    	y = -0.865 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.03 * safezoneH;
					style = ST_CENTER;
				    colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
				        align="center";
			        };
			    };
				
				class Frame_9 : RscFrame {
			    	idc = -1;
			    	x = -1.2 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_9 : RscPictureKeepAspect {
			    	idc = 118;
			    	x = -1.2 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_9 : RscButtonMenu {
			    	idc = 119;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = -1.2 * safezoneX;
			    	y = 0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.03 * safezoneH;
					style = ST_CENTER;
			    	colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
				        align="center";
			        };
			    };
				class Frame_10 : RscFrame {
			    	idc = -1;
			    	x = -1.2 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_10 : RscPictureKeepAspect {
			    	idc = 120;
			    	x = -1.2 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_10 : RscButtonMenu {
			    	idc = 121;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = -1.2 * safezoneX;
			    	y = -0.865 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.03 * safezoneH;
					style = ST_CENTER;
				    colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
				        align="center";
			        };
			    };
				
				class Frame_11 : RscFrame {
			    	idc = -1;
			    	x = -1.5 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_11 : RscPictureKeepAspect {
			    	idc = 122;
			    	x = -1.5 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_11 : RscButtonMenu {
			    	idc = 123;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = -1.5 * safezoneX;
			    	y = 0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.03 * safezoneH;
					style = ST_CENTER;
			    	colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
				        align="center";
			        };
			    };
				class Frame_12 : RscFrame {
			    	idc = -1;
			    	x = -1.5 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_12 : RscPictureKeepAspect {
			    	idc = 124;
			    	x = -1.5 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_12 : RscButtonMenu {
			    	idc = 125;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = -1.5 * safezoneX;
			    	y = -0.865 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.03 * safezoneH;
					style = ST_CENTER;
				    colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
				        align="center";
			        };
			    };
				
				class Frame_13 : RscFrame {
			    	idc = -1;
			    	x = -1.8 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_13 : RscPictureKeepAspect {
			    	idc = 126;
			    	x = -1.8 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_13 : RscButtonMenu {
			    	idc = 127;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = -1.8 * safezoneX;
			    	y = 0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.03 * safezoneH;
					style = ST_CENTER;
			    	colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
				        align="center";
			        };
			    };
				class Frame_14 : RscFrame {
			    	idc = -1;
			    	x = -1.8 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_14 : RscPictureKeepAspect {
			    	idc = 128;
			    	x = -1.8 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_14 : RscButtonMenu {
			    	idc = 129;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = -1.8 * safezoneX;
			    	y = -0.865 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.03 * safezoneH;
					style = ST_CENTER;
				    colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
				        align="center";
			        };
			    };
				
				class Frame_15 : RscFrame {
			    	idc = -1;
			    	x = -2.1 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_15 : RscPictureKeepAspect {
			    	idc = 130;
			    	x = -2.1 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_15 : RscButtonMenu {
			    	idc = 131;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = -2.1 * safezoneX;
			    	y = 0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.03 * safezoneH;
					style = ST_CENTER;
			    	colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
				        align="center";
			        };
			    };
				class Frame_16 : RscFrame {
			    	idc = -1;
			    	x = -2.1 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_16 : RscPictureKeepAspect {
			    	idc = 132;
			    	x = -2.1 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_16 : RscButtonMenu {
			    	idc = 133;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = -2.1 * safezoneX;
			    	y = -0.865 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.03 * safezoneH;
					style = ST_CENTER;
				    colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
				        align="center";
			        };
			    };
				
				class Frame_17 : RscFrame {
			    	idc = -1;
			    	x = -2.4 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_17 : RscPictureKeepAspect {
			    	idc = 134;
			    	x = -2.4 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_17 : RscButtonMenu {
			    	idc = 135;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = -2.4 * safezoneX;
			    	y = 0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.03 * safezoneH;
					style = ST_CENTER;
			    	colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
				        align="center";
			        };
			    };
				class Frame_18 : RscFrame {
			    	idc = -1;
			    	x = -2.4 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_18 : RscPictureKeepAspect {
			    	idc = 136;
			    	x = -2.4 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_18 : RscButtonMenu {
			    	idc = 137;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = -2.4 * safezoneX;
			    	y = -0.865 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.03 * safezoneH;
					style = ST_CENTER;
				    colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
				        align="center";
			        };
			    };
				
				class Frame_19 : RscFrame {
			    	idc = -1;
			    	x = -2.7 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_19 : RscPictureKeepAspect {
			    	idc = 138;
			    	x = -2.7 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_19 : RscButtonMenu {
			    	idc = 139;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = -2.7 * safezoneX;
			    	y = 0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.03 * safezoneH;
					style = ST_CENTER;
			    	colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
				        align="center";
			        };
			    };
				class Frame_20 : RscFrame {
			    	idc = -1;
			    	x = -2.7 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_20 : RscPictureKeepAspect {
			    	idc = 140;
			    	x = -2.7 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_20 : RscButtonMenu {
			    	idc = 141;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = -2.7 * safezoneX;
			    	y = -0.865 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.03 * safezoneH;
					style = ST_CENTER;
				    colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
				        align="center";
			        };
			    };
				
				class Frame_21 : RscFrame {
			    	idc = -1;
			    	x = -3.0 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_21 : RscPictureKeepAspect {
			    	idc = 142;
			    	x = -3.0 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_21 : RscButtonMenu {
			    	idc = 143;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = -3.0 * safezoneX;
			    	y = 0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.03 * safezoneH;
					style = ST_CENTER;
			    	colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
				        align="center";
			        };
			    };
				class Frame_22 : RscFrame {
			    	idc = -1;
			    	x = -3.0 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_22 : RscPictureKeepAspect {
			    	idc = 144;
			    	x = -3.0 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_22 : RscButtonMenu {
			    	idc = 145;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = -3.0 * safezoneX;
			    	y = -0.865 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.03 * safezoneH;
					style = ST_CENTER;
				    colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
				        align="center";
			        };
			    };
				
				class Frame_23 : RscFrame {
			    	idc = -1;
			    	x = -3.3 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_23 : RscPictureKeepAspect {
			    	idc = 146;
			    	x = -3.3 * safezoneX;
			    	y = -0.137 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_23 : RscButtonMenu {
			    	idc = 147;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = -3.3 * safezoneX;
			    	y = 0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.03 * safezoneH;
					style = ST_CENTER;
			    	colorBackground[] = {0.7,0.13,0.13,1};
					
					class Attributes {
				        align="center";
			        };
			    };
				class Frame_24 : RscFrame {
			    	idc = -1;
			    	x = -3.3 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	colorText[] = {0.7,0.13,0.13,1};
		        };
			    class Picture_24 : RscPictureKeepAspect {
			    	idc = 148;
			    	x = -3.3 * safezoneX;
			    	y = -1.0 * safezoneY;
			    	w = 0.0705 * safezoneW;
			    	h = 0.126 * safezoneH;
			    	text = "";
			    };
			    class Button_24 : RscButtonMenu {
			    	idc = 149;
					sizeEx = 0.035;
			    	font = PuristaBold;	
			    	x = -3.3 * safezoneX;
			    	y = -0.865 * safezoneY;
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