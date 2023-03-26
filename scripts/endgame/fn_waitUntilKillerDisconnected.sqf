/*
    Author:	Gonzka

    Ends the mission if the killer disconnects
*/

waitUntil {isNil "Killer"}; 

["KillerDisconnected",true,12] remoteExecCall ['BIS_fnc_endMission',0];

[] spawn gonzka_fnc_scoreboard;