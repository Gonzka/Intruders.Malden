/*
    Author:	Gonzka

    Shows a notification when the player gets bloodpoints. The variable is used to permanently save the bloodpoints at the end of the round.
*/

params [
	["_actionName", "", [""]],
	["_bloodpoints", 0, [0]]
];

if (_bloodpoints isEqualTo 0) exitWith {};

private _totalBloodpoints = player getVariable "bloodPoints";
_totalBloodpoints = _totalBloodpoints + _bloodpoints;
player setVariable ["bloodPoints",_totalBloodpoints,true];

["+ " + str _bloodpoints + " " + localize "STR_SCORE_BloodPoints", _actionName, 4, "\intruders_mod\textures\gui\bloodpoints.paa"] spawn gonzka_fnc_notification;