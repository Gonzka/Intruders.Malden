/*
    Author:	Gonzka

    Dark Sense Survivor Perk
*/

if !("darkSense" in (player getVariable "intruders_activePerks")) exitWith {};

if (darkSenseTriggered) exitWith {}; //Since the effect of the perk cannot be stacked, the perk does not need to be executed twice
darkSenseTriggered = true;

waitUntil {player distance Killer <= 24 && !(Killer getVariable ["undetectable", false]) && !(player getVariable ["oblivious", false])};
[Killer,"","",[1,1,1,1],10] spawn gonzka_fnc_auraNotification;
darkSenseTriggered = false;