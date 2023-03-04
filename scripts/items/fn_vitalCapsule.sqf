/*
    Author:	Gonzka

    Instantly revives a distant, unconscious survivor. The reviver himself gets injured in the process.
*/

_incapacitatedUnits = [];
{
    if (_x getVariable ["BIS_revive_incapacitated", false] || lifeState _x isEqualTo "INCAPACITATED") then {
        _incapacitatedUnits pushBack _x;
    };
} forEach playableUnits - [player, Killer];

if (_incapacitatedUnits isEqualTo []) exitWith {};
_revivedUnit = selectRandom _incapacitatedUnits;

["#rev", 1, _revivedUnit] call BIS_fnc_reviveOnState;
_revivedUnit setVariable ["#rev", 1, true];

player setDamage 0.28;
[player] call gonzka_fnc_scream;

["STR_SCORE_Rescue",1500] call gonzka_fnc_addBloodpoints;

[player,"","",[1,1,1,1],5] remoteExec ["gonzka_fnc_auraNotification",east];