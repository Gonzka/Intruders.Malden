/*
    Author:	Gonzka

    Survivors can sabotage bear traps
*/

params [
    ["_trap", objNull, [objNull]]
];

[
	_trap,
	localize "STR_GAME_DisarmTrap",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa",
	"_this distance _target < 2 && {_target animationPhase 'door_1' isEqualTo 0}",
	"_this distance _target < 2 && {_target animationPhase 'door_1' isEqualTo 0}",
	{},
	{},
	{
		player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		
		{
			_target animate [_x,1];
		} forEach ["door_1","door_2","door_3","door_4","door_5"];
		
		[_target, [selectRandom ["bearTrapSnap_1", "bearTrapSnap_2", "bearTrapSnap_3"], 1000]] remoteExecCall ["say3D"];
		[_target,"\intruders_mod\textures\abilities\ico_abilityTrapper.paa","",[1,0,0,1]] remoteExec ["gonzka_fnc_auraNotification",east];
		
		["STR_SCORE_TrapDisarm",300] call gonzka_fnc_addBloodpoints;
	},
	{},
	[],
	3.5,
	nil,
	false,
	false
]  call BIS_fnc_holdActionAdd;