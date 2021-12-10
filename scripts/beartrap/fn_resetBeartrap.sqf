/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         25.07.2021
	Description:	 The Killer can reset bear traps

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

params [
    ["_trap", objNull, [objNull]]
];

[
	_trap,
	localize "STR_GAME_ResetTrap",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"_this distance _target < 2 && _target animationPhase 'door_1' isEqualTo 1 && isNull attachedTo _target",
	"_this distance _target < 2 && _target animationPhase 'door_1' isEqualTo 1 && isNull attachedTo _target",
	{ 
	    player switchMove "AinvPknlMstpSlayWrflDnon";
        player playMoveNow "AinvPknlMstpSlayWrflDnon";
	},
	{},
	{ 
	    {
            _target animate [_x,0];
        } forEach ["door_1","door_2","door_3","door_4","door_5"];

        [_target, selectRandom ["bearTrap_1", "bearTrap_2", "bearTrap_3", "bearTrap_4"]] remoteExecCall ["say3D"];
		
		[_target] remoteExec ["gonzka_fnc_stepInBeartrap",civilian];
		
		["STR_SCORE_SetTrap",100] call gonzka_fnc_addFunds;
	},
	{},
	[],
	1,
	nil,
	false,
	false
]  call BIS_fnc_holdActionAdd;