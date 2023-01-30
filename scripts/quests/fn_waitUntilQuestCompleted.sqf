/*
    Author:	Gonzka

    Wait until the quest is successfully completed
*/

params [
	["_dailyQuest", -1, [-1]],
	["_questTitle", "", [""]],
	["_rewardBloodpoints", 1, [1]]
];

private _side = "";
if (playerSide isEqualTo east) then {
	_side = "Killer";
} else {
	_side = "Intruder";
};

private _case = format ["%1%2",_side,_dailyQuest]; //z.B. Intruder0

switch (_case) do {
	case "Killer0": {
		waitUntil {player getVariable "quest_kills" > 1};
	};
	
	case "Killer1": {
		waitUntil {player getVariable "quest_knockDowns" > 4};
	};
	
	case "Killer2": {
		waitUntil {quest_killAll};
	};
	
	case "Killer3": {
		waitUntil {player getVariable "quest_endgameKill"};
	};
	
	case "Killer4": {
		waitUntil {quest_portalTravels > 4};
	};
	
	case "Killer5": {
		waitUntil {quest_uncloakingHit > 3};
	};
	
	case "Killer6": {
		waitUntil {player getVariable "quest_bearTrapCatches" > 1};
	};
	
	case "Killer7": {
		waitUntil {{if (_x isNotEqualTo Killer) then {lifeState _x in ["INJURED", "INCAPACITATED"]}} count playableUnits >= 4};
	};
	
	case "Killer8": {
		waitUntil {player getVariable "bloodPoints" >= 9000};
	};
	
	case "Intruder0": {
		waitUntil {quest_generators > 1};
	};
	
	case "Intruder1": {
		waitUntil {quest_escape};
	};
	
	case "Intruder2": {
		waitUntil {quest_chests > 3};
	};
	
	case "Intruder3": {
		waitUntil {quest_escape && incapacitatedCounter == 0};
	};
	
	case "Intruder4": {
		waitUntil {player getVariable "quest_heals" > 0};
	};
	
	case "Intruder5": {
		waitUntil {quest_skillCheckCombo > 9};
	};
	
	case "Intruder6": {
		waitUntil {quest_terrorGenerators > 1};
	};
	
	case "Intruder7": {
		waitUntil {player getVariable "quest_stuns" > 1};
	};
	
	case "Intruder8": {
		waitUntil {player getVariable "bloodPoints" >= 9000};
	};
};

[_questTitle, _rewardBloodpoints] spawn gonzka_fnc_questSuccess;