/*
    Author:	Gonzka

    Ends the mission when the killer disconnects
*/

waitUntil {isNil "Killer"}; 

sleep 1;

["KillerLeft",true,12] remoteExecCall ['BIS_fnc_endMission',0];

call gonzka_fnc_scoreboard;