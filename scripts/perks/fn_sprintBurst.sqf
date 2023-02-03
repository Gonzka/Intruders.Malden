/*
    Author:	Gonzka

    Sprint Burst Survivor Perk. Now Basekit, but longer duration with perk.
*/

if (exhausted) exitWith {};

exhausted = true;
player setAnimSpeedCoef 1.5;
sleep 5;
if ("sprintBurst" in (player getVariable "intruders_activePerks")) then {
    sleep 5;
};
if (player getVariable ["hope", false]) then {
    player setAnimSpeedCoef 1.07; //Hope Survivor Perk
} else {
    player setAnimSpeedCoef 1; 
};
["STR_ITEM_SprintBurst", "STR_GAME_SprintBurstExhausted", 5, "textures\ico_sprintburst.paa"] spawn gonzka_fnc_notification;

sleep 60;
exhausted = false;
["STR_ITEM_SprintBurst", "STR_GAME_SprintBurstReady", 5, "textures\ico_sprintburst.paa"] spawn gonzka_fnc_notification;