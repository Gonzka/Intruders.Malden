/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         10.10.2020
	Description:	 Creates an interaction with a chest

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

params [
    ["_chest", objNull, [objNull]]
];

private _actionID = [ 
    _chest, 
    localize "STR_GAME_Chest",  
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_requestLeadership_ca.paa",  
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_requestLeadership_ca.paa", 
    "_this distance _target < 2 && side _this != east && !(_target getVariable ['looted', false])",
    "_this distance _target < 2 && side _this != east",
    {	
		playSound3D ["a3\sounds_f\sfx\objects\upload_terminal\terminal_lock_close.wss", _target, false, getPosASL _target, 4, 1, 20];
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	},
    {
	    params ["_target", "_caller", "_actionId", "_arguments", "_progress", "_maxProgress"];
		private _elapsedTime = _progress / 24 * _duration;
		_target setVariable ["duration", _duration - _elapsedTime, true];
	},  
    {
	    [_target] spawn gonzka_fnc_openChest;
		playSound3D ["a3\sounds_f\sfx\objects\upload_terminal\terminal_lock_open.wss", _target, false, getPosASL _target, 4, 1, 20];
		[player, ""] remoteExec ["switchMove"];
	},
    {
		[_target, _target getVariable "duration"] remoteExecCall ["gonzka_fnc_setHoldActionDuration", [0, -2] select isDedicated];
	    if !(_target getVariable ["looted", false]) then {
		    [player, ""] remoteExec ["switchMove"];
		};
	},
    [],  
    10,  
    nil,  
    true,  
    false 
] call BIS_fnc_holdActionAdd;	

_chest setVariable ["actionID", _actionID, true];