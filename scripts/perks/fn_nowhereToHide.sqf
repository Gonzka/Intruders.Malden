/*
    Author:	Gonzka

    Nowhere to hide Killer Perk
*/

if !("nowhereToHide" in (player getVariable "intruders_activePerks")) exitWith {};

private _eventHandlerId = addMissionEventHandler ["Draw3D", {
	{
		if (player distance getPosATL _x <= 24) then {
			drawIcon3D ["\intruders_mod\textures\gui\hud_survivor.paa", [1,1,1,1], ASLToAGL getPosASLVisual _x, 0.8, 0.8, 0, "", 1, 0.0315];
		};  
	} forEach playableUnits - [player];
}];

sleep 5;
if ("lethalPursuer" in (player getVariable "intruders_activePerks")) then { sleep 2; };
removeMissionEventHandler ["Draw3D", _eventHandlerId];