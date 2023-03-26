/*
    Author:	Gonzka

    Regularly ends the mission
*/

waitUntil {{side _x isEqualTo civilian && isNull objectParent _x} count playableUnits < 1};

if (playerSide isEqualTo east && player getVariable "quest_kills" >= (civilian countSide allPlayers) && player getVariable "quest_kills" > 0) then { //At least 1 kill to avoid bloodpoints being awarded for disconnected players
    ["STR_SCORE_NoOneEscaped",2500] call gonzka_fnc_addBloodpoints;
    quest_killAll = true; //QUEST
};

["MatchFinished",true,12] remoteExecCall ['BIS_fnc_endMission',0];

[] spawn gonzka_fnc_scoreboard;