/*
    Author:	Gonzka

    Initialization and creation of the killer
*/

waitUntil {!(isNull (findDisplay 46))};

player enableStamina false;
player allowSprint true;
player setAnimSpeedCoef 1.15;

switch (player getVariable "killer") do {
	case "buckethead": {
		{			
			call compile format ["
			addMissionEventHandler ['Draw3D', {drawIcon3D [getMissionPath 'textures\ico_abilityBuckethead.paa', [1,1,1,1], ASLToAGL getPosASL (objectFromNetId '%1'), 0.8, 0.8, 0, '%2', 1, 0.0315, 'EtelkaMonospacePro'];}];
			", netId _x, toUpper (_x getVariable "portalName")];
			
			player addAction [format ["<img image='textures\ico_abilityBuckethead.paa'/> " + localize "STR_GAME_PortalTravel",_x getVariable "portalName"],{
				_portal = _this select 3; 
				[_portal] spawn gonzka_fnc_travelThroughPortal;
			},_x,0,false,false,"",'!portalTravelInUse'];
		} forEach [portal_1, portal_2, portal_3, portal_4, portal_5, portal_6, portal_7];
	};
	case "trapper": {
		call gonzka_fnc_randomBeartraps;
	};
};

private _weaponFunctions = [] spawn gonzka_fnc_weapon;
waitUntil {scriptDone _weaponFunctions};
call initWeapon;

player selectWeapon secondaryWeapon player;

call gonzka_fnc_initCharacter;
[] spawn gonzka_fnc_spawnPlayer;
[] spawn gonzka_fnc_createFogParticles;
[] spawn gonzka_fnc_onlyFirstPerson;

//PERKS
[] spawn gonzka_fnc_whispers;
[] spawn gonzka_fnc_boobyTrap;
[] spawn gonzka_fnc_hexUndying;
["hex_ruin"] spawn gonzka_fnc_igniteHexTotem;
["hex_retribution"] spawn gonzka_fnc_igniteHexTotem;

//GEN MARKERS
addMissionEventHandler ['Draw3D', {
	{
		if (!(_x in repairedGenerators) && !endgameActivated) then {
			drawIcon3D [getMissionPath 'textures\gui\hud_generator.paa', [1,1,1,1], ASLToAGL getPosASL _x, 0.8, 0.8, 0, '', 1, 0.0315, 'EtelkaMonospacePro'];
		};
	} forEach [genericGen_1, genericGen_2, genericGen_3, genericGen_4, genericGen_5 , genericGen_6, genericGen_7];
}];