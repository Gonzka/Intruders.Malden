/*
    Author:	Gonzka

    Initialization and spawn of survivors
*/

waitUntil {!(isNull (findDisplay 46))};
player enableStamina false;
player allowSprint false;

player setPos ([getMarkerPos ((player getVariable "spawnPoint") select 0), 0, 5, 5, 0, 20, 0] call BIS_fnc_findSafePos);
player setDir (random 360);

[] spawn gonzka_fnc_createFogParticles;
[] spawn gonzka_fnc_initCharacter;
[] spawn gonzka_fnc_spawnCamera;

//PERKS
call gonzka_fnc_bond;
call gonzka_fnc_plunderersInstinct;
[] spawn gonzka_fnc_premonition;

if ("botanyKnowledge" in (player getVariable "intruders_activePerks")) then { //Survivor Perk Botany Knowledge
    player setUnitTrait ["Medic",true];
};

waitUntil {!(isNil "Killer")}; 
[Killer] spawn gonzka_fnc_terrorRadius;