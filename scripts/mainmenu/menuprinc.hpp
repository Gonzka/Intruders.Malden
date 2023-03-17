/* 
	჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻
	჻჻  
	჻჻  ELYVION | HOLDING - (Previously Kreygers | Group)
	჻჻
	჻჻  Description : File dialog from the Main Menu
	჻჻
	჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻ 
*/

class menuprincipal {
    idd = 951753;
    movingEnable = 0;
    enableSimulation = 1;
	//჻჻ The uiNamespace setVariable is an alternative to retrieve the identity of the menu so that it can be used in the control file with a uiNamespace getVariable
	//჻჻ escKeyEH prevents the player from closing the menu with Esc
	onLoad = "uiNamespace setVariable ['menuprincipal', _this select 0]; escKeyEH = (_this select 0) displayAddEventHandler [""KeyDown"", ""if (((_this select 1) == 1)) then {true};""];";
	onUnload = "uiNamespace setVariable ['menuprincipal', objNull]";
	onDestroy = "uiNamespace setVariable ['menuprincipal', objNull]";

    /*class controlsBackground {
        class MenuY: RscPicture {
            idc = 0004;
            text = "";
            x = 0 * safezoneW + safezoneX;
            y = 0 * safezoneH + safezoneY;
            w = 1 * safezoneW;
            h = 1 * safezoneH;
        };
    };*/

    class controls {
		class unselect: RscButtonMenu {
			idc = -1;
			onButtonClick = "";
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
            animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
            animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
            animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
            animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
            animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
            colorBackground[] = {0, 0, 0, 0};
            colorBackground2[] = {1, 1, 1, 0};
            color[] = {1, 1, 1, 0};
            color2[] = {1, 1, 1, 0};
            colorText[] = {1, 1, 1, 0};
            colorDisabled[] = {1, 1, 1, 0};
			text = ""; //--- ToDo: Localize;
			x = 0 * safezoneW + safezoneX;
            y = 0 * safezoneH + safezoneY;
            w = 0 * safezoneW;
            h = 0 * safezoneH;
		};
		
		/*class CloseBtn: RscButtonMenu { //TEMP!!!
            colorBackground[] = {0, 0, 0, 0.9};
            idc = -1;
            x = 0.96 * safezoneW + safezoneX;
            y = 0 * safezoneH + safezoneY;
            w = 0.118594 * safezoneW;
            h = 0.02 * safezoneH;
			onButtonClick = "";
        };*/
		
		class PlayBtn: RscButtonMenuPlayBtn {
			idc = 0083;
            text = "$STR_MM_Play";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            x = 0.06 * safezoneW + safezoneX;
            y = 0.55 * safezoneH + safezoneY;
            w = 0.10 * safezoneW;
            h = 0.042 * safezoneH;
			font = PuristaLight;
			onMouseEnter = "playSound ""Click2"";";
        };
		
		class PlayBtnTxt: RscStructuredTextBtnTxt {
			idc = 0073;
            text = "$STR_MM_PlayColor";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            x = 0.057 * safezoneW + safezoneX;
            y = 0.55 * safezoneH + safezoneY;
            w = 0.41875 * safezoneW;
            h = 0.042 * safezoneH;
			font = PuristaLight;
        };
		
        class PlayBtn2: RscButtonMenuPlayBtn2 {
			idc = 0084;
            text = "$STR_MM_Perks";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            x = 0.06 * safezoneW + safezoneX;
            y = 0.6 * safezoneH + safezoneY;
            w = 0.10 * safezoneW;
            h = 0.042 * safezoneH;
			font = PuristaLight;
			onMouseEnter = "playSound ""Click2"";";
        };
		
		class PlayBtnTxt2: RscStructuredTextBtnTxt2 {
			idc = 0074;
            text = "$STR_MM_PerksColor";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            x = 0.057 * safezoneW + safezoneX;
            y = 0.6 * safezoneH + safezoneY;
            w = 0.41875 * safezoneW;
            h = 0.042 * safezoneH;
			font = PuristaLight;
        };
		
