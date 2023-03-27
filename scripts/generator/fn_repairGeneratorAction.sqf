/*
    Author:	Gonzka

    Creates the repair interaction for all generators
*/

params [
	["_generator", objNull, [objNull]]
];

private _actionID = [
	_generator,
	localize "STR_GAME_Repair",
	"\a3\ui_f_oldman\data\igui\cfg\holdactions\repair_ca.paa",
	"\a3\ui_f_oldman\data\igui\cfg\holdactions\repair_ca.paa",
	"_this distance _target < 2 && {side _this isEqualTo civilian} && {!endgameActivated} && {_target getVariable ['isRepairedBy', objNull] in [objNull, _this]}",
	"_this distance _target < 2",
	{
		_target setVariable ["isRepairedBy", _caller, true];
		_caller playMoveNow "Acts_carFixingWheel";
	},
	{
		params ["_target", "_caller", "_actionId", "_arguments", "_progress", "_maxProgress"];
		
		if (endgameActivated) exitWith { [_caller, ""] remoteExec ["switchMove"]; };
		if (_progress < 2) exitWith { _target setVariable ["duration", _duration, true]; repairTime = 0; }; //Anti-Holdaction Space Spam
		if (_progress == 2) then { _target setObjectTextureGlobal [1, "#(argb,8,8,3)color(1,1,0,1,ca)"]; }; //A generator with repair progress lights yellow
		
		private _elapsedTime = _progress / 24 * _duration;
		_target setVariable ["duration", _duration - _elapsedTime, true];
		
		private _tickTime = 1 / 24 * _duration;
		if (random 100 < _tickTime * 8) then {
			[] spawn gonzka_fnc_skillCheckMenuCtrl;
		};
		
		if (animationState _caller != "Acts_carFixingWheel") then {
			_caller playMoveNow "Acts_carFixingWheel";
		};
		
		repairTime = _elapsedTime; //For the score calculation of the bloodpoints
	},
	{
		[] spawn gonzka_fnc_genActivate;
		[_caller, ""] remoteExec ["switchMove"];
		
		["STR_SCORE_Repairs", round(repairTime * 20.83)] call gonzka_fnc_addBloodpoints; repairTime = 0; //Score
	},
	{
		[_target, _target getVariable "duration"] remoteExecCall ["gonzka_fnc_setHoldActionDuration", [0, -2] select isDedicated];
		_target setVariable ["isRepairedBy", objNull, true];
		[_caller, ""] remoteExec ["switchMove"];
		
		["STR_SCORE_Repairs", round(repairTime * 20.83)] call gonzka_fnc_addBloodpoints; repairTime = 0; //Score
		
		if (!isNil "totem_hex_ruin" && {!isObjectHidden totem_hex_ruin}) then { //Ruin Killer Perk (Hex)
			[_target, 1, true] spawn gonzka_fnc_genRegression;
			["hex_ruin", totem_hex_ruin] call gonzka_fnc_revealHex;
		};
	},
	[],
	60,
	nil,
	true,
	false
] call BIS_fnc_holdActionAdd;

_generator setVariable ["actionID", _actionID, true];