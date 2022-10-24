/*
    Author:	Gonzka

    Sprint Burst Survivor Perk
*/

if !("sprintBurst" in (player getVariable "intruders_activePerks")) exitWith {};
if (exhausted) exitWith {};

exhausted = true;
player setAnimSpeedCoef 1.5;
sleep 3;
if (player getVariable ["hope", false]) then {
    player setAnimSpeedCoef 1.07; //Hope Survivor Perk
} else {
    player setAnimSpeedCoef 1; 
};

sleep 60;
exhausted = false;