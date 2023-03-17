/*
    Author:	Gonzka

    Déjà Vu Survivor Perk
*/

if !("dejaVu" in (player getVariable "intruders_activePerks")) exitWith {};
if (count repairedGenerators isEqualTo totalGenerators || endgameActivated) exitWith {};

private _inactiveGens = generators - repairedGenerators;
private _nearestGens = ([_inactiveGens, [], {selectRandom _inactiveGens distance _x}, "ASCEND"] call BIS_fnc_sortBy) select [0, 3];

private _eventHandlerId = call compile format ["addMissionEventHandler ['Draw3D', {
	{
		if (!(_x in repairedGenerators) && !endgameActivated) then {
			drawIcon3D ['\intruders_mod\textures\gui\hud_generator.paa', [1,1,1,1], ASLToAGL getPosASLVisual _x, 0.8, 0.8, 0, '', 1, 0.0315, 'EtelkaMonospacePro', 'center', true];
		} else {
			removeMissionEventHandler ['Draw3D', _thisEventHandler];
		};
	} forEach %1;
}];", _nearestGens];

sleep 60;
removeMissionEventHandler ["Draw3D", _eventHandlerId];