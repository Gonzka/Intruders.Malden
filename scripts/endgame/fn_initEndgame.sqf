/*
    Author:	Gonzka

    Starts the Endgame and reveals the escape vehicle
*/

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

if (worldName in ["Malden","Tanoa"]) then {
    {
        _x hideObject false;
        _x enableSimulation true;
    } forEach [escapeLight_1, escapeLight_2];
};

{
    _x hideObject false;
    _x enableSimulation true;
} forEach [escapeVehicle_1, escapeVehicle_2];

addMissionEventHandler ["Draw3D", {
    drawIcon3D ["\intruders_mod\textures\gui\hud_escape.paa", [1,1,1,1], ASLToAGL getPosASL escapeVehicle_1, 0.8, 0.8, 0, toUpper localize "STR_GAME_EscapeVehicle" + " #1", 1, 0.025, "EtelkaMonospacePro", 'center', true];
    drawIcon3D ["\intruders_mod\textures\gui\hud_escape.paa", [1,1,1,1], ASLToAGL getPosASL escapeVehicle_2, 0.8, 0.8, 0, toUpper localize "STR_GAME_EscapeVehicle" + " #2", 1, 0.025, "EtelkaMonospacePro", 'center', true];
}];

//No One Escapes Death Killer Perk (Hex)
if ("hex_noOneEscapesDeath" in (player getVariable "intruders_activePerks")) then {
    ["hex_noOneEscapesDeath"] spawn gonzka_fnc_igniteHexTotem;
};

//ESCAPEVEHICLE LOCKPICKED?
waitUntil {(locked escapeVehicle_1) < 2 || (locked escapeVehicle_2) < 2};
endgameCountdown = true;
playSound "air_raid";
[1] spawn BIS_fnc_earthquake;