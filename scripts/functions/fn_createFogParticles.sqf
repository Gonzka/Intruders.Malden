/*
    Author:	Unkown modified by Gonzka

    Creates local fog around the player
*/

createFogParticles = {
    private _obj = player;
    private _pos = position _obj;
 
    private _fog1 = "#particlesource" createVehicleLocal _pos;
    _fog1 setParticleParams [
    ["\A3\Data_F\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10, [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0, [7,6], [[1, 1, 1, 0], [1, 1, 1, 0.04], [1, 1, 1, 0]], [1000], 1, 0, "", "", _obj];
    _fog1 setParticleRandom [3, [55, 55, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
    _fog1 setParticleCircle [0.001, [0, 0, -0.12]];
    _fog1 setDropInterval 0.01;
 
    private _fog2 = "#particlesource" createVehicleLocal _pos;
    _fog2 setParticleParams [
    ["\A3\Data_F\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10, [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0, [7,6], [[1, 1, 1, 0], [1, 1, 1, 0.04], [1, 1, 1, 0]], [1000], 1, 0, "", "", _obj];
    _fog2 setParticleRandom [3, [55, 55, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
    _fog2 setParticleCircle [0.001, [0, 0, -0.12]];
    _fog2 setDropInterval 0.01;
 
    private _fog3 = "#particlesource" createVehicleLocal _pos;
    _fog3 setParticleParams [
    ["\A3\Data_F\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10, [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0, [7,6], [[1, 1, 1, 0], [1, 1, 1, 0.04], [1, 1, 1, 0]], [1000], 1, 0, "", "", _obj];
    _fog3 setParticleRandom [3, [55, 55, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
    _fog3 setParticleCircle [0.001, [0, 0, -0.12]];
    _fog3 setDropInterval 0.01;
 
    _this setVariable ["playerFog", floor time + 5];
    
    sleep 120;
    deleteVehicle _fog1;
    deleteVehicle _fog2;
    deleteVehicle _fog3;
};

while {true} do {
    if (player getVariable ["playerFog", -1] < time) then {
        player setVariable ["playerFog", floor time + 5];
        player spawn createFogParticles;
        sleep 120;
    };
};