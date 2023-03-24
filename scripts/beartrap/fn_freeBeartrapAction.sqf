/*
    Author:	Gonzka

    A player can free himself from a bear trap
*/

[
	player,
	localize "STR_GAME_FreeFromTrap",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa",
	"str attachedObjects player find 'beartrap' != -1",
	"str attachedObjects player find 'beartrap' != -1",
	{},
	{},
	{
		call gonzka_fnc_detachBeartrap; [player,""] remoteExec ["switchMove"];
		["STR_SCORE_TrapEscape",500] call gonzka_fnc_addBloodpoints;
	},
	{},
	[],
	15,
	nil,
	false,
	false
]  call BIS_fnc_holdActionAdd;