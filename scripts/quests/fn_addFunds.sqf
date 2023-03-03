/*
    Author:	Gonzka

    Shows when the player gets points and saves them
*/

params [
	["_actionName", "", [""]],
	["_funds", 0, [0]]
];

if (_funds isEqualTo 0) exitWith {};

private _fortune = player getVariable "bloodPoints";
_fortune = _fortune + _funds;
player setVariable ["bloodPoints",_fortune,true];

["+ " + str _funds + " " + localize "STR_SCORE_BloodPoints", _actionName, 4, "textures\ico_points.paa"] spawn gonzka_fnc_notification;