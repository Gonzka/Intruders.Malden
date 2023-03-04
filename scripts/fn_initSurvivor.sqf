/*
    Author:	Gonzka

    Initialization and spawn of survivors
*/

waitUntil {!(isNull (findDisplay 46))};
player allowSprint false;

[] spawn gonzka_fnc_spawnPlayer;
[] spawn gonzka_fnc_waterIsLava;

//PERKS
call gonzka_fnc_plunderersInstinct;
[] spawn gonzka_fnc_premonition;
[] spawn gonzka_fnc_smallGame;

if ("botanyKnowledge" in (player getVariable "intruders_activePerks")) then { //Survivor Perk Botany Knowledge
    player setUnitTrait ["Medic",true];
};

[] spawn gonzka_fnc_terrorRadius;