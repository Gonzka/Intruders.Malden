/*
    Author:	Gonzka

    The player gets an item from the Lootbox
*/

params [
    ["_chest", objNull, [objNull]]
];

if (_chest getVariable ["looted",false]) exitWith {
	["STR_GAME_Error", "STR_GAME_ChestLooted", 5, "\A3\ui_f\data\GUI\RscCommon\RscDebugConsole\warningcdc_ca.paa", true] spawn gonzka_fnc_notification;
};

_chest animate ["door_1",1];

if (_chest getVariable ["boobyTrap",false]) exitWith { //Booby Trap Killer Perk
	_chest setVariable ["boobyTrap",false,true];
	_chest setVariable ["looted",true,true];
	[getPosATL _chest] call gonzka_fnc_fakeExplosion;
	player setDamage 0.28;
	[_chest,getMissionPath "textures\ico_boobyTrap.paa"] remoteExec ["gonzka_fnc_auraNotification",east];
	[player] call gonzka_fnc_scream; //SURVIVOR SCREAM
};

private _givenItems = ["toolbox", "flashbang", "firstAidKit", "circuit", "smokeBomb", "rifle", "vitalCapsule"];
private _item = "";
private _amount = 1; //Amount of extra given Items
private _exit = false;

if (season != "") then { //SAISONAL
	_givenItems = _givenItems + ["firecrackers"];
};

_item = selectRandom _givenItems;

switch (_item) do {
	case "toolbox": {
		toolboxCharges = toolboxCharges + 6;
	};
	
	case "flashbang": {
		if !(player canAdd "HandGrenade_Stone") exitWith {_exit = true;};
		player addItem "HandGrenade_Stone";
	};
	
	case "firstAidKit": {
		firstAidKits = firstAidKits + 1;
	};
	
	case "circuit": {
		circuits = circuits + 2;
	};
	
	case "smokeBomb": {
		smokeBombs = smokeBombs + 1;
	};
	
	case "rifle": {
		if !(player hasWeapon "arifle_AKS_F") then { //GET RIFLE
			player addWeapon "arifle_AKS_F";
			player setVehicleAmmo 0;
			player addPrimaryWeaponItem "30Rnd_545x39_Mag_F";
			player setAmmo ["arifle_AKS_F", 1];
		} else { //EXTRA BULLET
			private _count = player ammo "arifle_AKS_F";
			player setAmmo ["arifle_AKS_F",_count + 1];
		};
	};
	
	case "firecrackers": {
		firecrackers = firecrackers + 1;
	};
	
	case "vitalCapsule": {
		vitalCapsules = vitalCapsules + 1;
	};
};

if (_exit) exitWith {
	["STR_GAME_Error", "STR_GAME_InventoryFull", 5, "\A3\ui_f\data\GUI\RscCommon\RscDebugConsole\warningcdc_ca.paa", true] spawn gonzka_fnc_notification;
};

[format ["<img image='textures\ico_%1.paa' size = '1.2'/> +%2",_item,_amount] + "</t>",-1,-1,2,0.3,-0.3,1338] spawn bis_fnc_dynamicText;
[["Intruders", _item], 15,"",35,"",true,false,false,true] call BIS_fnc_advHint;

["STR_SCORE_Chest",250] call gonzka_fnc_addBloodpoints;

_chest setVariable ["looted",true,true];

//QUEST
quest_chests = quest_chests + 1;