		class PlayBtn3: RscButtonMenuPlayBtn2 {
			idc = 0085;
            text = "$STR_MM_Skins";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            x = 0.06 * safezoneW + safezoneX;
            y = 0.65 * safezoneH + safezoneY;
            w = 0.14 * safezoneW;
            h = 0.042 * safezoneH;
			font = PuristaLight;
			onMouseEnter = "playSound ""Click2"";";
        };
		
		class PlayBtnTxt3: RscStructuredTextBtnTxt2 {
			idc = 0075;
            text = "$STR_MM_SkinsColor";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            x = 0.057 * safezoneW + safezoneX;
            y = 0.65 * safezoneH + safezoneY;
            w = 0.45 * safezoneW;
            h = 0.042 * safezoneH;
			font = PuristaLight;
        };
		
		class PlayBtn4: RscButtonMenuPlayBtn2 {
			idc = 0086;
            text = "$STR_MM_Quests";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            x = 0.06 * safezoneW + safezoneX;
            y = 0.7 * safezoneH + safezoneY;
            w = 0.14 * safezoneW;
            h = 0.042 * safezoneH;
			font = PuristaLight;
			onMouseEnter = "playSound ""Click2"";";
        };
		
		class PlayBtnTxt4: RscStructuredTextBtnTxt2 {
			idc = 0076;
            text = "$STR_MM_QuestsColor";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            x = 0.057 * safezoneW + safezoneX;
            y = 0.7 * safezoneH + safezoneY;
            w = 0.7 * safezoneW;
            h = 0.042 * safezoneH;
			font = PuristaLight;
        };
		
		class PlayBtn5: RscButtonMenuPlayBtn2 {
			idc = 0087;
            text = "$STR_MM_Shop";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            x = 0.06 * safezoneW + safezoneX;
            y = 0.75 * safezoneH + safezoneY;
            w = 0.11 * safezoneW;
            h = 0.042 * safezoneH;
			font = PuristaLight;
			onMouseEnter = "playSound ""Click2"";";
        };
		
		class PlayBtnTxt5: RscStructuredTextBtnTxt2 {
			idc = 0077;
            text = "$STR_MM_ShopColor";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            x = 0.057 * safezoneW + safezoneX;
            y = 0.75 * safezoneH + safezoneY;
            w = 0.48 * safezoneW;
            h = 0.042 * safezoneH;
			font = PuristaLight;
        };
		
		class PlayBtn6: RscButtonMenuPlayBtn2 {
			idc = 0088;
            text = "$STR_MM_Quit";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            onButtonClick = "closeDialog 0; [""LeaveMenuPrinc"",false,0] call BIS_fnc_endMission;";
            x = 0.06 * safezoneW + safezoneX;
            y = 0.8 * safezoneH + safezoneY;
            w = 0.10 * safezoneW;
            h = 0.042 * safezoneH;
			font = PuristaLight;
			onMouseEnter = "playSound ""Click2"";";
        };
		
		class PlayBtnTxt6: RscStructuredTextBtnTxt2 {
			idc = 0078;
            text = "$STR_MM_QuitColor";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            x = 0.057 * safezoneW + safezoneX;
            y = 0.8 * safezoneH + safezoneY;
            w = 0.48 * safezoneW;
            h = 0.042 * safezoneH;
			font = PuristaLight;
        };
		
		class PlayBtn7: RscButtonMenuPlayBtn3 {
			idc = 0089;
            text = "$STR_MM_More";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            onButtonClick = "";
            x = 0.061 * safezoneW + safezoneX;
            y = 0.86 * safezoneH + safezoneY;
            w = 0.07 * safezoneW;
            h = 0.022 * safezoneH;
			font = PuristaLight;
			onMouseEnter = "playSound ""Click2"";";
        };
		
