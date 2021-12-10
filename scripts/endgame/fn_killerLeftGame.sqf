/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         14.10.2020
	Description:	 Ends the mission when the killer disconnects

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

waitUntil {isNil "Killer"}; 

sleep 1;

["KillerLeft",true,10] remoteExecCall ['BIS_fnc_endMission',0];

call gonzka_fnc_scoreboard;