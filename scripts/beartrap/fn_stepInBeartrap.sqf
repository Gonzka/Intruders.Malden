/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         18.07.2021
	Description:	 Triggers when a player runs into the trap

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

params [
    ["_trap", objNull, [objNull]]
];

waitUntil {(isNull _trap || _trap animationPhase "door_1" isEqualTo 1 || player distance _trap < 0.6)};
if (isNull _trap || _trap animationPhase "door_1" isEqualTo 1) exitWith {};

{
    _trap animate [_x,1];
} forEach ["door_1","door_2","door_3","door_4","door_5"];

[_trap, selectRandom ["bearTrapSnap_1", "bearTrapSnap_2", "bearTrapSnap_3"], 1000] remoteExecCall ["gonzka_fnc_say3D"];

if (player getVariable ["BIS_revive_incapacitated", false] || !alive player) exitWith {};

player setDamage 0.28;

[_trap,"textures\ico_abilityButcher.paa","",[1,0,0,1],15] remoteExec ["gonzka_fnc_auraNotification",east];

trapPos = getPosATL _trap;
trapDir = getDir _trap;

[player,"Acts_Injured_Driver_Loop"] remoteExec ["switchMove"];
_trap attachTo [player, [0,0,0], "RightFoot", true];

["STR_SCORE_Trapped",1000] remoteExecCall ["gonzka_fnc_addFunds",east];

[player] call gonzka_fnc_scream; //SURVIVOR SCREAM

//QUEST
private _bearTrapCatches = Killer getVariable "quest_bearTrapCatches";
Killer setVariable ["quest_bearTrapCatches",_bearTrapCatches + 1,true];