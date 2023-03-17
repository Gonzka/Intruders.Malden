/*
    Author:	Gonzka

    Menu through which quests can be accepted
*/

private _side = "";
if (playerSide isEqualTo east) then {
	_side = "Killer";
} else {
	_side = "Intruder";
};

//GET RANDOM DAILY QUEST
private _dailyQuest = profileNamespace getVariable format ["intruders_dailyQuest%1",_side];
if (isNil "_dailyQuest") then {
	private _quests = count (missionConfigFile >> "Quests" >> _side);
	private _randomQuest = floor random _quests;
	profileNamespace setVariable [format ["intruders_dailyQuest%1",_side],_randomQuest];
	saveProfileNamespace;
	_dailyQuest = profileNamespace getVariable format ["intruders_dailyQuest%1",_side];
	
	["STR_GAME_DailyQuest", "STR_GAME_DailyQuestActive", 10, "\intruders_mod\textures\gui\badge.paa"] spawn gonzka_fnc_notification; 
};

disableSerialization;
createdialog "questTerminal";

//NO MORE DAILY QUESTS
if (_dailyQuest isEqualTo -1) exitWith {
	((findDisplay 60580) displayCtrl 60581) ctrlSetText toUpper localize "STR_GAME_NoQuests"; 
	((findDisplay 60580) displayCtrl 60582) ctrlSetStructuredText parseText format["%1",localize "STR_GAME_NoQuestsForChar"];
	((findDisplay 60580) displayCtrl 60583) ctrlSetText localize "STR_GAME_NoRewards";
};

//LOAD QUEST DATA
private _questArr = getArray (missionConfigFile >> "Quests" >> _side >> format ["Quest%1",_dailyQuest]);
private _questTitle = _questArr select 0;
private _questTask = _questArr select 1;
private _rewardBloodpoints = _questArr select 2;

private _qTitle = ((findDisplay 60580) displayCtrl 60581); 
private _qDescription = ((findDisplay 60580) displayCtrl 60582); 
private _qReward = ((findDisplay 60580) displayCtrl 60583); 
private _qRewardIcon = ((findDisplay 60580) displayCtrl 60584);

_qTitle ctrlSetText toUpper localize _questTitle; 
_qDescription ctrlSetStructuredText parseText format ["<t size='1.2'>%1</t>", localize _questTask];
_qReward ctrlSetStructuredText parseText format ["+ " + "<img image='\intruders_mod\textures\gui\bloodpoints.paa'/> " + "%1 " + localize "STR_SCORE_BloodPoints", [_rewardBloodpoints] call gonzka_fnc_numberText];

_qRewardIcon ctrlSetText "\intruders_mod\textures\gui\bloodpoints.paa";
_qRewardIcon ctrlSetTooltip localize "STR_SCORE_BloodPoints";