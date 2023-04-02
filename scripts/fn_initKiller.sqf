/*
    Author:	Gonzka

    Initialization and creation of the killer
*/

waitUntil {!(isNull (findDisplay 46))};
player allowSprint true;
player setAnimSpeedCoef 1.15;

switch (player getVariable "killer") do {
	case "buckethead": {
		{			
			call compile format ["
			addMissionEventHandler ['Draw3D', {drawIcon3D ['\intruders_mod\textures\abilities\ico_abilityBuckethead.paa', [1,1,1,1], ASLToAGL getPosASL (objectFromNetId '%1'), 0.8, 0.8, 0, '%2', 1, 0.025, 'EtelkaMonospacePro'];}];
			", netId _x, toUpper (_x getVariable "portalName")];
			
			player addAction [format ["<img image='\intruders_mod\textures\abilities\ico_abilityBuckethead.paa'/> " + localize "STR_GAME_PortalTravel",_x getVariable "portalName"],{
				_portal = _this select 3; 
				[_portal] spawn gonzka_fnc_travelThroughPortal;
			},_x,0,false,false,"",'!portalTravelInUse'];
		} forEach [portal_1, portal_2, portal_3, portal_4, portal_5, portal_6, portal_7];
	};
	case "trapper": {
		beartrapActionId = player addAction["<img image='\intruders_mod\textures\abilities\ico_abilityTrapper.paa'/> " + format [localize "STR_GAME_TrapperAbilityAction", beartraps],gonzka_fnc_setBeartrap,"",0,false,true,"",' beartraps > 0 '];
		call gonzka_fnc_randomBeartraps;
	};
	case "wendigo": {
		player addAction["<img image='\intruders_mod\textures\abilities\ico_abilityWendigo.paa'/> " + localize "STR_GAME_WendigoAbilityAction",gonzka_fnc_cloak,"",0,false,true,"",' !cloakingCooldown '];
	};
};

private _weaponFunctions = [] spawn gonzka_fnc_weapon;
waitUntil {scriptDone _weaponFunctions};
call initWeapon;

player selectWeapon secondaryWeapon player;

[] spawn gonzka_fnc_spawnPlayer;
[] spawn gonzka_fnc_onlyFirstPerson;

//PERKS
[] spawn gonzka_fnc_whispers;
[] spawn gonzka_fnc_boobyTrap;
[] spawn gonzka_fnc_hexUndying;
["hex_ruin"] spawn gonzka_fnc_igniteHexTotem;
["hex_retribution"] spawn gonzka_fnc_igniteHexTotem;

//GEN MARKERS
addMissionEventHandler ["Draw3D", {
	{
		if (!(_x in repairedGenerators) && {!endgameActivated}) then {
			if ("surveillance" in (player getVariable "intruders_activePerks") && {_x getVariable ["isRegressing", false]}) then {
				drawIcon3D ["\intruders_mod\textures\gui\hud_generator.paa", [1,1,0,1], ASLToAGL getPosASL _x, 0.8, 0.8, 0]; //Yellow marker
			} else {
				drawIcon3D ["\intruders_mod\textures\gui\hud_generator.paa", [1,1,1,1], ASLToAGL getPosASL _x, 0.8, 0.8, 0];
			};
		};
	} forEach generators;
}];