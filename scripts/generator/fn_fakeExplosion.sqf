/*
    Author:	Gonzka

    Generates an explosion
*/

params ["_spawnPos"];

private _explosive = "SmallSecondary" createVehicle _spawnPos;
_explosive setPos _spawnPos;