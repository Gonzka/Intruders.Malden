/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         05.02.2021
	Description:	 Selection of the killer

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

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
		
		player addWeapon "intruders_axt";
	
	    [localize "STR_GAME_KillerSelected", localize "STR_GAME_Wendigo", 5, "textures\ico_wendigo.paa"] spawn gonzka_fnc_notification;
	};
	case 2: {
	    player setVariable ["killer","compactor",true];
	
	    player addHeadgear "Intruders_BucketHead";
	    removeUniform player;
	    player forceAddUniform "U_C_ConstructionCoverall_Red_F";
	    [player, "WhiteHead_22_l"] remoteExec ["setFace", 0, player];
		
		player addWeapon "intruders_pickaxe";

	    [localize "STR_GAME_KillerSelected", localize "STR_GAME_Compactor", 5, "textures\ico_compactor.paa"] spawn gonzka_fnc_notification;
	};
	case 3: {
	    player setVariable ["killer","butcher",true];

	    player addHeadgear "Intruders_HockeyMask";
	    removeUniform player;
	    player forceAddUniform "U_C_E_LooterJacket_01_F";
	    [player, "Jason"] remoteExec ["setFace", 0, player];
		
		player addWeapon "intruders_machete";
	
	    [localize "STR_GAME_KillerSelected", localize "STR_GAME_Butcher", 5, "textures\ico_butcher.paa"] spawn gonzka_fnc_notification;
	};
};

call gonzka_fnc_loadGear;