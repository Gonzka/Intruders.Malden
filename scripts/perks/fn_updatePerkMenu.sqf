/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         06.08.2021
	Description:	 Updates the available perks in the perk menu

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

disableSerialization;

private _display = findDisplay 9999;

private _inventory = _display displayCtrl 1500;
lbClear _inventory;

if (count (profileNamespace getVariable "intruders_perkInventory") < 1) exitWith {
	_inventory lbAdd format ["%1", localize "STR_GAME_InventoryEmpty"];
};

{
	private _displayName = getText (missionConfigFile >> "VirtualItems" >> _x >> "displayName");
	private _variable = getText (missionConfigFile >> "VirtualItems" >> _x >> "variable");
	private _description = getText (missionConfigFile >> "VirtualItems" >> _x >> "description");
	private _icon = getText (missionConfigFile >> "VirtualItems" >> _x >> "icon");
	_inventory lbAdd format ["%1", localize _displayName];
	_inventory lbSetData [(lbSize _inventory)-1, _variable];
	_inventory lbSetPicture [(lbSize _inventory)-1, _icon];
	_inventory lbSetTooltip [(lbSize _inventory)-1, format["%1\n\n%2", toUpper localize _displayName, localize _description]];
} forEach (profileNamespace getVariable "intruders_perkInventory");

lbSort _inventory;

call gonzka_fnc_updatePerkSlots;