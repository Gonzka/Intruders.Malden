/*
    Author:	Gonzka

    Hope Survivor Perk
*/

if !("hope" in (player getVariable "intruders_activePerks")) exitWith {};

player setVariable ["hope", true, true];
player setAnimSpeedCoef 1.07;