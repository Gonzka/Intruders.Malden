/*
    Author:	Gonzka

    Creates the lockpick interaction for the escape vehicles
*/

params [
	["_escapeVehicle", objNull, [objNull]]
];

private _actionID = [
	_escapeVehicle,
	localize "STR_GAME_Unlock",
	"\a3\data_f_destroyer\data\UI\IGUI\Cfg\holdactions\holdAction_loadVehicle_ca.paa",
	"\a3\data_f_destroyer\data\UI\IGUI\Cfg\holdactions\holdAction_loadVehicle_ca.paa",
	"_this distance _target < 4 && {side _this isEqualTo civilian} && {!isObjectHidden _target} && {_target getVariable ['isUnlockedBy', objNull] in [objNull, _this]}",
	"_this distance _target < 4",
	{
		_target setVariable ["isUnlockedBy", _caller, true];
	},
	{
		params ["_target", "_caller", "_actionId", "_arguments", "_progress", "_maxProgress"];
		
		private _elapsedTime = _progress / 24 * _duration;
		_target setVariable ["duration", _duration - _elapsedTime, true];
		
		unlockTime = _elapsedTime; //For the score calculation of the bloodpoints
	},
	{
		[_target, false] remoteExec ["lock"];
		[_target, "vehicleUnlocked"] remoteExecCall ["say3D"];
		
		private _escapeVehicle = localize "STR_GAME_EscapeVehicle";
		if (_target isEqualTo escapeVehicle_1) then {
			_escapeVehicle = _escapeVehicle + " #1";
		} else {
			_escapeVehicle = _escapeVehicle + " #2";
		};
		[_escapeVehicle, "STR_GAME_UnlockedVehicle", 10, "\intruders_mod\textures\gui\hud_escape.paa"] remoteExec ["gonzka_fnc_notification", [0, -2] select isDedicated];
		
		["STR_SCORE_Lockpick", round(unlockTime * 62.5)] call gonzka_fnc_addBloodpoints; unlockTime = 0; //Score
	},
	{
		[_target, _target getVariable "duration"] remoteExecCall ["gonzka_fnc_setHoldActionDuration", [0, -2] select isDedicated];
		_target setVariable ["isUnlockedBy", objNull, true];

		["play", _target] remoteExecCall ["BIS_fnc_carAlarm"];
		["STR_SCORE_Lockpick", round(unlockTime * 62.5)] call gonzka_fnc_addBloodpoints; unlockTime = 0; //Score
	},
	[],
	20,
	nil,
	true,
	false
] call BIS_fnc_holdActionAdd;

_escapeVehicle setVariable ["actionID", _actionID, true];