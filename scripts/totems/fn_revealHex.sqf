/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         05.09.2021
	Description:	 Hex Reveal Notification 

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

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