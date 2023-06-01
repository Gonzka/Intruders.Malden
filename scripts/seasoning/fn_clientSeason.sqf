/*
    Author:	Gonzka

    Client-side functions that are executed at the start of the game during a Season
*/

playMusic "OM_Intro";

if (bloodRush) then { //1.5x Bloodpoints
	["STR_GAME_BloodRushEvent", "STR_GAME_BloodRushDesc", 15, "\intruders_mod\textures\gui\bloodpoints.paa"] spawn gonzka_fnc_notification;
};

if (bloodHunt) then { //2x Bloodpoints
	["STR_GAME_BloodHuntEvent", "STR_GAME_BloodHuntDesc", 15, "\intruders_mod\textures\gui\bloodpoints.paa"] spawn gonzka_fnc_notification;
};

switch (season) do {
	case "Halloween": {
		//Lobby Music
		playMusic "lobby_halloween";
		
		//Event Notification
		["STR_GAME_HalloweenEvent", "STR_GAME_HalloweenEventDesc", "\intruders_mod\textures\gui\ico_pumpkin.paa", "21.10 - 11.11"] call gonzka_fnc_eventNotification;

		//Bonus Bloodpoints
		bloodHunt = true;
	};
	
	case "Winter": {
		//Lobby Music
		playMusic "lobby_winter";
		
		//Event Notification
		["STR_GAME_WinterEvent", "STR_GAME_WinterEventDesc", "\intruders_mod\textures\gui\ico_snowman.paa", "06.12 - 31.12"] call gonzka_fnc_eventNotification;
		
		//Bonus Bloodpoints
		bloodRush = true;
		
		//Special Lobby
		{
			_x hideObject false;
		} forEach [winterObj_1, winterObj_2, winterObj_3, winterObj_4];
	};
};