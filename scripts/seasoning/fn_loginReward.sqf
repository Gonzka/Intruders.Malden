/*
    Author:	Gonzka

    Gives the player a login reward after one day
*/

private _lastReward = profileNamespace getVariable "intruders_lastReward";
private _systemTime = systemTime select [0,3];
if (isNil "_lastReward") then {
	profileNamespace setVariable ["intruders_lastReward", _systemTime];
	saveProfileNamespace;
	_lastReward = profileNamespace getVariable "intruders_lastReward";
};

if (_systemTime isNotEqualTo _lastReward) then {
	profileNamespace setVariable ["intruders_lastReward", _systemTime];
	
	private _bloodPoints = profileNamespace getVariable "intruders_bloodPoints";
	_bloodPoints = _bloodPoints + 5000;
	profileNamespace setVariable ["intruders_bloodPoints", _bloodPoints];
	
	["STR_GAME_WelcomeBack", "STR_GAME_LoginReward", 10, "\intruders_mod\textures\gui\bloodpoints.paa"] spawn gonzka_fnc_notification; 
	
	//NEW DAILY QUEST
	profileNamespace setVariable ["intruders_dailyQuestIntruder",nil];
	profileNamespace setVariable ["intruders_dailyQuestKiller",nil];

	//REFRESH OF SHOP ITEMS
	profileNamespace setVariable ["intruders_dailyShopItems",nil];
	
	saveProfileNamespace;
};