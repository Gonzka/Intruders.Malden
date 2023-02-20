/*
    Author:	Gonzka

    Camera movement when the player spawns
*/

playMusic selectRandom ["EventTrack02_F_EPB", "EventTrack01a_F_EPB", "EventTrack02a_F_EPB"]; //"EventTrack03_F_EPB", "EventTrack03a_F_EPB", "Music_Intro_02_MissionStart", "Music_Freeroam_01_MissionStart"
setMusicEventHandler ["MusicStop", "[] spawn gonzka_fnc_terrorMusic; removeMusicEventHandler ['MusicStop', _thisEventHandler];"];

private _camera = "camera" camcreate (position player);
_camera cameraeffect ["internal","back"];
showCinemaBorder false;
camUseNVG false;

titleCut ["","BLACK IN",1];
[parseText format ["<t font='PuristaBold' size='2.0'>%1</t><br/>%2", localize ((player getVariable "spawnPoint") select 1), if (playerSide isEqualTo east) then {localize "STR_GAME_KillerTask"} else {localize "STR_GAME_IntrudersTask"}], true, nil, 6, 1, 0] spawn BIS_fnc_textTiles;

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
    call gonzka_fnc_dejaVu;
};