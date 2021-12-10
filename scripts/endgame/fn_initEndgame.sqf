/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         03.03.2021
	Description:	 Starts the Endgame and reveals the escape vehicle

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

closeDialog 0;

if (playerSide isEqualTo civilian) then {
    [] spawn gonzka_fnc_hope; //PERK
};

playSound "air_raid";
[1] spawn BIS_fnc_earthquake;

if (worldName isEqualTo "Malden") then {
    [] spawn { 
        { 
            private _explosive = "HelicopterExploSmall" createVehicleLocal getPosATL _x; 
            _explosive setPos getPosATL _x; 
            sleep 0.15; 
        } forEach [boomStone_1_1, boomStone_2_1, boomStone_1_2, boomStone_2_2, boomStone_1_3, boomStone_2_3, boomStone_1_4, boomStone_2_4]; 
		{
		    if !(isNil _x) then {
                deleteVehicle call compile _x; 
			};
        } forEach ["exitRock_1", "exitRock_2"]; 
    };
};

{
    if !(isNil "_x") then {
        _x hideObject false;
	    _x enableSimulation true;
    };
} forEach [escapeVehicle_1, escapeVehicle_2, escapeLight_1, escapeLight_2];

{ 
    if !(_x getVariable ["active", false]) then { 
	    [_x] remoteExec ["gonzka_fnc_removeGenMarker",east];
		_x setVariable ["active",true,true];
	};	
} forEach [genericGen_1, genericGen_2, genericGen_3, genericGen_4, genericGen_5, genericGen_6, genericGen_7];


addMissionEventHandler ["Draw3D", { 
    drawIcon3D [getMissionPath "textures\gui\hud_escape.paa", [1,1,1,1], ASLToAGL getPosASL escapeVehicle_1, 0.8, 0.8, 0, toUpper localize "STR_GAME_EscapeVehicle" + " #1", 1, 0.0315, "EtelkaMonospacePro"]; 
}];

addMissionEventHandler ["Draw3D", { 
	drawIcon3D [getMissionPath "textures\gui\hud_escape.paa", [1,1,1,1], ASLToAGL getPosASL escapeVehicle_2, 0.8, 0.8, 0, toUpper localize "STR_GAME_EscapeVehicle" + " #2", 1, 0.0315, "EtelkaMonospacePro"]; 
}];

//No One Escapes Death Killer Perk (Hex)
if ("hex_noOneEscapesDeath" in (Killer getVariable "intruders_activePerks")) then {
    ["hex_noOneEscapesDeath"] remoteExec ["gonzka_fnc_igniteHexTotem", east];
};

//ESCAPEVEHICLE LOCKPICKED?
waitUntil {(locked escapeVehicle_1) < 2 || (locked escapeVehicle_2) < 2 || "armageddon" in (Killer getVariable "intruders_activePerks")};
playSound "air_raid";
[1] spawn BIS_fnc_earthquake;

//START TIMER
private _timer = [180, "#FF5500"] spawn gonzka_fnc_timeoutCountdown;
waitUntil {scriptDone _timer};

//ESCAPE FAILED
if (isNull objectParent player && playerSide isEqualTo civilian) then {
    [player, "Acts_Stunned_Unconscious"] remoteExec ["switchMove"];
    [] spawn {
    	sleep 7; player setDamage 1;
    };
};