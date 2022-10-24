/*
    Author:	Gonzka

    Undying Killer Perk (Hex)
*/

["hex_undying"] spawn gonzka_fnc_igniteHexTotem;

sleep 1;

private _eventHandlerId = addMissionEventHandler ["Draw3D", {  
	{
		private _survivor = _x;
		if (side _x isEqualTo civilian && (totems findIf {_survivor distance getPosATL _x <= 4 && _x getVariable ["hex",""] isEqualTo ""}) isNotEqualTo -1) then {
			drawIcon3D [getMissionPath "textures\gui\hud_survivor.paa", [1,1,1,1], ASLToAGL getPosASLVisual _x, 0.8, 0.8, 0, "", 1, 0.0315];
		};  
	} forEach playableUnits;
}];

waitUntil {isNil "totem_hex_undying" || {isObjectHidden totem_hex_undying}};
removeMissionEventHandler ["Draw3D", _eventHandlerId];