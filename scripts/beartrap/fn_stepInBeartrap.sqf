/*
    Author:	Gonzka

    Triggers when a player runs into the trap
*/

params [
    ["_trap", objNull, [objNull]]
];

waitUntil {(isNull _trap || _trap animationPhase "door_1" isEqualTo 1 || player distance _trap < 0.6)};
if (isNull _trap || _trap animationPhase "door_1" isEqualTo 1) exitWith {};

{
    _trap animate [_x,1];
} forEach ["door_1","door_2","door_3","door_4","door_5"];

[_trap, [selectRandom ["bearTrapSnap_1", "bearTrapSnap_2", "bearTrapSnap_3"], 1000]] remoteExecCall ["say3D"];

if (player getVariable ["BIS_revive_incapacitated", false] || !alive player) exitWith {};

player setDamage 0.28;

[_trap,"\intruders_mod\textures\abilities\ico_abilityTrapper.paa","",[1,0,0,1],15] remoteExec ["gonzka_fnc_auraNotification",east];

trapPos = getPosATL _trap;
trapDir = getDir _trap;

[player,"Acts_Injured_Driver_Loop"] remoteExec ["switchMove"];
_trap attachTo [player, [0,0,0], "RightFoot", true];

["STR_SCORE_Trapped",1000] remoteExecCall ["gonzka_fnc_addBloodpoints",east];

[player] call gonzka_fnc_scream; //SURVIVOR SCREAM

//QUEST
private _bearTrapCatches = Killer getVariable "quest_bearTrapCatches";
Killer setVariable ["quest_bearTrapCatches",_bearTrapCatches + 1,true];

[["Intruders", "healing"], 15,"",35,"",true,true,true,true] remoteExecCall ["BIS_fnc_advHint",civilian];