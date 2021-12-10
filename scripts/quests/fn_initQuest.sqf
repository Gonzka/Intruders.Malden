/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         04.07.2021
	Description:	 Starts a quest and creates a task

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

private _side = "";
if (playerSide isEqualTo east) then {
    _side = "Killer";
} else {
    _side = "Intruder";
};

private _dailyQuest = profileNamespace getVariable format ["intruders_dailyQuest%1",_side];
if (isNil "_dailyQuest") exitWith {};
if (_dailyQuest isEqualTo -1) exitWith {};

//LOAD QUEST DATA
private _questArr = getArray (missionConfigFile >> "Quests" >> _side >> format ["Quest%1",_dailyQuest]);
private _questTitle = _questArr select 0;
private _questTask = _questArr select 1;
private _rewardBloodpoints = _questArr select 2;

// SETTING UP TASK
private _questVar = format ["task_%1",_dailyQuest];
	
// CREATE TASK
newTask = player createSimpleTask [_questVar];
newTask setSimpleTaskDescription ["", localize _questTask, ""];
newTask setSimpleTaskType "whiteboard";
newTask setSimpleTaskAlwaysVisible true;
newTask setTaskState "Assigned";

sleep 5;

[_dailyQuest, _questTitle, _rewardBloodpoints] spawn gonzka_fnc_waitUntilQuestCompleted;