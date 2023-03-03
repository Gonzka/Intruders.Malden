/*
    Author:	Gonzka

    Slowly regresses the progress of a generator over time.
*/

params [
	["_generator", objNull, [objNull]],
	["_regressionSpeed", 0.5, [0.5]],
	["_ruin", false, [false]]
];

private _duration = 60;

if (_generator getVariable ["isRegressing", false]) exitWith {}; //Is already regressing
_generator setVariable ["isRegressing", true, true];

while {_generator getVariable "duration" < _duration && isNull (_generator getVariable ["isRepairedBy", objNull])} do {

	if (_ruin && {isObjectHidden totem_hex_ruin}) exitWith {}; //Stop the regression when the ruin totem was cleansed

	_generator setVariable ["duration", (_generator getVariable "duration") + _regressionSpeed, true];
	[_generator, _generator getVariable "duration"] remoteExecCall ["gonzka_fnc_setHoldActionDuration", [0, -2] select isDedicated];
	
	if (_generator getVariable "duration" > _duration) exitWith {
		_generator setVariable ["duration", _duration, true];
		[_generator, _duration] remoteExecCall ["gonzka_fnc_setHoldActionDuration", [0, -2] select isDedicated];
	};
	
	[_generator] spawn gonzka_fnc_sparkParticles;
	
	sleep 2;
};

if (_generator getVariable "duration" == _duration) then { //If the generator has no repair progress at all, the generator will light up red again
	_generator setObjectTextureGlobal [1, "#(argb,8,8,3)color(1,0,0,1,ca)"];
};

_generator setVariable ["isRegressing", false, true];