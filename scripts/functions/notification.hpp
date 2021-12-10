////////////////////////////////////////////////
// GUI Made by BioniC for LivoniaLife.de #Hyqepo
////////////////////////////////////////////////

class notification
{
	idd = 60550;
	name = "notification";
	movingEnable= 0;
	fadein= 0.1;
	duration = 6;
	fadeout= 0.5;
	onLoad = "with uiNameSpace do { notification = _this select 0 }";
		
	class controlsBackground
	{
		class MainBackground: RscText {
			idc = -1;
			x = 0.355589 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.288822 * safezoneW;
			h = 0.132 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		
		class BGRedTop: RscText
		{
			idc = -1;
			x = 0.355589 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.288822 * safezoneW;
			h = 0.0055 * safezoneH;
			colorBackground[] = {0.7,0.13,0.13,1};
		};
		
		class BGRedBottom: RscText
		{
			idc = -1;
			x = 0.355589 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.288822 * safezoneW;
			h = 0.0055 * safezoneH;
			colorBackground[] = {0.7,0.13,0.13,1};
		};

		class Picture: RscPictureKeepAspect {
			idc = 27997;
			text = "";
			x = 0.365904 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0515754 * safezoneW;
			h = 0.088 * safezoneH;
		};
	};
	
	class controls 
	{

		class Title : RscText
		{
			idc = 27998;
			text = "";
			font = EtelkaMonospaceProBold;
			x = 0.448425 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.185671 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 0.05;
		};
		
		class Title2 : RscText
		{
			idc = 27999;
			text = "";
			font = EtelkaMonospaceProBold;
			x = 0.448424 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.185671 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = 0.03;
		};
	};
};