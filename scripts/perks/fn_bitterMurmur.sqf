/*
    Author:	Gonzka

    Bitter Murmur Killer Perk
*/

params [
    ["_generator", objNull, [objNull]]
];

if !("bitterMurmur" in (player getVariable "intruders_activePerks")) exitWith {};

{
    if (count repairedGenerators isEqualTo totalGenerators) then {
        [_x,"","",[1,1,1,1],10,false] spawn gonzka_fnc_auraNotification;
    } else {
        if (_x distance _generator <= 16) then {
            [_x,"","",[1,1,1,1],5,false] spawn gonzka_fnc_auraNotification;
        };
    };
} forEach playableUnits - [player];

playSound "Orange_Timeline_FadeOut";