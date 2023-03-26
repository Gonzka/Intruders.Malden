/*
    Author:	Gonzka

    Ends the mission when the killer disconnects
*/

waitUntil {isNil "Killer"}; 

["KillerLeft",true,12] remoteExecCall ['BIS_fnc_endMission',0];

[] spawn gonzka_fnc_scoreboard;