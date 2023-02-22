/*
    Author:	Gonzka

    Master client initialization file
*/

diag_log "----------------------------------------------------------------------------------------------------";
diag_log "---------------------------------- Starting Intruders Client Init ----------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";

private _timeStamp = diag_tickTime;

waitUntil {!isNull (findDisplay 46)};
{_x setVariable ["BIS_noCoreConversations", true]} forEach allUnits; 
0 fadeRadio 0;
enableSentences false;

showHUD [ 
    true, // scriptedHUD 
    false, // info 
    true, // radar 
    true, // compass 
    true, // direction 
    false, // menu 
    true, // group 
    true, // cursors 
    true, // panels 
    true, // kills 
    true  // showIcon3D 
];

diag_log "[Intruders Client] Initialization Variables";
call compileScript ["scripts\configuration.sqf"];
diag_log "[Intruders Client] Variables initialized";

[] spawn gonzka_fnc_menuprincex;
call gonzka_fnc_loginReward;
call gonzka_fnc_clientSeason;

switch (worldName) do {
	case "Tanoa": {
        [] execVM "mapObjects\spawn_tanoa.sqf";
    };
	case "Malden": {
        [] execVM "mapObjects\spawn_malden.sqf";
    };
	case "Altis": {
        [] execVM "mapObjects\spawn_altis.sqf";
    };
};

waitUntil {player getVariable ["playerReady",false]};
diag_log "[Intruders Client] Player has pressed play";

["Einrichten des Clients"] spawn gonzka_fnc_loadingBar; // Start loading screen
sleep 1;

diag_log "[Intruders Client] Setting up Eventhandlers";
call gonzka_fnc_setupEVH;
diag_log "[Intruders Client] Eventhandlers completed";

diag_log "[Intruders Client] Setting up user actions";
call gonzka_fnc_setupActions;
diag_log "[Intruders Client] User actions completed";

diag_log "[Intruders Client] Waiting for Killer and Intruder";
uiNamespace setVariable ["loadingBarText",localize "STR_INIT_KillerWaiting"];
waitUntil {!isNil "Killer"};
uiNamespace setVariable ["loadingBarText",localize "STR_INIT_IntruderWaiting"];
waitUntil {civilian countSide allPlayers > 0};
uiNamespace setVariable ["loadingBarText",localize "STR_INIT_ReadyWaiting"];
waitUntil {{_x getVariable ["playerReady",false] && !isNull _x} count (allPlayers - entities [["VirtualSpectator_F"], [], true]) == count (allPlayers - entities [["VirtualSpectator_F"], [], true])};
diag_log "[Intruders Client] There are enough players";

if (playerSide isEqualTo east) then {
    [] spawn gonzka_fnc_initKiller;
} else {
    [] spawn gonzka_fnc_initSurvivor;
};

(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call gonzka_fnc_keyHandler"];

[] spawn gonzka_fnc_initQuest;
[] spawn gonzka_fnc_checkWinFailConditions;
[] spawn gonzka_fnc_killerLeftGame;

if !(endgameActivated) then {
    totalGenerators = count (allPlayers - entities [["VirtualSpectator_F"], [], true]); //For each player, a generator that needs repairs is added.
    if (totalGenerators > 5) then { //Up to a maximum of 5
        totalGenerators = 5;
    };
    publicVariable "totalGenerators";
};

uiNamespace setVariable ["loadingBarText",nil]; // Stop loading screen

diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["--------------- End of Intruders Client Init: Total Execution Time %1 seconds ---------------",(diag_tickTime - _timeStamp)];
diag_log "----------------------------------------------------------------------------------------------------";