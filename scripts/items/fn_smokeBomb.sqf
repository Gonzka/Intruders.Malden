/*
    Author:	Gonzka

    Creates a thick smoke effect
*/

params [
	["_unit", objNull, [objNull]]
];

private _pos = getPosATL _unit;

private _source1 = "#particlesource" createVehicleLocal _pos;
_source1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 7, 48, 1], "", "Billboard", 1, 10, [0, 0, 0], [0, 0, 0.5], 0, 1.277, 1, 0.025, [0.5, 8, 12, 15], [[1, 1, 1, 0.7],[1, 1, 1, 0.5], [1, 1, 1, 0.25], [1, 1, 1, 0]], [0.2], 1, 0.04, "", "", _this];
_source1 setParticleRandom [2, [0.3, 0.3, 0.3], [1.5, 1.5, 1], 20, 0.2, [0, 0, 0, 0.1], 0, 0, 360];
_source1 setDropInterval 0.2;

private _source2 = "#particlesource" createVehicleLocal _pos;
_source2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12, 7, 0], "", "Billboard", 1, 5, [0, 0, 0], [0, 0, 0.5], 0, 1.277, 1, 0.025, [0.5, 8, 12, 15], [[1, 1, 1, 1],[1, 1, 1, 1], [1, 1, 1, 0.5], [1, 1, 1, 0]], [0.2], 1, 0.04, "", "", _this];
_source2 setParticleRandom [2, [0.3, 0.3, 0.3], [1.5, 1.5, 1], 20, 0.2, [0, 0, 0, 0.1], 0, 0, 360];
_source2 setDropInterval 0.15;

_source1 say3D ["flare", 50];

uiSleep 20;

deleteVehicle _source1;
deleteVehicle _source2;