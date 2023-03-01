/*
    Author:	Gonzka

    Slowly regresses the progress of a generator over time.
*/

params [
    ["_generator", objNull, [objNull]],
	["_duration", 60, [60]],
	["_regressionSpeed", 0.5, [0.5]]
];

while {_generator getVariable "duration" < _duration && isNull (_generator getVariable ["isRepairedBy", objNull])} do {

	if (!isNil "totem_hex_ruin" && {isObjectHidden totem_hex_ruin}) exitWith {}; //Stop the regression when the ruin totem was cleansed

	_generator setVariable ["duration", (_generator getVariable "duration") + _regressionSpeed, true];
	[_generator, _generator getVariable "duration"] remoteExecCall ["gonzka_fnc_setHoldActionDuration", [0, -2] select isDedicated];
	
	if (_generator getVariable "duration" > _duration) exitWith {
		_generator setVariable ["duration", _duration, true];
		[_generator, _duration] remoteExecCall ["gonzka_fnc_setHoldActionDuration", [0, -2] select isDedicated];
	};
	
	[_generator] spawn gonzka_fnc_sparkParticles;
	
	sleep 2;
};