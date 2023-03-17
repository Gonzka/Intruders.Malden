/*
    Author:	Gonzka

    Counterforce Survivor Perk
*/

if !("counterforce" in (player getVariable "intruders_activePerks")) exitWith {};
if (totems isEqualTo []) exitWith {};

private _nearestTotem = ([totems, [], {player distance _x}, "DESCEND"] call BIS_fnc_sortBy) select 0;
[_nearestTotem,"\intruders_mod\textures\gui\totem.paa","",[1,1,1,1],4] spawn gonzka_fnc_auraNotification;