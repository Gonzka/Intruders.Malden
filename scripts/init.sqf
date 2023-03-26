/*
    Author:	Gonzka

    Master client initialization file
*/

if (getPlayerUID player in deadPlayers) exitWith { //Prevents dead players from rejoining the game
    failMission "Dead";
};

diag_log "----------------------------------------------------------------------------------------------------";
diag_log "---------------------------------- Starting Intruders Client Init ----------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";

private _timeStamp = diag_tickTime;

waitUntil {!isNull (findDisplay 46)};
{_x setVariable ["BIS_noCoreConversations", true]} forEach allUnits; 
0 fadeRadio 0;
enableSentences false;
player enableStamina false;

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

waitUntil {player getVariable ["isReady",false]};
diag_log "[Intruders Client] Player has pressed play";

[localize "STR_INIT_ClientSetup"] spawn gonzka_fnc_loadingBar; // Start loading screen
sleep 1;

diag_log "[Intruders Client] Setting up Eventhandlers";
call gonzka_fnc_setupEVH;
diag_log "[Intruders Client] Eventhandlers completed";

diag_log "[Intruders Client] Setting up user actions";
call gonzka_fnc_setupActions;
diag_log "[Intruders Client] User actions completed";

diag_log "[Intruders Client] Waiting for players";
uiNamespace setVariable ["loadingBarText",localize "STR_INIT_KillerWaiting"];
waitUntil {Killer = allPlayers select {side _x isEqualTo east} select 0; !isNil "Killer"}; //Killer object undefined fix
uiNamespace setVariable ["loadingBarText",localize "STR_INIT_IntruderWaiting"];
waitUntil {civilian countSide allPlayers > 0};
uiNamespace setVariable ["loadingBarText",localize "STR_INIT_ReadyWaiting"];
waitUntil {count (allPlayers select {_x getVariable ["isReady",false] && {!isNull _x} && {side _x != sideLogic}}) isEqualTo count (allPlayers select {side _x != sideLogic})};
diag_log "[Intruders Client] All players are ready";

if (playerSide isEqualTo east) then {
    [] spawn gonzka_fnc_initKiller;
} else {
    [] spawn gonzka_fnc_initSurvivor;
};

(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call gonzka_fnc_keyHandler"];

[] spawn gonzka_fnc_initQuest;
[] spawn gonzka_fnc_waitUntilMatchFinished;
[] spawn gonzka_fnc_waitUntilKillerDisconnected;

if !(endgameActivated) then {
    totalGenerators = count (allPlayers select {side _x != sideLogic}); //For each player, a generator that needs repairs is added.
    if (totalGenerators > 5) then { //Up to a maximum of 5
        totalGenerators = 5;
    };
    publicVariable "totalGenerators";
};

uiNamespace setVariable ["loadingBarText",nil]; // Stop loading screen

diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["--------------- End of Intruders Client Init: Total Execution Time %1 seconds ---------------",(diag_tickTime - _timeStamp)];
diag_log "----------------------------------------------------------------------------------------------------";