		class PlayBtnTxt7: RscStructuredTextBtnTxt3 {
			idc = 0079;
            text = "$STR_MM_MoreColor";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            x = 0.058 * safezoneW + safezoneX;
            y = 0.86 * safezoneH + safezoneY;
            w = 0.45 * safezoneW;
            h = 0.022 * safezoneH;
			font = PuristaLight;
        };
		
		//-------------

        /*class PlayBtn8: RscButtonMenuPlayBtn2 {
			idc = 0185;
            text = "";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            onButtonClick = "";
            x = 0.06 * safezoneW + safezoneX;
            y = 0.65 * safezoneH + safezoneY;
            w = 0.18 * safezoneW;
            h = 0.042 * safezoneH;
			font = PuristaLight;
			onMouseEnter = "playSound ""Click2"";";
        };
		
		class PlayBtnTxt8: RscStructuredTextBtnTxt2 {
			idc = 0175;
            text = "";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            x = 0.057 * safezoneW + safezoneX;
            y = 0.65 * safezoneH + safezoneY;
            w = 0.48 * safezoneW;
            h = 0.042 * safezoneH;
			font = PuristaLight;
        };*/

        class PlayBtn9: RscButtonMenuPlayBtn2 {
			idc = 0186;
            text = "$STR_MM_Code";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            onButtonClick = "";
            x = 0.06 * safezoneW + safezoneX;
            y = 0.7 * safezoneH + safezoneY;
            w = 0.18 * safezoneW;
            h = 0.042 * safezoneH;
			font = PuristaLight;
			onMouseEnter = "playSound ""Click2"";";
        };
		
		class PlayBtnTxt9: RscStructuredTextBtnTxt2 {
			idc = 0176;
            text = "$STR_MM_CodeColor";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            x = 0.057 * safezoneW + safezoneX;
            y = 0.7 * safezoneH + safezoneY;
            w = 0.48 * safezoneW;
            h = 0.042 * safezoneH;
			font = PuristaLight;
        };

        class PlayBtn10: RscButtonMenuPlayBtn2 {
			idc = 0187;
            text = "$STR_MM_Credits";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            onButtonClick = "";
            x = 0.06 * safezoneW + safezoneX;
            y = 0.75 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.042 * safezoneH;
			font = PuristaLight;
			onMouseEnter = "playSound ""Click2"";";
        };
		
		class PlayBtnTxt10: RscStructuredTextBtnTxt2 {
			idc = 0177;
            text = "$STR_MM_CreditsColor";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            x = 0.057 * safezoneW + safezoneX;
            y = 0.75 * safezoneH + safezoneY;
            w = 0.48 * safezoneW;
            h = 0.042 * safezoneH;
			font = PuristaLight;
        };
		
		class PlayBtn11: RscButtonMenuPlayBtn3 {
			idc = 0188;
            text = "$STR_MM_Return";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            onButtonClick = "";
            x = 0.061 * safezoneW + safezoneX;
            y = 0.81 * safezoneH + safezoneY;
            w = 0.045 * safezoneW;
            h = 0.022 * safezoneH;
			font = PuristaLight;
			onMouseEnter = "playSound ""Click2"";";
        };
        
        class PlayBtnTxt11: RscStructuredTextBtnTxt3 {
			idc = 0178;
            text = "$STR_MM_ReturnColor";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            x = 0.058 * safezoneW + safezoneX;
            y = 0.81 * safezoneH + safezoneY;
            w = 0.45 * safezoneW;
            h = 0.022 * safezoneH;
			font = PuristaLight;
        };
		
		//------------
		
		class Logo: RscPicture {
            idc = 0001;
            text = "\intruders_mod\textures\gui\title.paa";
            x = -0.007 * safezoneW + safezoneX;
            y = 0.2 * safezoneH + safezoneY;
            w = 0.28 * safezoneW;
            h = 0.5 * safezoneH;
        };
		
