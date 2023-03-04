/*
    Author:	Gonzka

    Makes the killer almost completely invisible
*/

if !(player getVariable ["isCloaked", false]) then {
	
	if (cloakingCooldown) exitWith {};
	cloakingCooldown = true;
	
	blockMainWeapon = true;
	player forceWalk true;
	
	"radialBlur" ppEffectEnable true;
	"radialBlur" ppEffectAdjust [0.5,2,0.3,0.5];
	"radialBlur" ppEffectCommit 2;
	
	_soundSrc = "Land_HelipadEmpty_F" createVehicle getpos player;
	_soundSrc attachTo [player, [0, 0, 1]]; 
	[_soundSrc, selectRandom ["cloak_1", "cloak_2", "cloak_3", "cloak_4"]] remoteExecCall ["say3D"];
	
	sleep 2;
	
	[_soundSrc] spawn {
		sleep 7;
		deleteVehicle (_this select 0);
	};
	
	player setVariable ["isCloaked", true, true];
	player setVariable ["undetectable", true, true];
	[player] remoteExec ["gonzka_fnc_cloakTransition"];
	[player] remoteExec ["gonzka_fnc_cloakParticles"];
	[player,true] remoteExec ["hideObject",allPlayers - [player]];
	
	player setAnimSpeedCoef 1.5;
	player forceWalk false;
	cloakingCooldown = false;

} else {
	
	if (cloakingCooldown) exitWith {};
	cloakingCooldown = true;
	
	player forceWalk true;
	player setAnimSpeedCoef 1.15;
	
	_soundSrc = "Land_HelipadEmpty_F" createVehicle getpos player;
	_soundSrc attachTo [player, [0, 0, 1]]; 
	[_soundSrc, selectRandom ["cloak_1", "cloak_2", "cloak_3", "cloak_4"]] remoteExecCall ["say3D"];
	
	"radialBlur" ppEffectAdjust [0,0,0,0];
	"radialBlur" ppEffectCommit 3;
	sleep 3;
	"radialBlur" ppEffectEnable false;
	
	[_soundSrc] spawn {
		sleep 4;
		deleteVehicle (_this select 0);
	};
	
	player setVariable ["isCloaked", false, true];
	player setVariable ["undetectable", false, true];
	[player] remoteExec ["gonzka_fnc_cloakTransition"];
	[player,false] remoteExec ["hideObject",allPlayers - [player]];
	
	player forceWalk false;
	blockMainWeapon = false;
	
	//QUEST
	[] spawn {
		quest_hit_openTimeSlot = true;
		sleep 5;
		quest_hit_openTimeSlot = false;
	};
	
	//UNCLOAKING SPEED BURST
	/*player setAnimSpeedCoef 1.5;
	sleep 1;
	player setAnimSpeedCoef 1.15;*/
	
	cloakingCooldown = false;
};