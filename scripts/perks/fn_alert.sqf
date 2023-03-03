/*
    Author:	Gonzka

    Alert Survivor Perk
*/

if !("alert" in (player getVariable "intruders_activePerks")) exitWith {};

[Killer,"","",[1,1,1,1],5] spawn gonzka_fnc_auraNotification;