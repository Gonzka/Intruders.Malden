/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         12.10.2020
	Description:	 Local function when a generator explodes

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

private _generator = getPos player nearestObject "Land_TransferSwitch_01_F"; 

//CIRCUIT ITEM
private _circuitCharges = _generator getVariable ["circuitCharges",0];
if (_circuitCharges > 0) then {
	_circuitCharges = _circuitCharges - 1;
	_generator setVariable ["circuitCharges",_circuitCharges,true];
	
	private _inactiveGenerators = [];
	{ 
		if (_x != _generator) then {
			_inactiveGenerators pushBack _x;
		};
	} forEach [genericGen_1, genericGen_2, genericGen_3, genericGen_4, genericGen_5, genericGen_6, genericGen_7];
	
	if (count _inactiveGenerators < 1) exitWith {};
	_generator = selectRandom _inactiveGenerators;
	playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\drill_finish.wss", player, false, getPosASL player, 4, 1, 20];
};

private _failSound = selectRandom ["a3\sounds_f\vehicles\crashes\cars\quadbike_crash_default_1.wss","a3\sounds_f\vehicles\crashes\cars\quadbike_crash_default_2.wss","a3\sounds_f\vehicles\crashes\cars\quadbike_crash_default_3.wss","a3\sounds_f\vehicles\crashes\cars\quadbike_crash_default_4.wss"];	
playSound3D [_failSound, _generator, false, getPosASL _generator, 5, 1, 1000];

[_generator] spawn gonzka_fnc_sparkParticles;
[_generator,"textures\gui\hud_generator.paa","",[1,0,0,1]] remoteExec ["gonzka_fnc_auraNotification",east];