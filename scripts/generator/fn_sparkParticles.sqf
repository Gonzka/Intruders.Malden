/*
    Author:	Gonzka

    Generates sparks effect
*/

params [
    ["_generator", objNull, [objNull]]
];

[_generator] spawn { 
    _generator = _this select 0; 
    _sparks = "#particlesource" createVehicle getpos _generator; 
    _sparks attachTo [_generator,[0,-0.15,0.45],"avionics_effect_5"]; 
    _pos = getPos _sparks; 
    deleteVehicle _sparks; 
    _posV = getPos _generator; 
    
    _sparks = "#particlesource" createVehicle getpos _generator; 
    _sparks setPos _pos; 
    _sparks setParticleClass "AvionicsSparks"; 
 
    _smoke = "#particlesource" createVehicle getpos _generator; 
    _smoke setPos _pos; 
    _smoke setParticleClass "AvionicsSmoke"; 
    _sparksSound = createSoundSource ["Sound_SparklesWreck1", _pos, [], 0]; 
 
    sleep 1.5; 
    deleteVehicle _sparks; 
    sleep 1.5; 
    deleteVehicle _sparksSound; 
    deleteVehicle _smoke; 
};

[_generator] spawn { 
    _generator = _this select 0; 
    _posV = getPos _generator; 
    _smoke1 = "#particlesource" createVehicle getpos _generator; 
    _smoke1 attachTo [_generator,[0,-0.15,0.2],"engine_effect_1"]; 
    _pos = getPos _smoke1; 
    deleteVehicle _smoke1; 
    _smoke1 = "#particlesource" createVehicle getpos _generator; 
    _smoke1 setPos _pos; 
    _smoke1 setParticleClass "WreckSmokeSmall"; 
    if (isNil {_generator getVariable "smokeSound"}) then { 
        _smokeSound1 = createSoundSource ["Sound_SmokeWreck1", _pos, [], 0]; 
        _generator setVariable ["smokeSound",_smokeSound1]; 
    }; 
    sleep 3; 
    deleteVehicle _smoke1; 
    if !(isNil {_generator getVariable "smokeSound"}) then {deleteVehicle (_generator getVariable "smokeSound")}; 
};