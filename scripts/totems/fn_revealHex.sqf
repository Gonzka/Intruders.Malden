/*
    Author:	Gonzka

    Hex Reveal Notification
*/

params [
    ["_hex", "", [""]]
];

if (_hex isEqualTo "") exitWith {};

private _hexRevealVar = format ["reveal_%1", _hex];

if !(missionNamespace getVariable _hexRevealVar) then {
    missionNamespace setVariable [_hexRevealVar, true, true];
    
    private _icon = getText (missionConfigFile >> "VirtualItems" >> _hex >> "icon");
    private _name = getText (missionConfigFile >> "VirtualItems" >> _hex >> "displayName");
    ["STR_GAME_Cursed", _name, 5, _icon] remoteExec ["gonzka_fnc_notification", civilian];
};