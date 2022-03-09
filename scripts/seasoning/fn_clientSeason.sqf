/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         10.03.2021
	Description:	 Client-side functions that are executed at the start of the game during a Season

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

private _generators = [genericGen_1, genericGen_2, genericGen_3, genericGen_4, genericGen_5, genericGen_6, genericGen_7];
	
switch (season) do {
	case "Halloween": {
	    //LOBBY MUSIC
		playMusic "lobby_halloween";
	
	    //NOTIFICATION
	    ["STR_GAME_HalloweenEvent", "STR_GAME_HalloweenEventDesc", "textures\ico_pumpkin.paa", "21.10 - 11.11"] call gonzka_fnc_eventNotification;
		
		//GENERATORS
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
		} forEach _generators;
	};
	
	case "Winter": { 
	    //LOBBY MUSIC
		playMusic "lobby_winter";
		
		//NOTIFICATION
	    ["STR_GAME_WinterEvent", "STR_GAME_WinterEventDesc", "textures\ico_snowman.paa", "06.12 - 31.12"] call gonzka_fnc_eventNotification;
		
		//LOBBY OBJECTS
		{
		    _x hideObject false;
		} forEach [winterObj_1, winterObj_2, winterObj_3, winterObj_4];
	};	
	
	default {playMusic "OM_Intro"};
};