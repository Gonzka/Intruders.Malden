/*
    Author:	Gonzka

    Picks a random Hit Scream sound from the Arma Config and plays it
*/

params [
    ["_unit",objNull,[objNull]]
];

private _person = format ["person%1", round random [4, 11, 18]];
private _screamID = round random [0, 2, 4];
private _scream = getArray (configfile >> "CfgVehicles" >> "B_Survivor_F" >> "SoundHitScream" >> _person) select 3 select _screamID select 0 select 0;
playSound3D [_scream + ".wss", _unit, false, getPosASL _unit, 1, 1, 50];