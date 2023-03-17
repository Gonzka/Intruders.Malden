/*
    Author:	Gonzka

    Local function when a generator explodes
*/

private _generator = getPos player nearestObject "Land_TransferSwitch_01_F"; 

//CIRCUIT ITEM
if (circuits > 0) then {
	circuits = circuits - 1;

	private _inactiveGenerators = [];
	{ 
		if (_x != _generator) then {
			_inactiveGenerators pushBack _x;
		};
	} forEach generators;
	
	if (count _inactiveGenerators < 1) exitWith {};
	_generator = selectRandom _inactiveGenerators;
	playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\drill_finish.wss", player, false, getPosASL player, 4, 1, 20];
};

playSound3D [selectRandom ["a3\sounds_f\vehicles\crashes\cars\quadbike_crash_default_1.wss", "a3\sounds_f\vehicles\crashes\cars\quadbike_crash_default_2.wss", "a3\sounds_f\vehicles\crashes\cars\quadbike_crash_default_3.wss", "a3\sounds_f\vehicles\crashes\cars\quadbike_crash_default_4.wss"], _generator, false, getPosASL _generator, 5];

[_generator] spawn gonzka_fnc_sparkParticles;
[_generator,"\intruders_mod\textures\gui\hud_generator.paa","",[1,0,0,1]] remoteExec ["gonzka_fnc_auraNotification",east];