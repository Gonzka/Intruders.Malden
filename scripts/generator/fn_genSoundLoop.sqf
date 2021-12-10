/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         14.12.2020
	Description:	 Permanent sound when a generator was activated

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

params [
    ["_generator", objNull, [objNull]]
];

private _genSound = ["a3\missions_f_tank\data\sounds\powergenerator.wss","a3\missions_f_tank\data\sounds\powergenerator2.wss"] call BIS_fnc_selectRandom;

while {true} do {
	playSound3D [_genSound, _generator, false, getPosASL _generator, 4, 1, 50]; 
	sleep 30;
};