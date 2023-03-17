// Script parameters
params [["_lockpick_target", objNull]];

// Attempt to lockpick
private _picked = [] call pizza_fnc_hud_lockpick;

// Lockpicked failed
if !(_picked) exitWith {
    ["play", _lockpick_target] remoteExecCall ["BIS_fnc_carAlarm"];
    false;
};

[_lockpick_target,false] remoteExec ["lock"];

private _escapeVehicle = localize "STR_GAME_EscapeVehicle";
if (_lockpick_target isEqualTo escapeVehicle_1) then {
    _escapeVehicle = _escapeVehicle + " #1";
} else {
    _escapeVehicle = _escapeVehicle + " #2";
};

["STR_SCORE_Lockpick",1250] call gonzka_fnc_addBloodpoints; 
[_escapeVehicle, "STR_GAME_SuccessLockpick", 10, "\intruders_mod\textures\gui\hud_escape.paa"] remoteExec ["gonzka_fnc_notification", [0, -2] select isDedicated];

_picked;