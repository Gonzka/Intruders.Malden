/*
    Author:	Gonzka

    Spawns the player on the map with a cinematic shot
*/

private "_spawnPoints";

switch (worldName) do {
	case "Tanoa": {
		_spawnPoints = if (playerSide isEqualTo east) then {
			[
				["killerPos_1","STR_TANOA_KillerSpawn1"],
				["killerPos_2","STR_TANOA_KillerSpawn2"],
				["killerPos_3","STR_TANOA_KillerSpawn3"],
				["killerPos_4","STR_TANOA_KillerSpawn4"]
			];
		} else {
			[
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
		};
    };
	case "Malden": {
		_spawnPoints = if (playerSide isEqualTo east) then {
			[
				["killerPos_1","STR_MALDEN_KillerSpawn1"],
				["killerPos_2","STR_MALDEN_KillerSpawn2"],
				["killerPos_3","STR_MALDEN_KillerSpawn3"]
			];
		} else {
			[
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
		};
	};
	case "Altis": {
		_spawnPoints = if (playerSide isEqualTo east) then {
			[
				["killerPos_1","STR_ALTIS_KillerSpawn1"],
				["killerPos_2","STR_ALTIS_KillerSpawn2"],
				["killerPos_3","STR_ALTIS_KillerSpawn3"]
			];
		} else {
			[
				["intruderPos_1","STR_ALTIS_IntruderSpawn1"],
				["intruderPos_2","STR_ALTIS_IntruderSpawn2"],
				["intruderPos_3","STR_ALTIS_IntruderSpawn3"],
				["intruderPos_4","STR_ALTIS_IntruderSpawn4"],
				["intruderPos_5","STR_ALTIS_IntruderSpawn5"],
				["intruderPos_6","STR_ALTIS_IntruderSpawn6"],
				["intruderPos_7","STR_ALTIS_IntruderSpawn7"],
				["intruderPos_8","STR_ALTIS_IntruderSpawn8"],
				["intruderPos_9","STR_ALTIS_IntruderSpawn9"]
			];
		};
	};
	default {
		_spawnPoints = [["",""]];
	};
};
private _randomPoint = selectRandom _spawnPoints;
player setPos getMarkerPos (_randomPoint select 0);
player setDir (random 360);

[] spawn gonzka_fnc_createFogParticles;

//SPAWN CAMERA SEQUENCE
call gonzka_fnc_spawnAnimation;
playMusic selectRandom ["EventTrack02_F_EPB", "EventTrack01a_F_EPB", "EventTrack02a_F_EPB"]; //"EventTrack03_F_EPB", "EventTrack03a_F_EPB", "Music_Intro_02_MissionStart", "Music_Freeroam_01_MissionStart"

private _camera = "camera" camcreate (position player);
_camera cameraeffect ["internal","back"];
showCinemaBorder false;
camUseNVG false;

titleCut ["","BLACK IN",1];
[parseText format ["<t font='PuristaBold' size='2.0'>%1</t><br/>%2", localize (_randomPoint select 1), if (playerSide isEqualTo east) then {localize "STR_GAME_KillerTask"} else {localize "STR_GAME_IntrudersTask"}], true, nil, 6, 1, 0] spawn BIS_fnc_textTiles;

private _pos1 = player getRelPos [3, 0];
private _pos2 = player getRelPos [-2, 50];

_camera camPrepareTarget player;
_camera camPreparePos [(_pos1 select 0), (_pos1 select 1), ((getPosATL player) select 2) + 1.5];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
waitUntil {camCommitted _camera};

_camera camPrepareTarget player;
_camera camPreparePos [(_pos2 select 0), (_pos2 select 1), ((getPosATL player) select 2) + 1.5];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 8;
waitUntil {camCommitted _camera};

player cameraEffect ["terminate","back"];
camDestroy _camera;

[player, ""] remoteExec ["switchMove"];

call BIS_fnc_VRFadeIn;
sleep 1;

[] spawn gonzka_fnc_statusbar;
[] spawn gonzka_fnc_endgameTimer;

//PERKS
if (playerSide isEqualTo east) then {
    call gonzka_fnc_lethalPursuer;
} else {
    [] spawn gonzka_fnc_dejaVu;
};