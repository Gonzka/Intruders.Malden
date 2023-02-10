/*
    Author: Bryan "Tonic" Boardwine

    Starts a countdown.
*/

disableSerialization;
"Timer" cutRsc ["timer","PLAIN"];
private _uiDisp = uiNamespace getVariable "timer";
private _timer = _uiDisp displayCtrl 38301;
private _time = time + 1800; //30 minutes
private _endgameTimeSet = false;

for "_i" from 0 to 1 step 0 do {
    if (isNull _uiDisp) then {
        "Timer" cutRsc ["timer","PLAIN"];
        _uiDisp = uiNamespace getVariable "timer";
        _timer = _uiDisp displayCtrl 38301;
    };
    if (round(_time - time) < 1) exitWith {};
    if (endgameCountdown && !_endgameTimeSet) then {_endgameTimeSet = true; _time = time + 180}; //Set the timer to the endgame time of 3 minutes
    _timer ctrlSetText format ["%1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
    if (_time - time < 180) then {_timer ctrlSetTextColor [1, 0, 0, 1]};
    sleep 0.08;
};
"Timer" cutText["","PLAIN"];

//Kill survivor when time is up
if (isNull objectParent player && {playerSide isEqualTo civilian}) then {
    [player, "Acts_Stunned_Unconscious"] remoteExec ["switchMove"];
    [] spawn {
    	sleep 7; player setDamage 1;
    };
};

playSound "air_raid";
[1] spawn BIS_fnc_earthquake;