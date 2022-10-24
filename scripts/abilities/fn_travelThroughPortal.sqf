/*
    Author:	Gonzka

    Teleportation from one portal to another
*/

params [
    ["_portal", objNull, [objNull]]
];

if (portalTravelInUse) exitWith { titleText [localize "STR_GAME_AbilityCooldown", "PLAIN"]; };

private _currentPortal = getPos player nearestObject "Land_ShellCrater_02_large_F";
if (_portal == _currentPortal) exitWith { 
    ["STR_GAME_Error", "STR_GAME_PortalTooClose", 5, "\A3\ui_f\data\GUI\RscCommon\RscDebugConsole\warningcdc_ca.paa", true] spawn gonzka_fnc_notification;
};

titleCut ["","BLACK OUT",1.5];

portalTravelInUse = true;

disableUserInput true;

[player,"Acts_Executioner_Squat"] remoteExec ["switchMove"]; //Acts_JetsCrewaidLCrouch_in
[_currentPortal] remoteExec ["gonzka_fnc_portalBlastWave"];
[1] remoteExec ["BIS_fnc_earthquake"];
sleep 1;
[_portal] remoteExec ["gonzka_fnc_portalBlastWave"];
sleep 0.5;

player setVariable ["undetectable", true, true];
player setPos getPos _portal;
[player,"Acts_JetsCrewaidLCrouch_out"] remoteExec ["switchMove"];

sleep 4;

[player,""] remoteExec ["switchMove"];
disableUserInput false;

titleCut ["","BLACK IN",1];

["STR_SCORE_PortalTravel",50] call gonzka_fnc_addFunds;

//QUEST
quest_portalTravels = quest_portalTravels + 1;

[] spawn { //COOLDOWN
    sleep 3;
    player setVariable ["undetectable", false, true];
    sleep 7;
    portalTravelInUse = false;
};