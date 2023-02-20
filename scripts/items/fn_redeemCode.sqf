/*
    Author:	Gonzka

    Checks if the entered code is valid
*/

private _code = ctrlText 1003;
private _availableCodes = ["ARMAOPTERIX","SPECIALHAVEN"]; //PERMANENT CODES
switch (season) do { //TIME LIMITED CODES
	case "Halloween": {
		_availableCodes = _availableCodes + ["TRICKORTREAT"];
	};
	case "Winter": {
		_availableCodes = _availableCodes + ["HOLIDAYSWEATER"];
	};
};

private _uid = getPlayerUID player;
if (_uid in ["76561198082809482"]) then { //Gonzka
	_availableCodes = _availableCodes + ["RESET", "NEWQUEST"]; //PERSONAL RESET CODE FOR ADMINS
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

profileNamespace setVariable [_code,true];

switch (_code) do {
	case "ARMAOPTERIX": {
		["STR_GAME_SkinUnlocked", "STR_SKIN_CodeArmaOpterix", 15, "a3\ui_f\data\gui\rsc\rscdisplayarsenal\face_ca.paa"] spawn gonzka_fnc_notification;
	};
	case "TRICKORTREAT": {
		["STR_GAME_SkinUnlocked", "STR_SKIN_CodeSpookyScarySkeleton", 15, "textures\ico_pumpkin.paa"] spawn gonzka_fnc_notification;
	};
	case "HOLIDAYSWEATER": {
		["STR_GAME_SkinUnlocked", "STR_SKIN_CodeHolidaySweater", 15, "textures\ico_snowman.paa"] spawn gonzka_fnc_notification;
	};
	case "SPECIALHAVEN": {
		["STR_GAME_RewardAvailable", "STR_SKIN_CodeNewHaven", 15, "a3\missions_f_oldman\props\data\money_ca.paa"] spawn gonzka_fnc_notification;
	};
};