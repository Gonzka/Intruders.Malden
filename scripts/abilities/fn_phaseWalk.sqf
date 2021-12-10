/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         31.10.2021
	Description:	 Ability of the old man (SCP 106)

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

if (player getVariable ["isPhaseWalking", false]) exitWith {};

if (phaseWalkCooldown) exitWith {};
phaseWalkCooldown = true;

blockMainWeapon = true;
player forceWalk true;

"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1, 1.1, 0.0, [0.0, 0.0, 0.0, 0.0], [1.0,0.7, 0.6, 0.60], [0.200, 0.600, 0.100, 0.0]];
"colorCorrections" ppEffectCommit 1.5;

sleep 0.75;

{
    if (side _x isEqualTo civilian) then {
	    _x hideObject true;
	};
} forEach playableUnits;

playSound "startPhaseWalk";

sleep 0.75;

player setVariable ["isPhaseWalking", true, true];
player setVariable ["undetectable", true, true];
[player,true] remoteExec ["hideObject", [0, -2] select isDedicated];

player setAnimSpeedCoef 1.6;
player forceWalk false;
blockMainWeapon = false;

private _soundSrc = "Land_HelipadEmpty_F" createVehicle getpos player;
_soundSrc attachTo [player, [0, 0, 1]]; 
[_soundSrc, selectRandom ["phaseWalk_1", "phaseWalk_2"], 50] remoteExecCall ["gonzka_fnc_say3D", [0, -2] select isDedicated];

[_soundSrc] spawn {
	waitUntil {!(player getVariable ["isPhaseWalking", false])};
	deleteVehicle (_this select 0);
};

sleep 5;

[] spawn gonzka_fnc_endPhaseWalk;