/*
    Author:	Gonzka

    Client-side functions that are executed at the start of the game during a Season
*/

playMusic "OM_Intro";

if (bloodRush) then { //1.5x Bloodpoints
	["STR_GAME_BloodRushEvent", "STR_GAME_BloodRushDesc", 15, "textures\ico_points.paa"] spawn gonzka_fnc_notification;
};

if (bloodHunt) then { //2x Bloodpoints
	["STR_GAME_BloodHuntEvent", "STR_GAME_BloodHuntDesc", 15, "textures\ico_points.paa"] spawn gonzka_fnc_notification;
};

switch (season) do {
	case "Halloween": {
		//Lobby Music
		playMusic "lobby_halloween";
		
		//Event Notification
		["STR_GAME_HalloweenEvent", "STR_GAME_HalloweenEventDesc", "textures\ico_pumpkin.paa", "21.10 - 11.11"] call gonzka_fnc_eventNotification;

		//Bonus Bloodpoints
		bloodHunt = true;
		
		//Special Generators
		{
			private _generator = getPos _x nearestObject "Land_PowerGenerator_F";
			private _gamePackage = createSimpleObject ["EauDeCombat_01_box_F", [0,0,0], true];   	
			_gamePackage setObjectTexture [0, "textures\objects\intrudersGamePackage.paa"];
			private _controller = createSimpleObject ["Land_GamingSet_01_controller_F", [0,0,0], true];
			for "_i" from 0 to 1 do {
				_gamePackage attachTo [_generator, [-0.1,-0.2,0.85]];
				_gamePackage setDir 70;	
				_controller attachTo [_generator, [-0.3,-0.12,0.77]];
				_controller setDir 40;
			};
		} forEach generators;
	};
	
	case "Winter": {
		//Lobby Music
		playMusic "lobby_winter";
		
		//Event Notification
		["STR_GAME_WinterEvent", "STR_GAME_WinterEventDesc", "textures\ico_snowman.paa", "06.12 - 31.12"] call gonzka_fnc_eventNotification;
		
		//Bonus Bloodpoints
		bloodRush = true;
		
		//Special Lobby
		{
			_x hideObject false;
		} forEach [winterObj_1, winterObj_2, winterObj_3, winterObj_4];
	};
};