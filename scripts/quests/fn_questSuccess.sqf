/*
    Author:	Gonzka

    Unlocks an item with notification
*/

params [
    ["_questTitle", "", [""]],
    ["_rewardBloodpoints", 1, [1]]
];

private _side = "";
if (playerSide isEqualTo east) then {
    _side = "Killer";
} else {
    _side = "Intruder";
};

//NO MORE DAILY QUESTS
profileNamespace setVariable [format ["intruders_dailyQuest%1",_side],-1];
saveProfileNamespace;

player removeSimpleTask newTask;

//NOTIFICATION
disableSerialization;
7 cutRsc ["notification","PLAIN"];
_ui = uiNameSpace getVariable "notification";
(_ui displayCtrl 27997) ctrlSetText "\intruders_mod\textures\gui\badge.paa";
(_ui displayCtrl 27998) ctrlSetText toUpper localize "STR_GAME_QuestCompleted";
(_ui displayCtrl 27999) ctrlSetText toUpper localize _questTitle;

playSound "Orange_Choice_Select";

//SAVE BLOODPOINTS
private _bloodPoints = profileNamespace getVariable "intruders_bloodPoints";
_bloodPoints = _bloodPoints + _rewardBloodpoints;
profileNamespace setVariable ["intruders_bloodPoints", _bloodPoints];
saveProfileNamespace;

["+ " + str _rewardBloodpoints + " " + localize "STR_SCORE_BloodPoints", localize "STR_GAME_QuestCompleted", 5, "\intruders_mod\textures\gui\bloodpoints.paa"] spawn gonzka_fnc_notification;