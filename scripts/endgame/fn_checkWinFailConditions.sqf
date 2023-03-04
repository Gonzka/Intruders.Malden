/*
    Author:	Gonzka

    Ends the mission when no survivor is left
*/

waitUntil {{side _x isEqualTo civilian && isNull objectParent _x} count playableUnits < 1};

sleep 1;

if (intrudersWin) then {
    ["IntrudersWin",playerSide isEqualTo civilian,12] remoteExecCall ['BIS_fnc_endMission',0];
} else {
    if (playerSide isEqualTo east && (player getVariable "quest_kills") > 0) then { //At least 1 kill to avoid the blood points being awarded for disconnecting players
        ["STR_SCORE_NoOneEscaped",2500] call gonzka_fnc_addBloodpoints;
        quest_killAll = true; //QUEST
    };
    ["KillerWin",playerSide isEqualTo east,12] remoteExecCall ['BIS_fnc_endMission',0];
};

sleep 1;

call gonzka_fnc_scoreboard;