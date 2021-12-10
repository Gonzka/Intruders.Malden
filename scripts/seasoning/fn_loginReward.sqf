/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         11.06.2021
	Description:	 Gives the player a login reward after one day

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

private _lastReward = profileNamespace getVariable "intruders_lastReward";
if (isNil "_lastReward") then {
	profileNamespace setVariable ["intruders_lastReward",systemTime select [0,5]];
	saveProfileNamespace;
	_lastReward = profileNamespace getVariable "intruders_lastReward";
};

_lastRewardFloat = dateToNumber _lastReward;
_systemTimeFloat = dateToNumber (systemTime select [0,5]);

if (_systemTimeFloat > (_lastRewardFloat +  0.00273973)) then { //1 DAY DIFF
	profileNamespace setVariable ["intruders_lastReward",systemTime select [0,5]];
	
	private _bloodPoints = profileNamespace getVariable "intruders_bloodPoints";
	_bloodPoints = _bloodPoints + 5000;
	profileNamespace setVariable ["intruders_bloodPoints", _bloodPoints];
	
	["STR_GAME_WelcomeBack", "STR_GAME_LoginReward", 10, "textures\ico_points.paa"] spawn gonzka_fnc_notification; 
	
	//NEW DAILY QUEST
	profileNamespace setVariable ["intruders_dailyQuestIntruder",nil];
	profileNamespace setVariable ["intruders_dailyQuestKiller",nil];
	
	saveProfileNamespace;
};