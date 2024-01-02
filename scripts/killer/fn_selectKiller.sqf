/*
    Author:	Gonzka

    Selection of the killer
*/

params [
	["_killer", 1, [1]]
];

closeDialog 0;

removeGoggles player;

switch (_killer) do {
	case 1: {
		player setVariable ["killer","wendigo",true];
		
		player addGoggles "NWTS_goggle_deer_mossy";
		[player, "Deerface1"] remoteExec ["setFace", 0, player];
		
		player addWeapon "Intruders_Axe";
		
		[localize "STR_GAME_KillerSelected", localize "STR_GAME_Wendigo", 5, "\intruders_mod\textures\portraits\ico_wendigo.paa"] spawn gonzka_fnc_notification;
	};
	case 2: {
		player setVariable ["killer","buckethead",true];
		
		player addHeadgear "Intruders_BucketHead";
		removeUniform player;
		player forceAddUniform "U_C_ConstructionCoverall_Red_F";
		[player, "WhiteHead_22_l"] remoteExec ["setFace", 0, player];
		
		player addWeapon "Intruders_Pickaxe";
		
		[localize "STR_GAME_KillerSelected", localize "STR_GAME_Buckethead", 5, "\intruders_mod\textures\portraits\ico_buckethead.paa"] spawn gonzka_fnc_notification;
	};
	case 3: {
		player setVariable ["killer","trapper",true];
		
		player addGoggles "Intruders_HockeyMask";
		removeUniform player;
		player forceAddUniform "U_C_E_LooterJacket_01_F";
		[player, "Jason"] remoteExec ["setFace", 0, player];
		
		player addWeapon "Intruders_Machete";
		
		[localize "STR_GAME_KillerSelected", localize "STR_GAME_Trapper", 5, "\intruders_mod\textures\portraits\ico_trapper.paa"] spawn gonzka_fnc_notification;
	};
};

call gonzka_fnc_loadGear;

[["Intruders", player getVariable "killer"], 15,"",35,"",true,true,false,true] call BIS_fnc_advHint;