/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         18.10.2020
	Description:	 Master client initialization file

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

diag_log "----------------------------------------------------------------------------------------------------";
diag_log "---------------------------------- Starting Intruders Client Init ----------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";

private _timeStamp = diag_tickTime;

waitUntil {!isNull (findDisplay 46)};
{_x setVariable ["BIS_noCoreConversations", true]} forEach allUnits; 
0 fadeRadio 0;
enableSentences false;

0 enableChannel [true, false];
{_x enableChannel false;} forEach [1, 2, 3, 4];
if (playerSide isEqualTo civilian) then {
    5 enableChannel true;
} else {
    5 enableChannel false;
};

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
call compile preprocessFileLineNumbers "scripts\configuration.sqf";
diag_log "[Intruders Client] Variables initialized";

[] spawn gonzka_fnc_menuprincex;
call gonzka_fnc_spawnPoint;
call gonzka_fnc_loginReward;
call gonzka_fnc_clientSeason;

waitUntil {player getVariable ["playerReady",false]};
diag_log "[Intruders Client] Player has pressed play";

if (matchInProgress) then {
    failMission "matchInProgress";
};

[] spawn gonzka_fnc_startLoadingScreen;

diag_log "[Intruders Client] Setting up Eventhandlers";
call gonzka_fnc_setupEVH;
diag_log "[Intruders Client] Eventhandlers completed";

diag_log "[Intruders Client] Setting up user actions";
call gonzka_fnc_setupActions;
diag_log "[Intruders Client] User actions completed";

loadingText = localize "STR_INIT_PlantsSetup";
if (worldName isEqualTo "Tanoa") then {
    _mapObjects = [] execVM "mapObjects\spawn_tanoa.sqf";
	waitUntil {scriptDone _mapObjects};
} else {
    _mapObjects = [] execVM "mapObjects\spawn_malden.sqf";
	waitUntil {scriptDone _mapObjects};
};

diag_log "[Intruders Client] Waiting for Killer and Intruder"; 
loadingText = localize "STR_INIT_KillerWaiting";
waitUntil {!isNil "Killer"};
loadingText = localize "STR_INIT_IntruderWaiting";
waitUntil {civilian countSide allPlayers > 0};
loadingText = localize "STR_INIT_ReadyWaiting";
waitUntil {{_x getVariable ["playerReady",false]} count allPlayers == count allPlayers;};
diag_log "[Intruders Client] There are enough players";

if (playerSide isEqualTo east) then {
    [] spawn gonzka_fnc_initKiller;
} else {
    [] spawn gonzka_fnc_initSurvivor;
};

(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call gonzka_fnc_keyHandler"];

[] spawn {
    for "_i" from 0 to 1 step 0 do {
        waitUntil {(!isNull (findDisplay 49)) && {(!isNull (findDisplay 602))}}; // Check if Inventory and ESC dialogs are open
        (findDisplay 49) closeDisplay 2; // Close ESC dialog
        (findDisplay 602) closeDisplay 2; // Close Inventory dialog
    };
};

[] spawn gonzka_fnc_initQuest;
[] spawn gonzka_fnc_checkWinFailConditions;
[] spawn gonzka_fnc_killerLeftGame;

loadingText = "GameStarted";

if !(matchInProgress) then {
    matchInProgress = true; publicvariable "matchInProgress";
	totalGenerators = count allPlayers;
	if (totalGenerators > 5) then { //MAX 5
	    totalGenerators = 5;
	};
	publicvariable "totalGenerators";
};

diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["--------------- End of Intruders Client Init: Total Execution Time %1 seconds ---------------",(diag_tickTime - _timeStamp)];
diag_log "----------------------------------------------------------------------------------------------------";