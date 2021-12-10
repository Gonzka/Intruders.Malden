/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         31.10.2021
	Description:	 Ability of the old man (SCP 106)

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

if !(player getVariable ["isPhaseWalking", false]) exitWith {};

{
    if (side _x isEqualTo civilian) then {
	    _x hideObject false;
	};
} forEach playableUnits;

"colorCorrections" ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0],[1.0, 1.0, 1.0, 1.0],[0.199, 0.587, 0.114, 0.0]];
"colorCorrections" ppEffectCommit 0;
"colorCorrections" ppEffectEnable false;

player setVariable ["isPhaseWalking", false, true];
player setVariable ["undetectable", false, true];
[player,false] remoteExec ["hideObject", [0, -2] select isDedicated];

playSound "endPhaseWalk";

[] spawn {
	sleep 15;
	phaseWalkCooldown = false;
};
	
//SPEED BURST
sleep 0.5;
player setAnimSpeedCoef 1.1;