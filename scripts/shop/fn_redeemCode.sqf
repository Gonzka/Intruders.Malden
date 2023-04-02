/*
    Author:	Gonzka

    Checks if the entered code is valid
*/

private _code = ctrlText 1003;
private _availableCodes = ["ARMAOPTERIX","SPECIALHAVEN","THX4CASH"]; //PERMANENT CODES
private _uid = getPlayerUID player;
if (_uid in ["76561198082809482"]) then { //Gonzka
	_availableCodes = _availableCodes + ["RESET","NEWQUEST","UPDATESHOP"]; //PERSONAL RESET CODE FOR ADMINS
};

if !(_code in _availableCodes) exitWith {
	["STR_GAME_Error", "STR_GAME_CodeInvalid", 5, "\A3\ui_f\data\GUI\RscCommon\RscDebugConsole\warningcdc_ca.paa", true] spawn gonzka_fnc_notification;
};

if !(isNil {profileNamespace getVariable _code}) exitWith {
	["STR_GAME_Error", "STR_GAME_AlreadyRedeemed", 5, "\A3\ui_f\data\GUI\RscCommon\RscDebugConsole\warningcdc_ca.paa", true] spawn gonzka_fnc_notification;
};

if (_code isEqualTo "RESET") exitWith { //RESET ALL CODES
	{
		profileNamespace setVariable [_x,nil];
	} forEach _availableCodes;
	["STR_GAME_AdminCommand", "STR_GAME_CodesReseted", 5] spawn gonzka_fnc_notification;
};

if (_code isEqualTo "NEWQUEST") exitWith { //NEW DAILY QUEST
	profileNamespace setVariable ["intruders_dailyQuestIntruder",nil];
	profileNamespace setVariable ["intruders_dailyQuestKiller",nil];
	["STR_GAME_AdminCommand", "STR_GAME_QuestReseted", 5] spawn gonzka_fnc_notification;
};

if (_code isEqualTo "UPDATESHOP") exitWith { //UPDATE SHOP ITEMS
	profileNamespace setVariable ["intruders_dailyShopItems",nil];
	["STR_GAME_AdminCommand", "STR_GAME_ShopNewItems", 5] spawn gonzka_fnc_notification;
};

profileNamespace setVariable [_code,true];

switch (_code) do {
	case "ARMAOPTERIX": {
		[_code, "STR_SKIN_CodeArmaOpterix", 15, "a3\ui_f\data\gui\rsc\rscdisplayarsenal\face_ca.paa"] spawn gonzka_fnc_notification;
	};
	case "SPECIALHAVEN": {
		[_code, "STR_SKIN_CodeSpecialHaven", 15, "a3\missions_f_oldman\props\data\money_ca.paa"] spawn gonzka_fnc_notification;
	};
	case "THX4CASH": {
		[_code, "STR_SKIN_CodeThx4Cash", 15, "a3\missions_f_oldman\props\data\money_ca.paa"] spawn gonzka_fnc_notification;
	};
};