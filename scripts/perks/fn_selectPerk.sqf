/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         06.07.2021
	Description:	 ???

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

params [
	["_perkSlot", 1, [1]]
];

private _display = findDisplay 9999;
private _inventory = _display displayCtrl 1500;
private _perk = _inventory lbData (lbCurSel _inventory);

if (_perk isEqualTo "") exitWith {
	["STR_GAME_Error", "STR_GAME_NotSelected", 5, "\A3\ui_f\data\GUI\RscCommon\RscDebugConsole\warningcdc_ca.paa", true] spawn gonzka_fnc_notification;
};

//SIDE CONDITIONS
private _mySide = "";
if (playerSide isEqualTo east) then {
    _mySide = "killer";
} else {
    _mySide = "survivor";
};

private _side = getText (missionConfigFile >> "VirtualItems" >> _perk >> "side");

if (_side != _mySide && _side != "") exitWith {
	["STR_GAME_Error", "STR_GAME_NotForYourSide", 5, "\A3\ui_f\data\GUI\RscCommon\RscDebugConsole\warningcdc_ca.paa", true] spawn gonzka_fnc_notification;
};

//UPDATE ICON
private _icon = getText (missionConfigFile >> "VirtualItems" >> _perk >> "icon");

private _perkSlot1 = _display displayCtrl 1502;
private _perkSlot2 = _display displayCtrl 1503;
private _perkSlot3 = _display displayCtrl 1504;

private _perkVar = format ["intruders_activePerks_%1",if (playerSide isEqualTo east) then {"killer"} else {"survivor"}];
private _activePerks = profileNamespace getVariable _perkVar; //["","","",""];

if (_perk in _activePerks) exitWith {
	["STR_GAME_Error", "STR_GAME_AlreadyUsePerk", 5, "\A3\ui_f\data\GUI\RscCommon\RscDebugConsole\warningcdc_ca.paa", true] spawn gonzka_fnc_notification;
};

_activePerks set [_perkSlot - 1, _perk];
profileNamespace setVariable [_perkVar, _activePerks];
saveProfileNamespace;

player setVariable ["intruders_activePerks", _activePerks, true]; //PUBLIC VAR

call gonzka_fnc_updatePerkSlots;