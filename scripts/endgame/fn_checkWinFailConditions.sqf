/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         14.10.2020
	Description:	 Ends the mission when no survivor is left

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

waitUntil {{side _x isEqualTo civilian && isNull objectParent _x} count playableUnits < 1};

sleep 1;

if (intrudersWin) then {
    ["IntrudersWin",playerSide isEqualTo civilian,10] remoteExecCall ['BIS_fnc_endMission',0];
} else {
    if (playerSide isEqualTo east && (player getVariable "quest_kills") > 0) then { //At least 1 kill to avoid the blood points being awarded for disconnecting players
	    ["STR_SCORE_NoOneEscaped",2500] call gonzka_fnc_addFunds; 
		quest_killAll = true; //QUEST
	};
    ["KillerWin",playerSide isEqualTo east,10] remoteExecCall ['BIS_fnc_endMission',0];
};

sleep 1;

call gonzka_fnc_scoreboard;