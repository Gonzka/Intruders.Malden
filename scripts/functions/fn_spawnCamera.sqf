/*
    Author:	Gonzka

    Camera movement when the player spawns
*/

private _pos1 = player getRelPos [3, 0];
private _pos2 = player getRelPos [-2, 50];

private _camera = "camera" camcreate (position player);
_camera cameraeffect ["internal","back"];
showCinemaBorder false;
camUseNVG false;

playMusic "Music_Intro_02_MissionStart";
titleCut ["","BLACK IN",1];

[ 
 [ 
  localize ((player getVariable "spawnPoint") select 1)
 ],
 [ 
  if (playerSide isEqualTo east) then {localize "STR_GAME_KillerTask"} else {localize "STR_GAME_IntrudersTask"},
  1,  
  3,  
  2 
 ] 
] spawn BIS_fnc_EXP_camp_SITREP; 

_camera camPrepareTarget player;
_camera camPreparePos [(_pos1 select 0), (_pos1 select 1), ((getPosATL player) select 2) + 1.5];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
waitUntil {camCommitted _camera};

[] spawn {
    sleep 7;
    titleCut ["","BLACK OUT",1];
};

_camera camPrepareTarget player;
_camera camPreparePos [(_pos2 select 0), (_pos2 select 1), ((getPosATL player) select 2) + 1.5];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 8;
waitUntil {camCommitted _camera};

sleep 1;

player cameraEffect ["terminate","back"];
camDestroy _camera;

[player, ""] remoteExec ["switchMove"];

call BIS_fnc_VRFadeIn;
titleCut ["","BLACK IN",3];
sleep 3;

[] spawn gonzka_fnc_statusbar;

//PERKS
if (playerSide isEqualTo east) then {
    call gonzka_fnc_lethalPursuer;
} else {
    call gonzka_fnc_dejaVu;
};