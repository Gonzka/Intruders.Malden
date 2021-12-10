/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         25.07.2021
	Description:	 The Killer can collect bear traps again

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

params [
    ["_trap", objNull, [objNull]]
];

[
	_trap,
	localize "STR_GAME_CollectTrap",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"_this distance _target < 2 && isNull attachedTo _target",
	"_this distance _target < 2 && isNull attachedTo _target",
	{ 
	    player switchMove "AinvPknlMstpSlayWrflDnon";
        player playMoveNow "AinvPknlMstpSlayWrflDnon";
	},
	{},
	{ 
	    deleteVehicle _target;
		[player, selectRandom ["bearTrap_1", "bearTrap_2", "bearTrap_3", "bearTrap_4"]] remoteExecCall ["say3D"];
		beartraps = beartraps + 1;
	},
	{},
	[],
	1,
	nil,
	true,
	false
]  call BIS_fnc_holdActionAdd;