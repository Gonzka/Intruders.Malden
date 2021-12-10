////////////////////////////////////////////////
// GUI Made by BioniC for LivoniaLife.de #Vuduwi
////////////////////////////////////////////////

class questTerminal 
{
	idd = 60580;
	name= "questTerminal";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
	
		class RscMainBackground : RscText
		{
			idc = -1;
			x = 0.386534 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.226932 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		
		class RedBGTop: RscText
		{
			idc = -1;
			x = 0.386534 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.226932 * safezoneW;
			h = 0.0055 * safezoneH;
			colorBackground[] = {0.7,0.13,0.13,1};
		};
		
		class RedBGBottom: RscText
		{
			idc = -1;
			x = 0.386534 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.226932 * safezoneW;
			h = 0.0055 * safezoneH;
			colorBackground[] = {0.7,0.13,0.13,1};
		};
	};

	class controls 
	{
		class QuestTitle : RscText
		{
			idc = 60581;
			sizeEx = 0.05;
			text = "";
			font = PuristaBold;
			x = 0.386534 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.226932 * safezoneW;
			h = 0.066 * safezoneH;
			style = ST_CENTER;
			colorBackground[] = {0.7,0.13,0.13,1};
		};

		class QuestDescription : RscStructuredText
		{
			idc = 60582;
			sizeEx = 0.020;
			text = "";
			x = 0.391692 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.216617 * safezoneW;
			h = 0.27 * safezoneH;
		};

		class RewardTitle : RscText
		{
			idc = -1;
			text = "$STR_GAME_Rewards";
			font = PuristaBold;
			x = 0.386534 * safezoneW + safezoneX;
			y = 0.594 * safezoneH + safezoneY;
			w = 0.226932 * safezoneW;
			h = 0.033 * safezoneH;
			style = ST_CENTER;
			colorBackground[] = {0.7,0.13,0.13,1};
		};
		
		class RewardItem : RscStructuredText
		{
			idc = 60583;
			sizeEx = 0.03;
			x = 0.391692 * safezoneW + safezoneX;
			y = 0.638 * safezoneH + safezoneY;
			w = 0.216617 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class RewardFrame : RscFrame
		{
			idc = -1;
			x = 0.5618 * safezoneW + safezoneX;
			y = 0.638 * safezoneH + safezoneY;
			w = 0.047 * safezoneW;
			h = 0.084 * safezoneH;
			colorText[] = {0.7,0.13,0.13,1};
		};
		
		class RewardIcon : RscPictureKeepAspect
		{
			idc = 60584;
			text = "";
			x = 0.5618 * safezoneW + safezoneX;
			y = 0.638 * safezoneH + safezoneY;
			w = 0.047 * safezoneW;
			h = 0.084 * safezoneH;
			tooltip = "";
		};

		class CloseButton : RscButtonMenu 
		{
			idc = -1;
			onButtonClick = "playSound ""Click1""; closedialog 0;";
			text = "$STR_GAME_Close";
			font = PuristaLight;
			x = 0.391692 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0876782 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			onMouseEnter = "playSound ""Click2"";";
			
			class Attributes {
				align="center";
			};
		};
	};
};