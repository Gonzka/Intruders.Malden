class ClothingMenu {
    idd = 3100;
    name = "ClothingMenu";
    movingenable = 0;
    enablesimulation = 1;
    class controlsBackground
    {
        class RscTitleBackground : RscText
        {
            idc = -1;
            x = -0.0015625 * safezoneW + safezoneX;
            y = 0.153846153846154 * safezoneH + safezoneY;
            w = 0.2296875 * safezoneW;
            h = 0.0248101265822785 * safezoneH;
		    colorBackground[] = {0.7,0.13,0.13,1};
        };
        class MainBackground : RscText
        {
            idc = -1;
            x = -0.000520833333333333 * safezoneW + safezoneX;
            y = 0.180708860759494 * safezoneH + safezoneY;
            w = 0.229166666666667 * safezoneW;
            h = 0.503809152872444 * safezoneH;
		    colorbackground[] = {0,0,0,0.7};
        };
        class Title : RscTitle
        {
            idc = -1;
            text = "$STR_MM_Skins";
			font = PuristaBold;
            x = -0.00104166666666667 * safezoneW + safezoneX;
            y = 0.154819863680623 * safezoneH + safezoneY;
            w = 0.2296875 * safezoneW;
            h = 0.0233690360272639 * safezoneH;
		    colorbackground[] = {0,0,0,0};
        };
    };
    class controls
    {
        class ItemList : RscTree
        {
            idc = 3101;
            sizeex = 0.035;
            ontreeselchanged = "[_this] call gonzka_fnc_clothingFilter; [_this] call gonzka_fnc_changeClothes;";
            x = 0.00531250000000002 * safezoneW + safezoneX;
            y = 0.19255111976631 * safezoneH + safezoneY;
            w = 0.211354166666667 * safezoneW;
            h = 0.475 * safezoneH;
        };
        class EquipButton : RscButtonMenu
        {
			idc = -1;
            text = "$STR_GAME_Equip";
			font = PuristaLight;
            x = -0.00104166666666667 * safezoneW + safezoneX;
            y = 0.685998052580331 * safezoneH + safezoneY;
            w = 0.113020833333333 * safezoneW;
            h = 0.0267575462512172 * safezoneH;
		    colorBackground[] = {0.7,0.13,0.13,1};
			onButtonClick = "playSound ""Click1""; [] call gonzka_fnc_equipClothes;";
			onMouseEnter = "playSound ""Click2"";";
            class Attributes
            {
                align = "center";
            };
        };
        class ButtonClose : RscButtonMenu
        {
			idc = -1;
            text = "$STR_GAME_Close";
			font = PuristaLight;
            x = 0.115625 * safezoneW + safezoneX;
            y = 0.685998052580331 * safezoneH + safezoneY;
            w = 0.113020833333333 * safezoneW;
            h = 0.0267575462512172 * safezoneH;
		    colorBackground[] = {-1,-1,-1,1};
			onButtonClick = "playSound ""Click1""; closeDialog 0; [] call gonzka_fnc_playerSkins;";
			onMouseEnter = "playSound ""Click2"";";
            class Attributes
            {
                align = "center";
            };
        };
        class ViewAngle : RscXSliderH
        {
			idc = 3102;
            text = "";
			tooltip = "";
			color[] = {1, 1, 1, 0.45};
            coloractive[] = {1, 1, 1, 0.65};
            onsliderposchanged = "[_this select 1] call gonzka_fnc_s_onSliderChange;";
            x = 0.25 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
            w = 0.5 * safezoneW;
            h = 0.02 * safezoneH;
        };
    };
};