/*
    Author:	Gonzka

    Starts and monitors the knocked out state
*/

params [
    ["_unit",objNull,[objNull]],
    ["_shooter",objNull,[objNull]]
];

if (isNull _unit || isNull _shooter) exitWith {knockout = false;};

if (!knockout) then {
	knockout = true;
	
	["STR_SCORE_Stun",1000] remoteExecCall ["gonzka_fnc_addBloodpoints",_shooter];
	
	//QUEST
	private _stuns = _shooter getVariable "quest_stuns";
	_shooter setVariable ["quest_stuns",_stuns + 1,true];
	
	player setUnconscious true;
	sleep 3;
	player setUnconscious false;
	player playMoveNow "Incapacitated";
	sleep 1; //TESTING
	[player,"AmovPpneMstpSrasWrflDnon"] remoteExecCall ["switchMove"];
	
	knockout = false;
};