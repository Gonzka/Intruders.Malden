/*
    Author:	Gonzka

    Sets the position of the spawn before the actual spawn, so that offerings can still change the spawn behavior
*/

if (worldName isEqualTo "Tanoa") then {
	spawnPoints = [
		["intruderPos_1","STR_TANOA_IntruderSpawn1"],
		["intruderPos_2","STR_TANOA_IntruderSpawn2"],
		["intruderPos_3","STR_TANOA_IntruderSpawn3"],
		["intruderPos_4","STR_TANOA_IntruderSpawn4"],
		["intruderPos_5","STR_TANOA_IntruderSpawn5"],
		["intruderPos_6","STR_TANOA_IntruderSpawn6"],
		["intruderPos_7","STR_TANOA_IntruderSpawn7"],
		["intruderPos_8","STR_TANOA_IntruderSpawn8"],
		["intruderPos_9","STR_TANOA_IntruderSpawn9"],
		["intruderPos_10","STR_TANOA_IntruderSpawn10"],
		["intruderPos_11","STR_TANOA_IntruderSpawn11"],
		["intruderPos_12","STR_TANOA_IntruderSpawn12"]
	];
	
	if (playerSide isEqualTo east) then {
		spawnPoints = [
			["killerPos_1","STR_TANOA_KillerSpawn1"],
			["killerPos_2","STR_TANOA_KillerSpawn2"],
			["killerPos_3","STR_TANOA_KillerSpawn3"],
			["killerPos_4","STR_TANOA_KillerSpawn4"]
		];
    };
} else {
	spawnPoints = [
		["intruderPos_1","STR_MALDEN_IntruderSpawn1"],
		["intruderPos_2","STR_MALDEN_IntruderSpawn2"],
		["intruderPos_3","STR_MALDEN_IntruderSpawn3"],
		["intruderPos_4","STR_MALDEN_IntruderSpawn4"],
		["intruderPos_5","STR_MALDEN_IntruderSpawn5"],
		["intruderPos_6","STR_MALDEN_IntruderSpawn6"],
		["intruderPos_7","STR_MALDEN_IntruderSpawn7"],
		["intruderPos_8","STR_MALDEN_IntruderSpawn8"],
		["intruderPos_9","STR_MALDEN_IntruderSpawn9"],
		["intruderPos_10","STR_MALDEN_IntruderSpawn10"],
		["intruderPos_11","STR_MALDEN_IntruderSpawn11"],
		["intruderPos_12","STR_MALDEN_IntruderSpawn12"]
	];
	
	if (playerSide isEqualTo east) then {
		spawnPoints = [
			["killerPos_1","STR_MALDEN_KillerSpawn1"],
			["killerPos_2","STR_MALDEN_KillerSpawn2"],
			["killerPos_3","STR_MALDEN_KillerSpawn3"]
		];
	};
};

private _randomPoint = spawnPoints call BIS_fnc_selectRandom;

player setVariable ["spawnPoint",[_randomPoint select 0,_randomPoint select 1],true];