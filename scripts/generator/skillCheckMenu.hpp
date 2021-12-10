class SkillCheckMenu {
    idd = -1;
	duration = 2;
	fadeIn = 0;
	fadeOut = 0;
	onLoad = "with uiNameSpace do { SkillCheckMenu = _this select 0 };";
	onUnload = "uiNamespace setVariable ['SkillCheckMenu', displayNull];";

    class controls {		
		class BackgroundBarColor: RscText {
            idc = 0020;
			colorBackground[] = {0.7,0.13,0.13,1};
            text = "";
            x = 0.3 * safezoneW + safezoneX;
            y = 0.48 * safezoneH + safezoneY;
            w = 0.4 * safezoneW;
            h = 0.04 * safezoneH;
        };
		
		class BackgroundBarLine: RscText {
            idc = 0050;
			colorBackground[] = {0.624,0.961,0.51,1};
            text = "";
            x = 0.45 * safezoneW + safezoneX;
            y = 0.48 * safezoneH + safezoneY;
            w = 0.05 * safezoneW;
            h = 0.04 * safezoneH;
        };
		
		class BarLine: RscText {
            idc = 0100;
			colorBackground[] = { 1, 1, 1, 1};
            text = "";
            x = 0.3 * safezoneW + safezoneX;
            y = 0.48 * safezoneH + safezoneY;
            w = 0.002 * safezoneW;
            h = 0.04 * safezoneH;
        };
		
		class ComboText: RscStructuredText {
            idc = 0150;
            text = "";
            x = 0.3 * safezoneW + safezoneX;
            y = 0.44 * safezoneH + safezoneY;
            w = 1.0 * safezoneW;
            h = 0.04 * safezoneH;
        };
	};
};