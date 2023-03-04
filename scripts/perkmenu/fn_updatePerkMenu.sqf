/*
    Author:	Gonzka

    Updates the available perks in the perk menu
*/

disableSerialization;

private _display = findDisplay 9999;

private _inventory = _display displayCtrl 1500;
lbClear _inventory;

if (count (profileNamespace getVariable "intruders_perkInventory") < 1) exitWith {
	_inventory lbAdd format ["%1", localize "STR_GAME_InventoryEmpty"];
};

{
	if (_x find "skin_" != -1) exitWith {}; //Show only perks
	private _displayName = getText (missionConfigFile >> "VirtualItems" >> _x >> "displayName");
	private _variable = getText (missionConfigFile >> "VirtualItems" >> _x >> "variable");
	private _description = getText (missionConfigFile >> "VirtualItems" >> _x >> "description");
	private _icon = getText (missionConfigFile >> "VirtualItems" >> _x >> "icon");
	private _side = getText (missionConfigFile >> "VirtualItems" >> _x >> "side");
	_inventory lbAdd format ["%1", localize _displayName];
	_inventory lbSetData [(lbSize _inventory)-1, _variable];
	_inventory lbSetPicture [(lbSize _inventory)-1, _icon];
	_inventory lbSetTooltip [(lbSize _inventory)-1, format["%1\n\n%2", toUpper localize _displayName, localize _description]];
	if ((str playerSide) isEqualTo _side) then {
		_inventory lbSetColor [(lbSize _inventory)-1, [0, 1, 0, 1]];
	} else {
		_inventory lbSetColor [(lbSize _inventory)-1, [1, 0, 0, 1]];
	};
} forEach (profileNamespace getVariable "intruders_perkInventory");

lbSort _inventory;

call gonzka_fnc_updatePerkSlots;