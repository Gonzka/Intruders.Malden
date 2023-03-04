/*
    Author:	Gonzka

    The player has escaped
*/

intrudersWin = true; publicvariable "intrudersWin";

["Initialize", [player, [civilian], false, true, true, true, true, false]] call BIS_fnc_EGSpectator;

["STR_SCORE_Survived",5000] call gonzka_fnc_addBloodpoints;

//QUEST
quest_escape = true;