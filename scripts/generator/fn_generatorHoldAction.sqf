/*
    Author:	Gonzka

    Creates an interaction with a generator
*/

params [
    ["_generator", objNull, [objNull]]
];

private _actionID = [ 
	_generator, 
	localize "STR_GAME_Repair",  
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",  
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",  
	"_this distance _target < 2 && side _this isEqualTo civilian && (isNull (_target getVariable ['worker', objNull]) || _target getVariable ['worker', objNull] isEqualTo _this)",
	"_this distance _target < 2 && side _this isEqualTo civilian",
	{
		_target setVariable ['worker', _caller, true];
		_caller playMoveNow "Acts_carFixingWheel";
	},  
    {
		params ["_target", "_caller", "_actionId", "_arguments", "_progress", "_maxProgress"];
		private _elapsedTime = _progress / 24 * _duration;
		
		if (_progress < 2) exitWith { _target setVariable ["duration", _duration, true]; }; //Anti-Holdaction Space Spam
		
		_target setVariable ["duration", _duration - _elapsedTime, true];
		
		private _tickTime = 1 / 24 * _duration;
		if (random 100 < _tickTime * 8) then {
			[] spawn gonzka_fnc_skillCheckMenuCtrl;
		};
		
		if (animationState _caller != "Acts_carFixingWheel") then {
			_caller playMoveNow "Acts_carFixingWheel";
		};
	},
	{
		[] spawn gonzka_fnc_genActivate;
		[_caller, ""] remoteExec ["switchMove"]
	},
	{
		[_target, _target getVariable "duration"] remoteExecCall ["gonzka_fnc_setHoldActionDuration", [0, -2] select isDedicated];
		_target setVariable ['worker', objNull, true];
		[_caller, ""] remoteExec ["switchMove"];
		
		//Ruin Killer Perk (Hex)
		if !(isNil "totem_hex_ruin" || {isObjectHidden totem_hex_ruin}) then {
			["hex_ruin", totem_hex_ruin] call gonzka_fnc_revealHex;
			[_target, _duration] spawn {
				_target = _this select 0;
				_duration = _this select 1;
				while {(_target getVariable "duration" < 80 && isNull (_target getVariable ['worker', objNull])) && !(isNil "totem_hex_ruin" || {isObjectHidden totem_hex_ruin})} do {
					_target setVariable ["duration", (_target getVariable "duration") + 1, true];
					[_target, _target getVariable "duration"] remoteExecCall ["gonzka_fnc_setHoldActionDuration", [0, -2] select isDedicated];
					
					if (_target getVariable "duration" > 80) then {
						_target setVariable ["duration", 80, true];
						[_target, 80] remoteExecCall ["gonzka_fnc_setHoldActionDuration", [0, -2] select isDedicated];
					};
					
					[_target] spawn gonzka_fnc_sparkParticles;
					
					sleep 2;
				};
			};
		};
	},
	[],  
	60,
	nil,  
	true,  
	false 
] call BIS_fnc_holdActionAdd;	

_generator setVariable ["actionID", _actionID, true];