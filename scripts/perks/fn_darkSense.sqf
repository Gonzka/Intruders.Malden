/*
    Author:	Gonzka

    Dark Sense Survivor Perk
*/

if !("darkSense" in (player getVariable "intruders_activePerks")) exitWith {};

private _duration = 5;

if (repairedGenerators isEqualTo totalGenerators) then {
    _duration = 10;
};

[Killer,"","",[1,1,1,1],_duration] spawn gonzka_fnc_auraNotification;