		class VersionBottomRight: RscStructuredText {
			text = "$STR_MM_Version";
            idc = 0003;
			x = 0.935 * safezoneW + safezoneX;
            y = 0.9725 * safezoneH + safezoneY;
            w = 0.065 * safezoneW;
            h = 0.0275 * safezoneH;
        };
		
		class CreditFond: RscText {
            colorBackground[] = {0, 0, 0, 0.5};
            idc = 0005;
            x = 0 * safezoneW + safezoneX;
            y = 0 * safezoneH + safezoneY;
            w = 1 * safezoneW;
            h = 1 * safezoneH;
        };
		
		class PlayBtnC10: RscButtonMenuPlayBtn3 {
			idc = 1188;
            text = "$STR_MM_Return";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            onButtonClick = "";
            x = 0.061 * safezoneW + safezoneX;
            y = 0.81 * safezoneH + safezoneY;
            w = 0.045 * safezoneW;
            h = 0.022 * safezoneH;
			font = PuristaLight;
			onMouseEnter = "playSound ""Click2"";";
        };
		
		class PlayBtnTxtC10: RscStructuredTextBtnTxt3 {
			idc = 1178;
            text = "$STR_MM_ReturnColor";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            x = 0.058 * safezoneW + safezoneX;
            y = 0.81 * safezoneH + safezoneY;
            w = 0.45 * safezoneW;
            h = 0.022 * safezoneH;
			font = PuristaLight;
        };
		
		class PlayBtnTxtCTitle: RscStructuredTextBtnTxt {
			idc = 1074;
            text = "$STR_MM_CreditsScrollTitle";
            colorBackground[] = {0.8, 0.0, 0.0, 0};
            onButtonClick = "";
            x = 0 * safezoneW + safezoneX;
            y = 0.075 * safezoneH + safezoneY;
            w = 1 * safezoneW;
            h = 0.042 * safezoneH;
			font = PuristaLight;
        };
		
		class PlayBtnBoxC : RscControlsGroup {
            idc = 1030;
            x = 0.2 * safezoneW + safezoneX;
            y = 0.2 * safezoneH + safezoneY;
            w = 1 * safezoneW;
            h = 0.5 * safezoneH;
			font = PuristaLight;

            class Controls {
                class PlayBtnBoxCTxt: RscStructuredText {
                    idc = 1029;
                    sizeEx = 0.2;
                    text = "<t align='center'><br/><t font='PuristaBold' size='1.3'>INTRUDERS<t font='PuristaSemiBold' size='1'><br/><br/>- DEVELOPER -<t font='PuristaLight' size='0.8'><br/>Gonzka [Scripting]<br/>Affiger_Affe [Mapping]<br/>Alessio [Modding]<br/>MrCat [Modding]<br/><br/><t font='PuristaSemiBold' size='1'>- DESIGNER -<t font='PuristaLight' size='0.8'><br/>ReyzProductions<br/>Affiger_Affe<br/>Kreisverkehr<br/><br/><t font='PuristaSemiBold' size='1'>- VOICEOVER -<t font='PuristaLight' size='0.8'><br/>ArmaOpterix [Martin Opterix]<br/>EasyArt [Hans Rammel]<br/>Gonzka [Helmut, Stanislaw, Sandro]<br/>Kologal [Sonny Kolo]<br/>Sunchay [Bruce Willis]<br/><br/><t font='PuristaSemiBold' size='1'>- THIRD PARTY -<t font='PuristaLight' size='0.8'><br/>game-icons.net [licensed under CC BY 3.0]<br/><br/>CC Attribution<br/><t size='0.5'><a underline='false' href='https://creativecommons.org/licenses/by/3.0/'>https://creativecommons.org/licenses/by/3.0/</a>";
                    x = 0;
                    y = 0;
                    w = 1.46;
                    h = 2.3;
					font = PuristaLight;
                };
            };
        };
    };
};