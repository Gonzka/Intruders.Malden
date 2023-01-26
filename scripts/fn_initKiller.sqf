/*
    Author:	Gonzka

    Initialization and creation of the killer
*/

waitUntil {!(isNull (findDisplay 46))};

player enableStamina false;
player allowSprint true;
player setAnimSpeedCoef 1.15;

switch (player getVariable "killer") do {
	case "compactor": {
		{
			[_x,false] remoteExec ["hideObject",0,true];
			private _decal = "Crater" createVehicle getPos _x;
			_decal setPos getPos _x;
			_decal setDir getDir _x;
			
			call compile format ["
			addMissionEventHandler ['Draw3D', {drawIcon3D [getMissionPath 'textures\ico_abilityCompactor.paa', [1,1,1,1], ASLToAGL getPosASL (objectFromNetId '%1'), 0.8, 0.8, 0, '%2', 1, 0.0315, 'EtelkaMonospacePro'];}];
			", netId _x, toUpper (_x getVariable "portalName")];
			
			player addAction [format ["<img image='textures\ico_abilityCompactor.paa'/> " + localize "STR_GAME_PortalTravel",_x getVariable "portalName"],{
				_portal = _this select 3; 
				[_portal] spawn gonzka_fnc_travelThroughPortal;
			},_x,0,false,false,"",'!portalTravelInUse']; //_portal = nearestObjects [player, ["Land_ShellCrater_02_large_F"], 3]; !(_portal isEqualTo [] && {isObjectHidden (_portal select 0)}) && {!portalTravelInUse}
		} forEach [portal_1, portal_2, portal_3, portal_4, portal_5, portal_6, portal_7];
	};
	case "butcher": {
		call gonzka_fnc_randomBeartraps;
	};
};

player setPos ([getMarkerPos ((player getVariable "spawnPoint") select 0), 0, 5, 3, 0, 1] call BIS_fnc_findSafePos);
player setDir (random 360);

private _weaponFunctions = [] spawn gonzka_fnc_weapon;
waitUntil {scriptDone _weaponFunctions};
call initWeapon;

player selectWeapon secondaryWeapon player;

[] spawn gonzka_fnc_createFogParticles;
[] spawn gonzka_fnc_initCharacter;
[] spawn gonzka_fnc_spawnCamera;
[] spawn gonzka_fnc_onlyFirstPerson;

//PERKS
[] spawn gonzka_fnc_whispers;
[] spawn gonzka_fnc_boobyTrap;
[] spawn gonzka_fnc_hexUndying;
["hex_ruin"] spawn gonzka_fnc_igniteHexTotem;
["hex_retribution"] spawn gonzka_fnc_igniteHexTotem;

//GEN MARKERS
for "_i" from 1 to 7 do {
	missionNamespace setVariable [format ["draw_genericGen_%1",_i], call compile format ["addMissionEventHandler ['Draw3D', {
		drawIcon3D [getMissionPath 'textures\gui\hud_generator.paa', [1,1,1,1], ASLToAGL getPosASL %1, 0.8, 0.8, 0, '', 1, 0.0315, 'EtelkaMonospacePro']; 
	}];", format ['genericGen_%1',_i]]];
};